"
I'm a dialog to select a list of anything (used by branches now).
"
Class {
	#name : 'IceGitHubRemoveBranchesModel',
	#superclass : 'IceTipPresenter',
	#instVars : [
		'selectedItems',
		'listPanel',
		'acceptBlock',
		'displayBlock',
		'remote'
	],
	#category : 'Iceberg-Plugin-GitHub-View',
	#package : 'Iceberg-Plugin-GitHub',
	#tag : 'View'
}

{ #category : 'actions' }
IceGitHubRemoveBranchesModel >> confirmSelection [

	acceptBlock ifNotNil: [ acceptBlock value: selectedItems ].
	self closeWindow
]

{ #category : 'layout' }
IceGitHubRemoveBranchesModel >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: listPanel;"
		  add: selectButton expand: false;"
		  yourself
]

{ #category : 'api' }
IceGitHubRemoveBranchesModel >> displayBlock: aBlock [
	
	displayBlock := aBlock
]

{ #category : 'initialization' }
IceGitHubRemoveBranchesModel >> initialExtentForWindow [

	^ 550 @ 500
]

{ #category : 'initialization' }
IceGitHubRemoveBranchesModel >> initialize [

	selectedItems := Set new.
	super initialize
]

{ #category : 'initialization' }
IceGitHubRemoveBranchesModel >> initializeDialogWindow: aDialogWindowPresenter [

	aDialogWindowPresenter
		addButton: 'Cancel' do: [ :presenter | 
			presenter triggerCancelAction.
			presenter close ];
		addDefaultButton: 'Remove' do: [ :presenter | 
			self triggerAcceptAction.
			presenter close ]		
]

{ #category : 'initialization' }
IceGitHubRemoveBranchesModel >> initializePresenters [

	listPanel := self newTable.
	listPanel
		addColumn: (SpCheckBoxTableColumn new
			evaluated: [ :branch | selectedItems includes: branch ];
			onActivation: [ :branch | selectedItems add: branch ];
			onDeactivation: [ :branch | selectedItems remove: branch ];
			beNotExpandable;
			yourself);
		addColumn: (SpStringTableColumn evaluated: [ :branch | branch at: 'name' ]);
		addColumn: (SpStringTableColumn evaluated: [ :branch | self timeSinceLastCommit: branch ])
]

{ #category : 'api' }
IceGitHubRemoveBranchesModel >> items: aCollection [

	self listPanel items: aCollection
]

{ #category : 'accessing - ui' }
IceGitHubRemoveBranchesModel >> listPanel [

	^ listPanel
]

{ #category : 'events' }
IceGitHubRemoveBranchesModel >> onAccept: aBlock [

	acceptBlock := aBlock
]

{ #category : 'accessing' }
IceGitHubRemoveBranchesModel >> remote [

	^ remote
]

{ #category : 'accessing' }
IceGitHubRemoveBranchesModel >> remote: anObject [

	remote := anObject
]

{ #category : 'accessing' }
IceGitHubRemoveBranchesModel >> timeSinceLastCommit: branch [

	| lastCommitDate |
	lastCommitDate := 	((((branch at: 'commit') at: 'commit')
		at: 'author') at: 'date')asDateAndTime.
		^ '{1} days' format: {(Date today - lastCommitDate) days}
]

{ #category : 'initialization' }
IceGitHubRemoveBranchesModel >> titleForWindow [

	^ 'Select branches to remove on remote {1}' format:
		  { self remote name }
]

{ #category : 'private' }
IceGitHubRemoveBranchesModel >> triggerAcceptAction [
		
	acceptBlock ifNil: [ ^ self ].
	acceptBlock value: selectedItems
]
