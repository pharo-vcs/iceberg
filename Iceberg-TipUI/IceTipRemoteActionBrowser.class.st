Class {
	#name : 'IceTipRemoteActionBrowser',
	#superclass : 'IceTipHistoryActionBrowser',
	#instVars : [
		'remotePanel',
		'remoteLabel'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'commands' }
IceTipRemoteActionBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	"No commands to add"
]

{ #category : 'instance creation' }
IceTipRemoteActionBrowser class >> onRepositoryModel: aRepository [
	^ self subclassResponsibility
]

{ #category : 'layout' }
IceTipRemoteActionBrowser >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 5;
		add: (SpBoxLayout newLeftToRight
				vAlignCenter;
				spacing: 5;
				add: remoteLabel expand: false; 
				add: remotePanel;
				yourself)
			expand: false;
		add: commitsPanel withConstraints: [ :c | c spec: #panelSpec ];
		add: actionButtonBar expand: false;
		yourself
]

{ #category : 'initialization' }
IceTipRemoteActionBrowser >> initializePresenters [

	super initializePresenters.
	remoteLabel := self newLabel
		label: self labelForRemotePanel;
		yourself.
	remotePanel := self
		instantiate: IceTipSelectRemotePresenter
		on: self model.
	remotePanel remoteList
		whenSelectedItemChangedDo: [ :remoteModel | self moveToRemote: remoteModel ].

]

{ #category : 'initialization' }
IceTipRemoteActionBrowser >> initializeWindow: aWindow [

	super initializeWindow: aWindow.
	
	aWindow bindKeyCombination: $s meta toAction: [ self accept ]
]

{ #category : 'initialization' }
IceTipRemoteActionBrowser >> labelForRemotePanel [

	^ self subclassResponsibility
]

{ #category : 'accessing - ui' }
IceTipRemoteActionBrowser >> mainList [

	^ commitsPanel commitList
]

{ #category : 'accessing - ui' }
IceTipRemoteActionBrowser >> remotePanel [

	^ remotePanel
]

{ #category : 'accessing - ui' }
IceTipRemoteActionBrowser >> remotePanel: aSpPresenter [

	remotePanel := aSpPresenter
]
