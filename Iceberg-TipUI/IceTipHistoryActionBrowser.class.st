"
I'm a base browser for pull/push action browser.
"
Class {
	#name : #IceTipHistoryActionBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'commitsPanel',
		'actionButtonBar',
		'button'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #actions }
IceTipHistoryActionBrowser >> accept [

	button performAction
]

{ #category : #'accessing ui' }
IceTipHistoryActionBrowser >> actionButtonBar [

	^ actionButtonBar
]

{ #category : #'accessing ui' }
IceTipHistoryActionBrowser >> commitsPanel [

	^ commitsPanel
]

{ #category : #'accessing ui' }
IceTipHistoryActionBrowser >> commitsPanel: aSpPresenter [

	commitsPanel := aSpPresenter
]

{ #category : #accessing }
IceTipHistoryActionBrowser >> initialExtentForWindow [

	^ (800@600) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipHistoryActionBrowser >> initializePresenters [

	super initializePresenters.
	commitsPanel := self instantiate: IceTipHistoryBrowser on: self model.
	actionButtonBar := self newButtonBar.
	actionButtonBar add: (button := self newActionButton).

]

{ #category : #actions }
IceTipHistoryActionBrowser >> moveToRemote: aRemoteModel [

	aRemoteModel ifNil: [ ^ self ].
	
	self model useRemote: aRemoteModel.
	self model reset.
	self refreshCommits.
	self updateTitle
]

{ #category : #'private factory' }
IceTipHistoryActionBrowser >> newActionButton [
	"Answer a new instance of SpButton to be placed at bottom, as the main action of the window."

	^ self subclassResponsibility
]

{ #category : #accessing }
IceTipHistoryActionBrowser >> refresh [

	self refreshCommits
]

{ #category : #accessing }
IceTipHistoryActionBrowser >> refreshCommits [

	commitsPanel refresh
]

{ #category : #private }
IceTipHistoryActionBrowser >> refreshWhenRepository: ann [

	(self model repositoryModel isModelOf: ann repository)
		ifFalse: [ ^ self ].
	self model reset.
	self refresh
]

{ #category : #initialization }
IceTipHistoryActionBrowser >> subscribeToAnnouncements [

	self announcer
		when: IceTipDiffRefreshed
		send: #refreshWhenRepository:
		to: self.

	Iceberg announcer weak
		when: IceRepositoryAnnouncement
		send: #refreshWhenRepository:
		to: self
]
