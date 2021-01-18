"
I'm a browser to show the internals of a repository. 
I will show remotes, branches, tags and all possible operations in low level repository (pull, push,  branch. But all edit remotes, etc.)
"
Class {
	#name : #IceTipRepositoryBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'sidebarTree',
		'historyPanel'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #commands }
IceTipRepositoryBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	{	IceTipAddRemoteCommand.
		IceTipPushCommand.
		IceTipPullCommand.
		IceTipFetchCommand.
		IceTipCheckoutBranchCommand.
		IceTipMergeCommand } do: [ :each | 
			aCommandGroup register: each forSpec ]
]

{ #category : #commands }
IceTipRepositoryBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	{
		IceTipFetchRemoteCommand.
		IceTipCheckoutSelectedBranchCommand.
		IceTipDeleteBranchCommand.
		IceTipDeleteTagCommand.
		IceTipCheckoutSelectedTagCommand.
		IceTipDeleteRemoteCommand
		} do: [ :each |
			aCommandGroup register: each forSpec ]

]

{ #category : #specs }
IceTipRepositoryBrowser class >> defaultSpec [

	^ SpPanedLayout newHorizontal
		  position: 30 percent;
		  add: #sidebarTree;
		  add: #historyPanel withConstraints: [ :c | c spec: #panelSpec ];
		  yourself

]

{ #category : #'instance creation' }
IceTipRepositoryBrowser class >> new [
	self error: 'Use #onRepository:'
]

{ #category : #'instance creation' }
IceTipRepositoryBrowser class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : #'event handling' }
IceTipRepositoryBrowser >> commitishSelected: ann [

	historyPanel model: ann
]

{ #category : #'accessing ui' }
IceTipRepositoryBrowser >> historyPanel [

	^ historyPanel
]

{ #category : #initialization }
IceTipRepositoryBrowser >> initialExtentForWindow [

	^ (1000 @ 700) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipRepositoryBrowser >> initializePresenters [

	super initializePresenters.
	sidebarTree := self newTreeTable.
	historyPanel := self
		instantiate: IceTipHiedraHistoryBrowser
		on: self model headModel.
	historyPanel beForMerge.

	self initializeSidebarTree.

	self refresh.

]

{ #category : #initialization }
IceTipRepositoryBrowser >> initializeSidebarTree [

	sidebarTree
		hideColumnHeaders;
		addColumn:
			(SpCompositeTableColumn new
				addColumn:
					(SpImageTableColumn new
						width: 20;
						evaluated: #icon;
						yourself);
				addColumn:
					(SpStringTableColumn new
						evaluated: #name;
						yourself);
				yourself);
		children: [ :each | each children ];
		whenSelectionChangedDo: [ :selection | 
			(selection isEmpty not and: [ selection selectedItem isCommitish ])
				ifTrue: [ self commitishSelected: selection selectedItem ] ].

]

{ #category : #'accessing ui' }
IceTipRepositoryBrowser >> mainList [
	"Answer the presenter that is the main list of items of this browser."

	^ sidebarTree
]

{ #category : #accessing }
IceTipRepositoryBrowser >> refresh [

	self rebuildToolbar.
	self sidebarTree selection unselectAll.
	self sidebarTree roots: self model repositoryModelsByGroup.
	self selectCurrentBranch
]

{ #category : #'private factory' }
IceTipRepositoryBrowser >> refreshWhenRepository: ann [

	(self model isModelOf: ann repository) ifFalse: [ ^ self ].
	self model reset.
	self refresh
]

{ #category : #initialization }
IceTipRepositoryBrowser >> selectCurrentBranch [

	| branch |
	branch := self model headModel entity.
	
	branch isBranch ifFalse: [ ^ self ].
	
	"We know that the current branch is a local one, so we build the path from 1 (for local branch) and the index of the current branch."
	sidebarTree selection selectPath: { 1. self model branches indexOf: branch}

]

{ #category : #'accessing ui' }
IceTipRepositoryBrowser >> sidebarTree [

	^ sidebarTree
]

{ #category : #'private factory' }
IceTipRepositoryBrowser >> subscribeToAnnouncements [

    Iceberg announcer weak 
        when: IceRepositoryAnnouncement 
        send: #refreshWhenRepository: 
        to: self
]

{ #category : #initialization }
IceTipRepositoryBrowser >> titleForWindow [

	^ 'Repository of ' , self model name
]
