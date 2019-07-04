"
I'm a dialog to select a list of anything (used by branches now).
"
Class {
	#name : #IceGitHubSelectListModel,
	#superclass : #SpPresenter,
	#instVars : [
		'selectedItems',
		'listPanel',
		'selectButton',
		'acceptBlock'
	],
	#category : #'Iceberg-Plugin-GitHub-View'
}

{ #category : #specs }
IceGitHubSelectListModel class >> buttonLabel [
	^ 'Select'
]

{ #category : #api }
IceGitHubSelectListModel class >> defaultExtent [ 
	^ 550@500
]

{ #category : #specs }
IceGitHubSelectListModel class >> defaultSpec [
	<spec>
	^ SpBoxLayout newVertical
		add: #listPanel;
		add: #selectButton
			withConstraints: [ :constraints | constraints height: self buttonHeight ];
		yourself
]

{ #category : #specs }
IceGitHubSelectListModel class >> title [
	^ 'Select...'
]

{ #category : #actions }
IceGitHubSelectListModel >> confirmSelection [
	acceptBlock ifNotNil: [ 
		acceptBlock value: selectedItems ].
	self window delete
]

{ #category : #api }
IceGitHubSelectListModel >> displayBlock: aBlock [ 
	self listPanel displayBlock: aBlock
]

{ #category : #api }
IceGitHubSelectListModel >> initialExtent [
	^ self class defaultExtent
]

{ #category : #initialization }
IceGitHubSelectListModel >> initialize [
	selectedItems := Set new.
	super initialize.
]

{ #category : #initialization }
IceGitHubSelectListModel >> initializeWidgets [
	listPanel := self newTable.
	selectButton := self newButton.
	listPanel
		addColumn:
			((SpCheckBoxTableColumn
				evaluated: [ :eachLine | selectedItems includes: eachLine ])
				onActivation: [ :eachLine | selectedItems remove: eachLine ];
				onDesactivation: [ :eachLine | selectedItems add: eachLine ]);
		addColumn: (SpStringTableColumn evaluated: [ :eachLine | eachLine halt ]).
	selectButton
		label: self class buttonLabel;
		action: [ self confirmSelection ].
	self focusOrder
		add: listPanel;
		add: selectButton
]

{ #category : #api }
IceGitHubSelectListModel >> items: aCollection [
	self listPanel items: aCollection
]

{ #category : #'accessing ui' }
IceGitHubSelectListModel >> listPanel [
	^ listPanel
]

{ #category : #'accessing ui' }
IceGitHubSelectListModel >> listPanel: anObject [
	listPanel := anObject
]

{ #category : #events }
IceGitHubSelectListModel >> onAccept: aBlock [
	acceptBlock := aBlock
]

{ #category : #'accessing ui' }
IceGitHubSelectListModel >> selectButton [
	^ selectButton
]

{ #category : #'accessing ui' }
IceGitHubSelectListModel >> selectButton: anObject [
	selectButton := anObject
]

{ #category : #api }
IceGitHubSelectListModel >> selectLabel: aString [
	self selectButton label: aString
]
