"
I am a unit of background work in an IceTaskList. My key identifies the work: a list merges tasks with equal keys. My action is a one-argument block that receives me, so it can report progress and check #isCancelRequested.
"
Class {
	#name : 'IceTask',
	#superclass : 'Object',
	#instVars : [
		'key',
		'action',
		'state',
		'error',
		'cancelRequested',
		'repository',
		'done',
		'result'
	],
	#category : 'Iceberg-Tasks',
	#package : 'Iceberg',
	#tag : 'Tasks'
}

{ #category : 'instance creation' }
IceTask class >> key: aKey action: aBlock [

	^ self new
		  key: aKey;
		  action: aBlock;
		  yourself
]

{ #category : 'instance creation' }
IceTask class >> repository: aRepository operation: aSymbol action: aBlock [

	^ (self key: aRepository -> aSymbol action: aBlock)
		  repository: aRepository;
		  yourself
]

{ #category : 'accessing' }
IceTask >> action: aBlock [

	action := aBlock
]

{ #category : 'running' }
IceTask >> announce: anAnnouncementClass [

	Iceberg announcer announce: (anAnnouncementClass task: self)
]

{ #category : 'running' }
IceTask >> basicRun [

	state := #running.
	self announce: IceTaskStarted.
	[ result := action value: self ]
		on: Error
		do: [ :anError |
				error := anError.
				state := #failed.
				^ self announce: IceTaskFailed ].
	cancelRequested ifTrue: [
			state := #cancelled.
			^ self announce: IceTaskCancelled ].
	state := #finished.
	self announce: IceTaskFinished
]

{ #category : 'running' }
IceTask >> beCancelled [

	state := #cancelled.
	self announce: IceTaskCancelled.
	done signal
]

{ #category : 'accessing' }
IceTask >> error [

	^ error
]

{ #category : 'running' }
IceTask >> executeDirectly [

	^ action value: self
]

{ #category : 'running' }
IceTask >> initialize [

	super initialize.
	state := #queued.
	cancelRequested := false.
	done := Semaphore new
]

{ #category : 'running' }
IceTask >> isCancelRequested [

	^ cancelRequested
]

{ #category : 'accessing' }
IceTask >> key [

	^ key
]

{ #category : 'accessing' }
IceTask >> key: aKey [

	key := aKey
]

{ #category : 'accessing' }
IceTask >> repository [

	^ repository
]

{ #category : 'accessing' }
IceTask >> repository: aRepository [

	repository := aRepository
]

{ #category : 'running' }
IceTask >> requestCancel [

	cancelRequested := true
]

{ #category : 'running' }
IceTask >> run [
	"Failures belong to the task: they are published with the exception, so whoever follows the task decides how to show them"

	[ self basicRun ] ensure: [ done signal ]
]

{ #category : 'accessing' }
IceTask >> state [

	^ state
]

{ #category : 'running' }
IceTask >> waitForResult [
	"Block until I end and answer my result, signalling my failure in the caller. Several processes can wait for a merged task, so each one wakes the next"

	done wait.
	done signal.
	error ifNotNil: [ error signal ].
	^ result
]
