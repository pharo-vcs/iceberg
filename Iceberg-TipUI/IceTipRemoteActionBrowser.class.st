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
	
	^ SpecBoxLayout newVertical 
		add: #remotePanel withConstraints: [ :c | c height: self inputTextHeight ];
		add: #commitsPanel withConstraints: [ :c | c spec: #panelSpec ];
		add: #actionPanel withConstraints: [ :c | c height: self iceActionPanelHeight ];
		yourself
]

{ #category : #'instance creation' }
IceTipRemoteActionBrowser class >> onRepositoryModel: aRepository [
	^ self subclassResponsibility
]

{ #category : #initialization }
IceTipRemoteActionBrowser >> initializeWidgets [
	super initializeWidgets.
	
	remotePanel := self instantiate: IceTipSelectRemotePresenter on: self model. 
	remotePanel remoteList whenSelectedItemChanged: [ :remoteModel | 
		self moveToRemote: remoteModel  ].
		
	self focusOrder 
		add: self commitsPanel;
		add: self actionPanel;
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
