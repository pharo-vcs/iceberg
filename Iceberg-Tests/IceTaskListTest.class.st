"
I test IceTaskList with tasks that do no git work.
"
Class {
	#name : 'IceTaskListTest',
	#superclass : 'TestCase',
	#instVars : [
		'list',
		'gate',
		'events'
	],
	#category : 'Iceberg-Tests',
	#package : 'Iceberg-Tests'
}

{ #category : 'running' }
IceTaskListTest >> blockedTask: aKey [

	^ IceTask key: aKey action: [ :task | gate wait ]
]

{ #category : 'running' }
IceTaskListTest >> setUp [

	super setUp.
	list := IceTaskList new.
	gate := Semaphore new.
	events := OrderedCollection new.
	Iceberg announcer when: IceTaskAnnouncement send: #add: to: events
]

{ #category : 'running' }
IceTaskListTest >> tearDown [

	Iceberg announcer unsubscribe: events.
	super tearDown
]

{ #category : 'tests' }
IceTaskListTest >> testCancelQueuedTask [

	| queued ran |
	ran := false.
	list add: (self blockedTask: #first).
	queued := list add: (IceTask key: #second action: [ :task | ran := true ]).
	list cancel: queued.
	gate signal.
	self waitUntilIdle.
	self deny: ran.
	self assert: queued state equals: #cancelled
]

{ #category : 'tests' }
IceTaskListTest >> testCancelRunningTaskStopsAtSafePoint [

	| task |
	task := list add: (IceTask key: #fetch action: [ :aTask | [ aTask isCancelRequested ] whileFalse: [ 1 milliSecond wait ] ]).
	list cancel: task.
	self waitUntilIdle.
	self assert: task state equals: #cancelled
]

{ #category : 'tests' }
IceTaskListTest >> testExecuteAnswersResult [

	self assert: (list execute: (IceTask key: #a action: [ :task | 42 ])) equals: 42
]

{ #category : 'tests' }
IceTaskListTest >> testExecuteInsideTaskDoesNotDeadlock [

	| result |
	result := list execute: (IceTask key: #outer action: [ :task | list execute: (IceTask key: #inner action: [ :inner | 7 ]) ]).
	self assert: result equals: 7
]

{ #category : 'tests' }
IceTaskListTest >> testExecuteSignalsFailureInCaller [

	self
		should: [ list execute: (IceTask key: #a action: [ :task | Error signal: 'boom' ]) ]
		raise: Error
		whoseDescriptionIncludes: 'boom'
		description: 'the failure reaches the caller'
]

{ #category : 'tests' }
IceTaskListTest >> testFailureIsPublishedWithItsError [

	| task |
	task := list add: (IceTask key: #bad action: [ :aTask | Error signal: 'boom' ]).
	self waitUntilIdle.
	self assert: task state equals: #failed.
	self assert: task error messageText equals: 'boom'.
	self assert: (events anySatisfy: [ :each | each class = IceTaskFailed ])
]

{ #category : 'tests' }
IceTaskListTest >> testMergedExecuteWakesEveryWaiter [

	| results finished |
	results := OrderedCollection new.
	finished := Semaphore new.
	list add: (self blockedTask: #first).
	2 timesRepeat: [
			[
				results add: (list execute: (IceTask key: #same action: [ :task | 1 ])).
				finished signal ] fork ].
	10 milliSeconds wait.
	gate signal.
	finished wait.
	finished wait.
	self assert: results asArray equals: #( 1 1 )
]

{ #category : 'tests' }
IceTaskListTest >> testProgressAbortsWhenRunningTaskIsCancelled [

	| list2 started task code |
	list2 := IceTaskList default.
	started := Semaphore new.
	task := list2 add: (IceTask key: self action: [ :aTask |
				         started signal.
				         gate wait.
				         code := IceProgress new reportTitle: [ 'work' ] current: 1 max: 2 ]).
	started wait.
	list2 cancel: task.
	gate signal.
	[ task state = #cancelled ] whileFalse: [ 1 milliSecond wait ].
	self assert: code equals: -1
]

{ #category : 'tests' }
IceTaskListTest >> testProgressIsThrottledAndAlwaysReportsCompletion [

	| progress |
	progress := IceProgress new.
	1 to: 1000 do: [ :i | self assert: (progress reportTitle: [ 'work' ] current: i max: 1000) equals: 0 ].
	self assert: (events select: [ :each | each class = IceTaskProgressed ]) size < 20.
	self assert: events last current equals: 1000
]

{ #category : 'tests' }
IceTaskListTest >> testRunningTaskCanUseItsOwnRepository [

	| repository task |
	repository := IceLibgitRepository new
		              name: 'busy';
		              yourself.
	task := list add: (IceTask repository: repository operation: #pull action: [ :aTask | list validateNotBusy: repository ]).
	self waitUntilIdle.
	self assert: task state equals: #finished
]

{ #category : 'tests' }
IceTaskListTest >> testRunningTaskMakesItsRepositoryBusy [

	| repository other started |
	repository := IceLibgitRepository new
		              name: 'busy';
		              yourself.
	other := IceLibgitRepository new
		         name: 'other';
		         yourself.
	started := Semaphore new.
	list add: (IceTask repository: repository operation: #fetch action: [ :task |
				 started signal.
				 gate wait ]).
	started wait.
	self should: [ list validateNotBusy: repository ] raise: IceRepositoryBusy.
	self shouldnt: [ list validateNotBusy: other ] raise: IceRepositoryBusy.
	gate signal.
	self waitUntilIdle.
	self shouldnt: [ list validateNotBusy: repository ] raise: IceRepositoryBusy
]

{ #category : 'tests' }
IceTaskListTest >> testSameKeyAnswersExistingTask [

	| first |
	first := list add: (self blockedTask: #fetch).
	self assert: (list add: (self blockedTask: #fetch)) identicalTo: first.
	gate signal.
	self waitUntilIdle.
	self assert: first state equals: #finished
]

{ #category : 'tests' }
IceTaskListTest >> testTasksRunInOrder [

	| order |
	order := OrderedCollection new.
	list add: (self blockedTask: #first).
	list add: (IceTask key: #second action: [ :task | order add: #second ]).
	list add: (IceTask key: #third action: [ :task | order add: #third ]).
	gate signal.
	self waitUntilIdle.
	self assert: order asArray equals: #( second third )
]

{ #category : 'tests' }
IceTaskListTest >> testWorkerRestartsAfterIdle [

	| task |
	list add: (IceTask key: #first action: [ :aTask |  ]).
	self waitUntilIdle.
	task := list add: (IceTask key: #second action: [ :aTask |  ]).
	self waitUntilIdle.
	self assert: task state equals: #finished
]

{ #category : 'running' }
IceTaskListTest >> waitUntilIdle [

	[ list isIdle ] whileFalse: [ 1 milliSecond wait ]
]
