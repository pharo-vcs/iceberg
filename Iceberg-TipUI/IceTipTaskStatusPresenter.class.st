"
I am a small window showing the running IceTask of the default IceTaskList: its title, a progress bar and a button to cancel it. I open when a task starts and close when the list is empty, so progress is visible from any window. Announcements arrive from background processes, so I always update myself through #defer:.
"
Class {
	#name : 'IceTipTaskStatusPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'progressBar',
		'stopButton',
		'task'
	],
	#classInstVars : [
		'current'
	],
	#category : 'Iceberg-TipUI',
	#package : 'Iceberg-TipUI'
}

{ #category : 'class initialization' }
IceTipTaskStatusPresenter class >> closed [

	current := nil
]

{ #category : 'class initialization' }
IceTipTaskStatusPresenter class >> initialize [

	IceTaskList default runInPlaceCondition: [ UIManager default uiProcess == Processor activeProcess ].
	Iceberg announcer unsubscribe: self.
	Iceberg announcer when: IceTaskStarted send: #taskStarted: to: self
]

{ #category : 'class initialization' }
IceTipTaskStatusPresenter class >> openFor: aTask [
	"Opening runs a UI cycle, which can close a previous window and reset current.
	A quick task can end before the window subscribes, so it checks the list once open"

	| presenter |
	presenter := current ifNil: [
			             current := self newApplication: SpApplication defaultApplication.
			             current open.
			             current ifNil: [ ^ self ] ].
	presenter taskStarted: aTask.
	IceTaskList default isIdle ifTrue: [ presenter taskListEmptied ]
]

{ #category : 'class initialization' }
IceTipTaskStatusPresenter class >> taskStarted: anAnnouncement [

	SpApplication defaultApplication defer: [ self openFor: anAnnouncement task ]
]

{ #category : 'initialization' }
IceTipTaskStatusPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		  spacing: 5;
		  add: progressBar;
		  add: stopButton expand: false;
		  yourself
]

{ #category : 'initialization' }
IceTipTaskStatusPresenter >> initializePresenters [

	progressBar := self instantiate: SpProgressBarPresenter.
	stopButton := self newButton
		              label: 'Cancel';
		              action: [ self stop ];
		              disable;
		              yourself.
	self subscribe
]

{ #category : 'initialization' }
IceTipTaskStatusPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter
		title: 'Iceberg';
		initialExtent: 350 @ 60;
		whenClosedDo: [
				Iceberg announcer unsubscribe: self.
				self class closed ]
]

{ #category : 'updating' }
IceTipTaskStatusPresenter >> showTitle: aString [

	self withWindowDo: [ :window | window title: aString ]
]

{ #category : 'updating' }
IceTipTaskStatusPresenter >> stop [

	task ifNil: [ ^ self ].
	stopButton disable.
	self showTitle: 'Cancelling'.
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
	progressBar fixedPercentage: 0.
	stopButton disable
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
	aTask repository ifNotNil: [ :repository | Iceberg announcer announce: (IceRepositoryModified for: repository) ]
]

{ #category : 'updating' }
IceTipTaskStatusPresenter >> taskListEmptied [

	self class closed.
	self withWindowDo: [ :window | window close ]
]

{ #category : 'updating' }
IceTipTaskStatusPresenter >> taskStarted: aTask [

	task := aTask.
	self showTitle: aTask title.
	progressBar indeterminate.
	stopButton enable
]

{ #category : 'updating' }
IceTipTaskStatusPresenter >> title: aString current: current max: max [

	(task notNil and: [ task isCancelRequested ]) ifFalse: [ self showTitle: aString ].
	max > 0 ifTrue: [ progressBar fixedPercentage: 100 * current // max ]
]
