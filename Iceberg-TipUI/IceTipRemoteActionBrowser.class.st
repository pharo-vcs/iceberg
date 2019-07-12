Class {
	#name : #IceTipRemoteActionBrowser,
	#superclass : #IceTipHistoryActionBrowser,
	#instVars : [
		'remotePanel'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipRemoteActionBrowser class >> defaultSpec [
	<spec: #default>
	
	^ SpBoxLayout newVertical 
		add: #remotePanel withConstraints: [ :c | c height: self inputTextHeight ];
		add: #commitsPanel withConstraints: [ :c | c spec: #panelSpec ];
		add: #actionButtonBar withConstraints: [ :c | c height: self buttonHeight ];
		yourself
]

{ #category : #'instance creation' }
IceTipRemoteActionBrowser class >> onRepositoryModel: aRepository [
	^ self subclassResponsibility
]

{ #category : #initialization }
IceTipRemoteActionBrowser >> initializeWidgets [
	super initializeWidgets.
	remotePanel := self
		instantiate: IceTipSelectRemotePresenter
		on: self model.
	remotePanel remoteList
		whenSelectedItemChangedDo: [ :remoteModel | self moveToRemote: remoteModel ].
	self focusOrder
		add: self commitsPanel;
		add: self actionButtonBar;
		add: self remotePanel
]

{ #category : #'accessing ui' }
IceTipRemoteActionBrowser >> remotePanel [
	^ remotePanel
]

{ #category : #'accessing ui' }
IceTipRemoteActionBrowser >> remotePanel: anObject [
	remotePanel := anObject
]
