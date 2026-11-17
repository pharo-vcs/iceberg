"
I report the progress of a git operation from its libgit2 callbacks. Callbacks can arrive thousands of times per second, so I announce IceTaskProgressed at most every 100 milliseconds, plus when the operation completes. I answer the code the callback must return to libgit2: non-zero aborts the operation, which is how a running task is cancelled.
"
Class {
	#name : 'IceProgress',
	#superclass : 'Object',
	#instVars : [
		'lastReport',
		'lastCurrent'
	],
	#category : 'Iceberg-Tasks',
	#package : 'Iceberg',
	#tag : 'Tasks'
}

{ #category : 'reporting' }
IceProgress >> initialize [

	super initialize.
	lastReport := 0
]

{ #category : 'reporting' }
IceProgress >> reportTitle: aBlock current: current max: max [
	"aBlock is only evaluated when announcing, so ignored callbacks stay cheap.
	libgit2 can repeat the last value many times, so completion is reported once.
	Subscribers run in their own process: libgit2 waits for this callback, and the operation may hold the UI process, so a subscriber that blocks or fails here would freeze the image"

	| now task announcement isCompletion |
	task := IceTaskList default runningTask.
	(task notNil and: [ task isCancelRequested ]) ifTrue: [ ^ -1 ].
	now := Time millisecondClockValue.
	isCompletion := current = max and: [ current ~= lastCurrent ].
	(isCompletion or: [ now - lastReport >= 100 ]) ifFalse: [ ^ 0 ].
	lastReport := now.
	lastCurrent := current.
	announcement := (IceTaskProgressed task: task)
		                title: aBlock value;
		                current: current;
		                max: max;
		                yourself.
	[ Iceberg announcer announce: announcement ] forkNamed: 'Iceberg progress'.
	^ 0
]
