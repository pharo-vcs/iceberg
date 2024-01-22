"
I'm a browser and panel to show the version history of a method. 

For versions, I show the same commands of a regular history browser, but add some special commands.

(self onRepository: aRepository method: aMethod) openWithSpec.


"
Class {
	#name : 'IceTipVersionHistoryBrowser',
	#superclass : 'IceTipBrowser',
	#instVars : [
		'commitList',
		'selectedModel',
		'infoPage',
		'diffPage',
		'commitPanel'
	],
	#category : 'Iceberg-TipUI-View-Versions',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Versions'
}

{ #category : 'commands' }
IceTipVersionHistoryBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	"Nothing to add"
]

{ #category : 'commands' }
IceTipVersionHistoryBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{ 	IceTipInstallVersionCommand }
			do: [ :each |
				aCommandGroup register: (each forSpecContext: presenter) ]

]

{ #category : 'instance creation' }
IceTipVersionHistoryBrowser class >> onRepository: aRepository method: aMethod [

	^ self on: (IceTipVersionHistoryModel
			   repositoryModel: (IceTipRepositoryModel on: aRepository)
			   on: aMethod)
]

{ #category : 'accessing' }
IceTipVersionHistoryBrowser >> commitList [

	^ commitList
]

{ #category : 'layout' }
IceTipVersionHistoryBrowser >> defaultLayout [
	
	^ SpPanedLayout newTopToBottom
		add: commitList;
		add: commitPanel;
		yourself
]

{ #category : 'initialization' }
IceTipVersionHistoryBrowser >> initialExtentForWindow [

	^ (700@700) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipVersionHistoryBrowser >> initializeCommitList [

	commitList
		beResizable;
		addColumn: (SpStringTableColumn new
			title: 'Timestamp';
			evaluated: [ :each | each timeStamp asLocalStringYMDHM ];
			width: 110;
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Commit';
			evaluated: #shortId;
			width: 60;
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Author';
			evaluated: #author;
			width: 150;
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Description';
			evaluated: #shortDescription;
			yourself).
				
	commitList whenSelectionChangedDo: [ :aSelection |
		self selectionChanged: aSelection selectedItem ]
]

{ #category : 'initialization' }
IceTipVersionHistoryBrowser >> initializeCommitPanel [
	"This will be initialised in fact on the first refresh"

	commitPanel
		addPage: (infoPage := self newInfoPage);
		addPage: (diffPage := self newDiffPage 
			title: 'Diff from ancestor';
			presenterProvider: [ self newDiffPresenter ];
			yourself)
]

{ #category : 'initialization' }
IceTipVersionHistoryBrowser >> initializePresenters [

	commitList := self newTable.
	commitPanel := self newNotebook.
	
	self initializeCommitList.
	self initializeCommitPanel
]

{ #category : 'accessing - ui' }
IceTipVersionHistoryBrowser >> mainList [
	"Answer the presenter that is the main list of items of this browser."

	^ commitList
]

{ #category : 'accessing' }
IceTipVersionHistoryBrowser >> model: anObject [

	super model: anObject.
	self refresh
]

{ #category : 'private - factory' }
IceTipVersionHistoryBrowser >> newDiffPage [

	^ SpNotebookPage  
		title: 'Diff'
		icon: (self iconNamed: #diff)
		provider: [ self newDiffPresenter ]
]

{ #category : 'private - factory' }
IceTipVersionHistoryBrowser >> newDiffPanelLeft: leftString right: rightString [

	^ (self instantiate: SpDiffPresenter) 
		leftText: leftString;
		rightText: rightString;
		showOptions: false
]

{ #category : 'private' }
IceTipVersionHistoryBrowser >> newDiffPresenter [
	
	selectedModel ifNil: [ ^ self ].
	^ self 
		newDiffPanelLeft: ((self model commitModelAfter: selectedModel) 
			ifNotNil: #source
			ifNil: [ '' ])
		right: selectedModel source
]

{ #category : 'private - factory' }
IceTipVersionHistoryBrowser >> newInfoPage [

	^ SpNotebookPage  
		title: 'Info'
		icon: (self iconNamed: #smallQuestion)
		provider: [ self newVersionInfoPresenter ]

]

{ #category : 'private' }
IceTipVersionHistoryBrowser >> newVersionInfoPresenter [
	
	selectedModel ifNil: [ ^ self ].
	^ IceTipReadOnlyFormBuilder newBuiltFor: selectedModel info application: self application
]

{ #category : 'accessing' }
IceTipVersionHistoryBrowser >> refresh [

	commitList items: self model commitModels.
	selectedModel := self model commitModels 
		ifNotEmpty: #first
		ifEmpty: [ nil ].
	self refreshCommitTabPanel
]

{ #category : 'private' }
IceTipVersionHistoryBrowser >> refreshCommitTabPanel [
	
	selectedModel ifNil: [ ^ self ].
	diffPage title: ('{1} to {2}' format: { 
		(self model commitModelAfter: selectedModel) 
			ifNotNil: #shortId
			ifNil: [ 'origin' ].
		selectedModel shortId }).
	commitPanel resetAllPageContents
]

{ #category : 'event handling' }
IceTipVersionHistoryBrowser >> selectionChanged: aSelectedItem [

	selectedModel := aSelectedItem.
	self refreshCommitTabPanel
]

{ #category : 'initialization' }
IceTipVersionHistoryBrowser >> titleForWindow [

	^ self model  
		ifNotNil: [ 'Versions of {1}' format: { self model name } ]
		ifNil: [ 'Versions' ]
]

{ #category : 'initialization' }
IceTipVersionHistoryBrowser >> updatePresenter [

	self refresh
]
