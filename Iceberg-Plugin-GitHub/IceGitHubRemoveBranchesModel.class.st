"
I'm a dialog to select a list of anything (used by branches now).
"
Class {
	#name : #IceGitHubRemoveBranchesModel,
	#superclass : #IceTipSpPresenter,
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

{ #category : #layout }
IceGitHubRemoveBranchesModel class >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: #listPanel;
		  add: #selectButton expand: false;
		  yourself
]

{ #category : #actions }
IceGitHubRemoveBranchesModel >> confirmSelection [

	acceptBlock ifNotNil: [ acceptBlock value: selectedItems ].
	self closeWindow
]

{ #category : #api }
IceGitHubRemoveBranchesModel >> displayBlock: aBlock [
	
	displayBlock := aBlock
]

{ #category : #initialization }
IceGitHubRemoveBranchesModel >> initialExtentForWindow [

	^ 550 @ 500
]

{ #category : #initialization }
IceGitHubRemoveBranchesModel >> initialize [

	selectedItems := Set new.
	super initialize
]

{ #category : #initialization }
IceGitHubRemoveBranchesModel >> initializePresenters [

	super initializePresenters.
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
		label: 'Select';
		action: [ self confirmSelection ].

]

{ #category : #api }
IceGitHubRemoveBranchesModel >> items: aCollection [

	self listPanel items: aCollection
]

{ #category : #'accessing - ui' }
IceGitHubRemoveBranchesModel >> listPanel [

	^ listPanel
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

{ #category : #'accessing - ui' }
IceGitHubRemoveBranchesModel >> selectButton [

	^ selectButton
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

{ #category : #initialization }
IceGitHubRemoveBranchesModel >> titleForWindow [

	^ 'Select branches to remove on remote {1}' format:
		  { self remote name }
]
