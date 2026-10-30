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
IceTaskListTest >> testFailureIsPublishedWithItsError [

	| task |
	task := list add: (IceTask key: #bad action: [ :aTask | Error signal: 'boom' ]).
	self waitUntilIdle.
	self assert: task state equals: #failed.
	self assert: task error messageText equals: 'boom'.
	self assert: (events anySatisfy: [ :each | each class = IceTaskFailed ])
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
