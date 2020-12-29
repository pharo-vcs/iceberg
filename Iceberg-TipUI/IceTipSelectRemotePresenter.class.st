Class {
	#name : #IceTipSelectRemotePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'remoteLabel',
		'remoteList',
		'addButton',
		'model'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipSelectRemotePresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		  add: #remoteLabel width: self labelWidth;
		  add: #remoteList;
		  add: #addButton width: self iconWidth
]

{ #category : #'accessing ui' }
IceTipSelectRemotePresenter >> addButton [

	^ addButton
]

{ #category : #actions }
IceTipSelectRemotePresenter >> addRemote [

	(IceTipAddRemoteDialog on: self model repositoryModel) 
		onAccept: [ :newRemoteName | 
			self model reset.
			self refresh.
			self selectRemoteNamed: newRemoteName ];
		openDialogWithSpec.
]

{ #category : #accessing }
IceTipSelectRemotePresenter >> icon [

	^ self iconNamed: #add
]

{ #category : #initialization }
IceTipSelectRemotePresenter >> initializePresenters [

	remoteLabel := self newLabel
		label: 'Remote:';
		yourself.

	remoteList := self newDropList
		display: [ :each | each descriptionWithDecoration ];
		yourself.

	addButton := self newButton
		icon: self icon;
		action: [ self addRemote ];
		yourself.

	self refresh.
	self selectRemoteNamed: self model remoteModel name.

]

{ #category : #accessing }
IceTipSelectRemotePresenter >> label: aString [

	self remoteLabel label: aString
]

{ #category : #accessing }
IceTipSelectRemotePresenter >> model [

	^ model
]

{ #category : #accessing }
IceTipSelectRemotePresenter >> refresh [

	remoteList items: self model remoteModels
]

{ #category : #'accessing ui' }
IceTipSelectRemotePresenter >> remoteLabel [

	^ remoteLabel
]

{ #category : #'accessing ui' }
IceTipSelectRemotePresenter >> remoteList [

	^ remoteList
]

{ #category : #accessing }
IceTipSelectRemotePresenter >> selectRemoteNamed: aString [

	remoteList selectItem:
		(self model remoteModels detect: [ :each | each name = aString ])
]

{ #category : #initialization }
IceTipSelectRemotePresenter >> setModelBeforeInitialization: anObject [

	model := anObject
]
