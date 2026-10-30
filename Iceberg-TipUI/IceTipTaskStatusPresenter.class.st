"
I show the running IceTask of the default IceTaskList: its title, a progress bar and a button to cancel it. Announcements arrive from background processes, so I always update myself through #defer:.
"
Class {
	#name : 'IceTipTaskStatusPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'label',
		'progressBar',
		'stopButton',
		'task'
	],
	#category : 'Iceberg-TipUI',
	#package : 'Iceberg-TipUI'
}

{ #category : 'initialization' }
IceTipTaskStatusPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  spacing: 5;
		  add: label;
		  add: progressBar;
		  add: stopButton expand: false;
		  yourself
]

{ #category : 'initialization' }
IceTipTaskStatusPresenter >> initializePresenters [

	label := self newLabel.
	progressBar := self instantiate: SpProgressBarPresenter.
	stopButton := self newButton
		              label: 'Stop';
		              action: [ self stop ];
		              yourself.
	self subscribe
]

{ #category : 'updating' }
IceTipTaskStatusPresenter >> stop [

	task ifNil: [ ^ self ].
	stopButton disable.
	label label: 'Cancelling...'.
	IceTaskList default cancel: task
]

{ #category : 'initialization' }
IceTipTaskStatusPresenter >> subscribe [

	Iceberg announcer weak when: IceTaskAnnouncement send: #taskChanged: to: self
]

{ #category : 'updating' }
IceTipTaskStatusPresenter >> taskChanged: anAnnouncement [

	self defer: [ anAnnouncement updateTaskStatus: self ]
]

{ #category : 'updating' }
IceTipTaskStatusPresenter >> taskEnded [

	task := nil.
	self hide
]

{ #category : 'updating' }
IceTipTaskStatusPresenter >> taskFailed: aTask [

	self taskEnded.
	[ aTask error signal ]
		on: IceError , IceWarning
		do: [ :anError | anError acceptError: (IceTipInteractiveErrorVisitor newContext: self repository: aTask repository) ]
]

{ #category : 'updating' }
IceTipTaskStatusPresenter >> taskFinished: aTask [

	self taskEnded.
	Iceberg announcer announce: (IceRepositoryModified for: aTask repository)
]

{ #category : 'updating' }
IceTipTaskStatusPresenter >> taskStarted: aTask [

	task := aTask.
	label label: 'Working...'.
	progressBar indeterminate.
	stopButton enable.
	self show
]

{ #category : 'updating' }
IceTipTaskStatusPresenter >> title: aString current: current max: max [

	label label: aString.
	max > 0 ifTrue: [ progressBar fixedPercentage: 100 * current // max ]
]
