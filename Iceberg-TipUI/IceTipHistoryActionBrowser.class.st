"
I'm a base browser for pull/push action browser.
"
Class {
	#name : 'IceTipHistoryActionBrowser',
	#superclass : 'IceTipBrowser',
	#instVars : [
		'commitsPanel',
		'actionButtonBar',
		'button'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'accessing' }
IceTipHistoryActionBrowser class >> defaultPreferredExtent [
	^ (800@600)
]

{ #category : 'actions' }
IceTipHistoryActionBrowser >> accept [

	button performAction
]

{ #category : 'accessing - ui' }
IceTipHistoryActionBrowser >> actionButtonBar [

	^ actionButtonBar
]

{ #category : 'private' }
IceTipHistoryActionBrowser >> closeWhenRepository: ann [

	(ann repository isNil or: [ 
		self model repositoryModel isModelOf: ann repository ]) ifFalse: [ 
		^ self ].
	
	self delete.

]

{ #category : 'accessing - ui' }
IceTipHistoryActionBrowser >> commitsPanel [

	^ commitsPanel
]

{ #category : 'accessing - ui' }
IceTipHistoryActionBrowser >> commitsPanel: aSpPresenter [

	commitsPanel := aSpPresenter
]

{ #category : 'initialization' }
IceTipHistoryActionBrowser >> initializePresenters [

	commitsPanel := self instantiate: IceTipHistoryBrowser on: self model.
	actionButtonBar := self newButtonBar.
	actionButtonBar add: (button := self newActionButton)
]

{ #category : 'actions' }
IceTipHistoryActionBrowser >> moveToRemote: aRemoteModel [

	aRemoteModel ifNil: [ ^ self ].
	
	self model useRemote: aRemoteModel.
	self model reset.
	self refreshCommits.
	self updateTitle
]

{ #category : 'private - factory' }
IceTipHistoryActionBrowser >> newActionButton [
	"Answer a new instance of SpButton to be placed at bottom, as the main action of the window."

	^ self subclassResponsibility
]

{ #category : 'accessing' }
IceTipHistoryActionBrowser >> refresh [

	self refreshCommits
]

{ #category : 'accessing' }
IceTipHistoryActionBrowser >> refreshCommits [

	commitsPanel refresh
]

{ #category : 'private' }
IceTipHistoryActionBrowser >> refreshWhenRepository: ann [

	(self model repositoryModel isModelOf: ann repository)
		ifFalse: [ ^ self ].
	self model reset.
	self refresh
]

{ #category : 'initialization' }
IceTipHistoryActionBrowser >> subscribeToAnnouncements [

	self announcer
		when: IceTipDiffRefreshed
		send: #refreshWhenRepository:
		to: self.

	Iceberg announcer weak
		when: IceRepositoryAnnouncement
		send: #refreshWhenRepository:
		to: self.
		
	Iceberg announcer weak
		when: IceRepositoryForgotten
		send: #closeWhenRepository:
		to: self

]
