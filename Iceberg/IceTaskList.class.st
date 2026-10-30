"
I run IceTasks one after another in a single background process, which exists only while I have work. Adding a task with the same key as a queued or running one answers the existing task. I announce changes through Iceberg's announcer and depend on no UI.
"
Class {
	#name : 'IceTaskList',
	#superclass : 'Object',
	#instVars : [
		'queue',
		'running',
		'worker',
		'lock'
	],
	#classInstVars : [
		'default'
	],
	#category : 'Iceberg-Tasks',
	#package : 'Iceberg',
	#tag : 'Tasks'
}

{ #category : 'accessing' }
IceTaskList class >> default [

	^ default ifNil: [ default := self new ]
]

{ #category : 'running' }
IceTaskList >> add: aTask [
	"Answer the task that will do the work: aTask, or the one with the same key already here"

	| existing |
	lock critical: [
			existing := self taskWithKey: aTask key.
			existing ifNil: [
					queue addLast: aTask.
					self ensureWorker ] ].
	existing ifNotNil: [ ^ existing ].
	aTask announce: IceTaskQueued.
	^ aTask
]

{ #category : 'running' }
IceTaskList >> cancel: aTask [
	"A queued task stops here. A running task is asked to stop at its next safe point"

	| wasQueued |
	lock critical: [
			wasQueued := queue includes: aTask.
			wasQueued
				ifTrue: [ queue remove: aTask ]
				ifFalse: [ aTask requestCancel ] ].
	wasQueued ifTrue: [ aTask beCancelled ]
]

{ #category : 'running' }
IceTaskList >> ensureWorker [

	worker ifNotNil: [ ^ self ].
	worker := [ self runTasks ] forkNamed: 'Iceberg tasks'
]

{ #category : 'running' }
IceTaskList >> initialize [

	super initialize.
	queue := OrderedCollection new.
	lock := Mutex new
]

{ #category : 'running' }
IceTaskList >> isBusy: aRepository [

	^ lock critical: [ running notNil and: [ running repository = aRepository ] ]
]

{ #category : 'running' }
IceTaskList >> isIdle [

	^ lock critical: [ worker isNil ]
]

{ #category : 'running' }
IceTaskList >> nextTask [
	"Answer nil when there is no more work, and let the worker end in the same critical section so a concurrent #add: starts a new one"

	^ lock critical: [
			  running := queue ifEmpty: [ nil ] ifNotEmpty: [ queue removeFirst ].
			  running ifNil: [ worker := nil ].
			  running ]
]

{ #category : 'running' }
IceTaskList >> runTasks [

	| task |
	[ (task := self nextTask) notNil ] whileTrue: [ task run ]
]

{ #category : 'running' }
IceTaskList >> taskWithKey: aKey [

	(running notNil and: [ running key = aKey ]) ifTrue: [ ^ running ].
	^ queue detect: [ :each | each key = aKey ] ifNone: [ nil ]
]

{ #category : 'running' }
IceTaskList >> validateNotBusy: aRepository [
	"The running task may use the repository: a pull merges from inside its task"

	Processor activeProcess == worker ifTrue: [ ^ self ].
	(self isBusy: aRepository) ifTrue: [ IceRepositoryBusy signal: aRepository name , ' has a running task' ]
]
