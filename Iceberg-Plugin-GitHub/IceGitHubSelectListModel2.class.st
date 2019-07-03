"
I'm a spec2 dialog to select a list of anything (used by branches now).
"
Class {
	#name : #IceGitHubSelectListModel2,
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
IceGitHubSelectListModel2 class >> buttonLabel [
	^ 'Select'
]

{ #category : #api }
IceGitHubSelectListModel2 class >> defaultExtent [ 
	^ 550@500
]

{ #category : #specs }
IceGitHubSelectListModel2 class >> defaultSpec [
	<spec>
	^ SpBoxLayout newVertical 
	add: #listPanel;
	add: #selectButton withConstraints: [ :constraints | constraints height: self buttonHeight ];
	yourself
]

{ #category : #examples }
IceGitHubSelectListModel2 class >> example [
	<example>
	^ self new openWithSpec
]

{ #category : #specs }
IceGitHubSelectListModel2 class >> title [
	^ 'Select...'
]

{ #category : #actions }
IceGitHubSelectListModel2 >> confirmSelection [
	acceptBlock ifNotNil: [ 
		acceptBlock value: selectedItems ].
	self window delete
]

{ #category : #'private factory' }
IceGitHubSelectListModel2 >> createCheckboxFor: anObject [
	^ CheckboxMorph 
		on: (IceGitHubSelectItem list: selectedItems item: anObject) 
		selected: #value 
		changeSelected: #value:
]

{ #category : #api }
IceGitHubSelectListModel2 >> displayBlock: aBlock [ 
	self listPanel displayBlock: aBlock
]

{ #category : #api }
IceGitHubSelectListModel2 >> initialExtent [
	^ self class defaultExtent
]

{ #category : #initialization }
IceGitHubSelectListModel2 >> initialize [
	selectedItems := Set new.
	super initialize.

]

{ #category : #initialization }
IceGitHubSelectListModel2 >> initializeWidgets [
	listPanel := self instantiate: FastTablePresenter.
	listPanel icons: [ :each | self createCheckboxFor: each ].
	selectButton := self newButton.
	
	selectButton 
		label: self class buttonLabel;
		action: [ self confirmSelection ].
	
	self focusOrder 
		add: listPanel;
		add: selectButton
]

{ #category : #initialization }
IceGitHubSelectListModel2 >> initializeWindow [
 	super initializeWindow.
	self title: self class title

	
	
]

{ #category : #api }
IceGitHubSelectListModel2 >> items: aCollection [
	self listPanel items: aCollection
]

{ #category : #'accessing ui' }
IceGitHubSelectListModel2 >> listPanel [
	^ listPanel
]

{ #category : #'accessing ui' }
IceGitHubSelectListModel2 >> listPanel: anObject [
	listPanel := anObject
]

{ #category : #events }
IceGitHubSelectListModel2 >> onAccept: aBlock [
	acceptBlock := aBlock
]

{ #category : #'accessing ui' }
IceGitHubSelectListModel2 >> selectButton [
	^ selectButton
]

{ #category : #'accessing ui' }
IceGitHubSelectListModel2 >> selectButton: anObject [
	selectButton := anObject
]

{ #category : #api }
IceGitHubSelectListModel2 >> selectLabel: aString [
	self selectButton label: aString
]
