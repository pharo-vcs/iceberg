"
I report the progress of a git operation from its libgit2 callbacks. Callbacks can arrive thousands of times per second, so I announce IceTaskProgressed at most every 100 milliseconds, plus when the operation completes. I answer the code the callback must return to libgit2: non-zero aborts the operation, which is how a running task is cancelled.
"
Class {
	#name : 'IceProgress',
	#superclass : 'Object',
	#instVars : [
		'lastReport'
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
	"aBlock is only evaluated when announcing, so ignored callbacks stay cheap"

	| now task |
	task := IceTaskList default runningTask.
	(task notNil and: [ task isCancelRequested ]) ifTrue: [ ^ -1 ].
	now := Time millisecondClockValue.
	(current = max or: [ now - lastReport >= 100 ]) ifFalse: [ ^ 0 ].
	lastReport := now.
	Iceberg announcer announce: ((IceTaskProgressed task: task)
			 title: aBlock value;
			 current: current;
			 max: max;
			 yourself).
	^ 0
]
