"
I'm a dialog to select a list of anything (used by branches now).
"
Class {
	#name : #IceGitHubRemoveBranchesModel,
	#superclass : #SpPresenter,
	#instVars : [
		'selectedItems',
		'listPanel',
		'selectButton',
		'acceptBlock',
		'displayBlock',
		'remote'
	],
	#category : #'Iceberg-Plugin-GitHub-View'
}

{ #category : #specs }
IceGitHubRemoveBranchesModel class >> buttonLabel [
	^ 'Select'
]

{ #category : #api }
IceGitHubRemoveBranchesModel class >> defaultExtent [ 
	^ 550@500
]

{ #category : #specs }
IceGitHubRemoveBranchesModel class >> defaultSpec [
	<spec>
	^ SpBoxLayout newVertical
		add: #listPanel;
		add: #selectButton
			withConstraints: [ :constraints | constraints height: self buttonHeight ];
		yourself
]

{ #category : #specs }
IceGitHubRemoveBranchesModel class >> title [
	^ 'Select...'
]

{ #category : #actions }
IceGitHubRemoveBranchesModel >> confirmSelection [
	acceptBlock ifNotNil: [ 
		acceptBlock value: selectedItems ].
	self window delete
]

{ #category : #api }
IceGitHubRemoveBranchesModel >> displayBlock: aBlock [
	
	displayBlock := aBlock
]

{ #category : #api }
IceGitHubRemoveBranchesModel >> initialExtent [
	^ self class defaultExtent
]

{ #category : #initialization }
IceGitHubRemoveBranchesModel >> initialize [
	selectedItems := Set new.
	super initialize.
]

{ #category : #initialization }
IceGitHubRemoveBranchesModel >> initializeWidgets [
	listPanel := self newTable.
	selectButton := self newButton.
	listPanel
		addColumn:
			((SpCheckBoxTableColumn
				evaluated: [ :branch | selectedItems includes: branch ])
				onActivation: [ :branch | selectedItems add: branch ];
				onDeactivation: [ :branch | selectedItems remove: branch ];
				width: 20 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			((SpStringTableColumn evaluated: [ :branch | branch at: 'name' ])
				width: 350 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			(SpStringTableColumn
				evaluated: [ :branch | self timeSinceLastCommit: branch ]).
	selectButton
		label: self class buttonLabel;
		action: [ self confirmSelection ].
	self focusOrder
		add: listPanel;
		add: selectButton
]

{ #category : #initialization }
IceGitHubRemoveBranchesModel >> initializeWindow: aWindowPresenter [
	super initializeWindow: aWindowPresenter.
	aWindowPresenter title: ('Select branches to remove on remote {1}' format: {self remote name})
]

{ #category : #api }
IceGitHubRemoveBranchesModel >> items: aCollection [
	self listPanel items: aCollection
]

{ #category : #'accessing ui' }
IceGitHubRemoveBranchesModel >> listPanel [
	^ listPanel
]

{ #category : #'accessing ui' }
IceGitHubRemoveBranchesModel >> listPanel: anObject [
	listPanel := anObject
]

{ #category : #events }
IceGitHubRemoveBranchesModel >> onAccept: aBlock [
	acceptBlock := aBlock
]

{ #category : #accessing }
IceGitHubRemoveBranchesModel >> remote [
	^ remote
]

{ #category : #accessing }
IceGitHubRemoveBranchesModel >> remote: anObject [
	remote := anObject
]

{ #category : #'accessing ui' }
IceGitHubRemoveBranchesModel >> selectButton [
	^ selectButton
]

{ #category : #'accessing ui' }
IceGitHubRemoveBranchesModel >> selectButton: anObject [
	selectButton := anObject
]

{ #category : #api }
IceGitHubRemoveBranchesModel >> selectLabel: aString [
	self selectButton label: aString
]

{ #category : #accessing }
IceGitHubRemoveBranchesModel >> timeSinceLastCommit: branch [

	| lastCommitDate |
	lastCommitDate := 	((((branch at: 'commit') at: 'commit')
		at: 'author') at: 'date')asDateAndTime.
		^ '{1} days' format: {(Date today - lastCommitDate) days}
]
