"
I'm a browser to show the internals of a repository. 
I will show remotes, branches, tags and all possible operations in low level repository (pull, push,  branch. But all edit remotes, etc.)
"
Class {
	#name : 'IceTipRepositoryBrowser',
	#superclass : 'IceTipBrowser',
	#instVars : [
		'sidebarTree',
		'historyPanel'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'commands' }
IceTipRepositoryBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	{	IceTipAddRemoteCommand.
		IceTipPushCommand.
		IceTipPullCommand.
		IceTipFetchCommand.
		IceTipCheckoutBranchCommand.
		IceTipMergeCommand } do: [ :each | 
			aCommandGroup register: (each forSpecContext: presenter) ]
]

{ #category : 'commands' }
IceTipRepositoryBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	| aGroup |
	{
		IceTipFetchRemoteCommand.
		IceTipCheckoutSelectedBranchCommand.
		IceTipDeleteBranchCommand.
		IceTipDeleteTagCommand.
		IceTipCheckoutSelectedTagCommand.
		IceTipDeleteRemoteCommand
		}  do: [ :each |
			aCommandGroup register: (each forSpecContext: presenter) ].
	
	aGroup := (CmCommandGroup named: 'GitHub' ) asSpecGroup
		icon: (self iconNamed: #github);
		description: 'Extended Operations when the Remote is in Github'.
		
	
	aCommandGroup register: aGroup.

	IceGitHubTreeCommand allSubclasses do: [ :each |
		aGroup register: (each forSpecContext: presenter) ]

]

{ #category : 'instance creation' }
IceTipRepositoryBrowser class >> new [
	self error: 'Use #onRepository:'
]

{ #category : 'instance creation' }
IceTipRepositoryBrowser class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : 'instance creation' }
IceTipRepositoryBrowser class >> onRepositoryNamed: aString [

	^ self onRepository: (IceRepository registry detect: [ :each | each name = aString ])
]

{ #category : 'opening' }
IceTipRepositoryBrowser class >> openOnCommit: commit [

	^ (self onRepository: commit repository)
		open;
		selectCommit: commit scrollToSelection: true;
		yourself
]

{ #category : 'event handling' }
IceTipRepositoryBrowser >> commitishSelected: ann [

	historyPanel model: ann
]

{ #category : 'layout' }
IceTipRepositoryBrowser >> defaultLayout [

	^ SpPanedLayout newLeftToRight
		  positionOfSlider: 30 percent;
		  add: sidebarTree;
		  add: historyPanel withConstraints: [ :c | c spec: #panelSpec ];
		  yourself
]

{ #category : 'accessing - ui' }
IceTipRepositoryBrowser >> historyPanel [

	^ historyPanel
]

{ #category : 'initialization' }
IceTipRepositoryBrowser >> initialExtentForWindow [

	^ (1000 @ 700) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipRepositoryBrowser >> initializePresenters [

	sidebarTree := self newTreeTable.
	historyPanel := self
		instantiate: IceTipHiedraHistoryBrowser
		on: self model headModel.

	historyPanel whenSelectionChangedDo: [ self refreshCommands ].
	historyPanel beForMerge.

	self initializeSidebarTree
]

{ #category : 'initialization' }
IceTipRepositoryBrowser >> initializeSidebarTree [

	sidebarTree
		hideColumnHeaders;
		addColumn: (SpCompositeTableColumn new
			addColumn: (SpImageTableColumn new
				evaluated: #icon;
				beNotExpandable;
				yourself);
			addColumn: (SpStringTableColumn new
				evaluated: #name;
				yourself);
			yourself);
		children: [ :each | each children ];
		whenSelectionChangedDo: [ :selection | 
			(selection isEmpty not and: [ selection selectedItem isCommitish ])
				ifTrue: [ self commitishSelected: selection selectedItem ] ]
]

{ #category : 'accessing - ui' }
IceTipRepositoryBrowser >> mainList [
	"Answer the presenter that is the main list of items of this browser."

	^ sidebarTree
]

{ #category : 'accessing' }
IceTipRepositoryBrowser >> refresh [

	self refreshCommands.
	self sidebarTree selection unselectAll.
	self sidebarTree roots: self model repositoryModelsByGroup.
	self selectCurrentBranch
]

{ #category : 'private - factory' }
IceTipRepositoryBrowser >> refreshWhenRepository: ann [

	(self model isModelOf: ann repository) ifFalse: [ ^ self ].
	self model reset.
	self updatePresenter
]

{ #category : 'selection' }
IceTipRepositoryBrowser >> selectCommit: commit scrollToSelection: shouldScrollToSelection [

	self historyPanel selectCommit: commit scrollToSelection: shouldScrollToSelection
]

{ #category : 'initialization' }
IceTipRepositoryBrowser >> selectCurrentBranch [

	| branch |
	branch := self model headModel entity.
	
	branch isBranch ifFalse: [ ^ self ].
	
	"We know that the current branch is a local one, so we build the path from 1 (for local branch) and the index of the current branch."
	sidebarTree selection selectPath: { 1. self model branches indexOf: branch}

]

{ #category : 'accessing - ui' }
IceTipRepositoryBrowser >> sidebarTree [

	^ sidebarTree
]

{ #category : 'private - factory' }
IceTipRepositoryBrowser >> subscribeToAnnouncements [

    Iceberg announcer weak 
        when: IceRepositoryAnnouncement 
        send: #refreshWhenRepository: 
        to: self
]

{ #category : 'initialization' }
IceTipRepositoryBrowser >> titleForWindow [

	^ 'Repository of ' , self model name
]

{ #category : 'initialization' }
IceTipRepositoryBrowser >> updatePresenter [

	self refresh
]
