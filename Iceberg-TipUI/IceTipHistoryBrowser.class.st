"
I'm a browser and panel to show the history of a commitish (usually a branch or a tag). 
I'm usually used as part of an IceTipRepositoryBrowser.

(self onBranch: IceRepository registry anyOne branch) openWithSpec.
"
Class {
	#name : 'IceTipHistoryBrowser',
	#superclass : 'IceTipBrowser',
	#instVars : [
		'commitList',
		'commitInfoTabs',
		'loadSize',
		'allCommits'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'commands' }
IceTipHistoryBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	"Nothing to add"
]

{ #category : 'commands' }
IceTipHistoryBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{	IceTipAdoptCommitCommand.
		IceTipCheckoutNewBranchCommand.
		IceTipCheckoutCommitCommand.
		IceTipCreateTagCommand.
		IceTipResetBranchToThisCommitCommand.
		IceTipCopyCommitishCommand.
		IceTipCherryPickCommand.
		} do: [ :each |
			aCommandGroup register: (each forSpecContext: presenter)  ]

]

{ #category : 'accessing' }
IceTipHistoryBrowser class >> defaultPreferredExtent [
	^ (700 @ 700)
]

{ #category : 'specs' }
IceTipHistoryBrowser class >> panelSpec [
	
	^ SpPanedLayout newTopToBottom
		add: #commitList;
		add: #commitInfoTabs;
		yourself
]

{ #category : 'accessing' }
IceTipHistoryBrowser >> beForMerge [

	self commitInfoTabs beForMerge
]

{ #category : 'accessing - ui' }
IceTipHistoryBrowser >> commitInfoTabs [

	^ commitInfoTabs
]

{ #category : 'accessing - ui' }
IceTipHistoryBrowser >> commitList [

	^ commitList
]

{ #category : 'layout' }
IceTipHistoryBrowser >> defaultLayout [

	^ SpPanedLayout newTopToBottom
		  add: commitList;
		  add: commitInfoTabs;
		  yourself
]

{ #category : 'initialization' }
IceTipHistoryBrowser >> initializeCommitList [

	commitList
		beResizable;
		addColumn: ((SpStringTableColumn new
			title: 'Timestamp';
			width: 120;
			evaluated: [ :each | each timeStamp asLocalStringYMDHM ])
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Commit';
			width: 70;
			evaluated: #shortId;
			yourself);	
		addColumn: (SpStringTableColumn new
			title: 'Author';
			width: 180;
			evaluated: #author;
			yourself);
		addColumn: (SpStringTableColumn new 
			title: 'Description';
			evaluated: [ :each | each shortDescriptionWithTags ];
			yourself);
		whenSelectionChangedDo: [ :aSelection | self selectionChanged: aSelection selectedItem ]
]

{ #category : 'initialization' }
IceTipHistoryBrowser >> initializePresenters [
	loadSize := 20.
	commitList := self newTable.
	commitInfoTabs := self instantiate: IceTipCommitInfoPresenter.
	allCommits := self model commitModels.
	self initializeCommitList
]

{ #category : 'actions' }
IceTipHistoryBrowser >> loadAll [

	self loadSize: allCommits size.
	self refreshCommitList
]

{ #category : 'actions' }
IceTipHistoryBrowser >> loadLess: anInteger [

	self loadSize: (self loadSize - anInteger max: 0).
	self refreshCommitList
]

{ #category : 'actions' }
IceTipHistoryBrowser >> loadMore: anInteger [

	self loadSize: ((self loadSize + anInteger) min: allCommits size).
	self refreshCommitList
]

{ #category : 'accessing' }
IceTipHistoryBrowser >> loadSize [

	^ loadSize
]

{ #category : 'accessing' }
IceTipHistoryBrowser >> loadSize: anObject [

	loadSize := anObject
]

{ #category : 'accessing - ui' }
IceTipHistoryBrowser >> mainList [
	"Answer the presenter that is the main list of items of this browser."

	^ commitList
]

{ #category : 'accessing' }
IceTipHistoryBrowser >> model: anObject [

	super model: anObject.
	self refresh
]

{ #category : 'accessing' }
IceTipHistoryBrowser >> refresh [

	self refreshCommitList
]

{ #category : 'accessing' }
IceTipHistoryBrowser >> refreshCommitList [

    | maxCommits |
    maxCommits := self loadSize min: allCommits size.
    commitList items: (allCommits first: maxCommits).
    commitInfoTabs selectedModel: ( allCommits ifNotEmpty: #first ifEmpty: [ nil ])
]

{ #category : 'accessing' }
IceTipHistoryBrowser >> refreshTags [

	"force refresh of table because a tag was added (or removed)"
	commitList refresh
]

{ #category : 'selection' }
IceTipHistoryBrowser >> selectCommit: commit scrollToSelection: shouldScrollToSelection [

	self commitList selectIndex: (self commitList items detectIndex: [ :item | item commit = commit ])
		scrollToSelection: shouldScrollToSelection
]

{ #category : 'accessing' }
IceTipHistoryBrowser >> selectedCommit [

	^ commitList selection selectedItem
]

{ #category : 'event handling' }
IceTipHistoryBrowser >> selectionChanged: anElement [

	commitInfoTabs selectedModel: anElement
]

{ #category : 'initialization' }
IceTipHistoryBrowser >> updatePresenter [

	self refresh
]

{ #category : 'events' }
IceTipHistoryBrowser >> whenSelectionChangedDo: aBlock [ 
	
	commitList whenSelectionChangedDo: aBlock
]

{ #category : 'initialization' }
IceTipHistoryBrowser >> windowTitle [

	^ self model
		ifNotNil: [ 'History of {1}' format: {self model repositoryName} ]
		ifNil: [ 'History' ]

]
