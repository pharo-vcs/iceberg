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
		'cancelRequested'
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

{ #category : 'accessing' }
IceTask >> action: aBlock [

	action := aBlock
]

{ #category : 'running' }
IceTask >> announce: anAnnouncementClass [

	Iceberg announcer announce: (anAnnouncementClass task: self)
]

{ #category : 'running' }
IceTask >> beCancelled [

	state := #cancelled.
	self announce: IceTaskCancelled
]

{ #category : 'accessing' }
IceTask >> error [

	^ error
]

{ #category : 'running' }
IceTask >> initialize [

	super initialize.
	state := #queued.
	cancelRequested := false
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

{ #category : 'running' }
IceTask >> progress [

	self announce: IceTaskProgressed
]

{ #category : 'running' }
IceTask >> requestCancel [

	cancelRequested := true
]

{ #category : 'running' }
IceTask >> run [
	"Failures belong to the task: they are published with the exception, so whoever follows the task decides how to show them"

	state := #running.
	self announce: IceTaskStarted.
	[ action value: self ]
		on: Error
		do: [ :anError |
				error := anError.
				state := #failed.
				^ self announce: IceTaskFailed ].
	cancelRequested ifTrue: [ ^ self beCancelled ].
	state := #finished.
	self announce: IceTaskFinished
]

{ #category : 'accessing' }
IceTask >> state [

	^ state
]
