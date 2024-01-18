Class {
	#name : 'IceTipSelectRemotePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'remoteList',
		'addButton',
		'model'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'accessing - ui' }
IceTipSelectRemotePresenter >> addButton [

	^ addButton
]

{ #category : 'actions' }
IceTipSelectRemotePresenter >> addRemote [

	((IceTipAddRemoteDialogPresenter 
		newApplication: self application 
		model: self model repositoryModel) 
		onAccept: [ :newRemoteName | 
			self model reset.
			self refresh.
			self selectRemoteNamed: newRemoteName ])
		asDialogWindow 
			centeredRelativeTo: self window;
			open
]

{ #category : 'layout' }
IceTipSelectRemotePresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		spacing: 3;
		add: remoteList;
		add: addButton expand: false;
		yourself
]

{ #category : 'accessing' }
IceTipSelectRemotePresenter >> icon [

	^ self iconNamed: #add
]

{ #category : 'initialization' }
IceTipSelectRemotePresenter >> initializePresenters [

	remoteList := self newDropList
		display: [ :each | each shortDescription ];
		yourself.

	addButton := self newButton
		addStyle: 'small';
		icon: self icon;
		action: [ self addRemote ];
		yourself
]

{ #category : 'accessing' }
IceTipSelectRemotePresenter >> label: aString [

	self remoteLabel label: aString
]

{ #category : 'accessing' }
IceTipSelectRemotePresenter >> model [

	^ model
]

{ #category : 'accessing' }
IceTipSelectRemotePresenter >> refresh [

	remoteList items: self model remoteModels
]

{ #category : 'accessing - ui' }
IceTipSelectRemotePresenter >> remoteList [

	^ remoteList
]

{ #category : 'accessing' }
IceTipSelectRemotePresenter >> selectRemoteNamed: aString [

	remoteList selectItem:
		(self model remoteModels detect: [ :each | each name = aString ])
]

{ #category : 'accessing - model' }
IceTipSelectRemotePresenter >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'initialization' }
IceTipSelectRemotePresenter >> updatePresenter [ 

	self refresh.
	self selectRemoteNamed: self model remoteModel name
]
