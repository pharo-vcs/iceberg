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

{ #category : #specs }
IceTipRepositoryBrowser class >> defaultSpec [
	<spec: #default>
	
	^ SpBoxLayout newVertical
		add: #toolbar expand: false fill: true padding: 0;
		add: (SpPanedLayout newHorizontal
			position: 30 percent; 
			add: #sidebarTree;
			add: #historyPanel withConstraints:[ :c | c spec: #panelSpec ];
			yourself);
		yourself
]

{ #category : #'instance creation' }
IceTipRepositoryBrowser class >> new [
	self error: 'Use #for:'
]

{ #category : #'instance creation' }
IceTipRepositoryBrowser class >> onRepository: aRepository [
	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : #accessing }
IceTipRepositoryBrowser >> branchSelected [
	^ sidebarTree selection selectedItem
]

{ #category : #'event handling' }
IceTipRepositoryBrowser >> commitishSelected: ann [
	historyPanel model: ann

]

{ #category : #accessing }
IceTipRepositoryBrowser >> contextClass [
	^ IceTipRepositoryContext
]

{ #category : #accessing }
IceTipRepositoryBrowser >> createCommandContext [
	^ self newContextWithSelection: self branchSelected
]

{ #category : #accessing }
IceTipRepositoryBrowser >> historyPanel [
	^ historyPanel
]

{ #category : #accessing }
IceTipRepositoryBrowser >> historyPanel: anObject [
	historyPanel := anObject
]

{ #category : #accessing }
IceTipRepositoryBrowser >> initialExtent [
	^ (1000@700) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipRepositoryBrowser >> initializeSidebarTree [
	sidebarTree
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
		roots: self model repositoryModelsByGroup;
		whenSelectionChangedDo: [ :selection | 
			selection selectedItem class superclass = IceTipTreeItem
				ifTrue: [ self commitishSelected: selection selectedItem ] ];
		contextMenu: [ self buildMenu ]  .
	self selectCurrentBranch
]

{ #category : #initialization }
IceTipRepositoryBrowser >> initializeWidgets [
	super initializeWidgets.
	sidebarTree := self newTreeTable.
	historyPanel := self
		instantiate: IceTipHiedraHistoryBrowser
		on: self model headModel.
	historyPanel beForMerge.

	self initializeSidebarTree.
	
	self focusOrder
		add: historyPanel;
		add: sidebarTree
]

{ #category : #accessing }
IceTipRepositoryBrowser >> newContextWithSelection: anObject [
    ^ self newContext 
    item: anObject;
    yourself
]

{ #category : #'private factory' }
IceTipRepositoryBrowser >> newSidebarTreeDataSource [
	^ IceTipTreeOutlineDataSource new 
		tool: self;
		rootForItems: self model repositoryModelsByGroup;
		childrenBlock: [ :each | each children ];
		icon: [ :each | each icon ];
		format: #descriptionWithDecoration;
		yourself
]

{ #category : #accessing }
IceTipRepositoryBrowser >> refresh [
	self rebuildToolbar.
	self sidebarTree selection unselectAll.
	self sidebarTree roots: self model repositoryModelsByGroup.

]

{ #category : #'private factory' }
IceTipRepositoryBrowser >> refreshWhenRepository: ann [
	(self model isModelOf: ann repository)
		ifFalse: [ ^ self ].
	self model reset.   
	self refresh.
]

{ #category : #initialization }
IceTipRepositoryBrowser >> selectCurrentBranch [
	| branch |
	branch := self model headModel entity.
	
	branch isBranch ifFalse: [ ^ self ].
	
	"We know that the current branch is a local one, so we build the path from 1 (for local branch) and the index of the current branch."
	sidebarTree selection selectPath: { 1. self model branches indexOf: branch}
]

{ #category : #accessing }
IceTipRepositoryBrowser >> sidebarTree [
	^ sidebarTree
]

{ #category : #accessing }
IceTipRepositoryBrowser >> sidebarTree: anObject [
	sidebarTree := anObject
]

{ #category : #'private factory' }
IceTipRepositoryBrowser >> subscribeToAnnouncements [
    Iceberg announcer weak 
        when: IceRepositoryAnnouncement 
        send: #refreshWhenRepository: 
        to: self
]

{ #category : #accessing }
IceTipRepositoryBrowser >> title [
	^ 'Repository of ', self model name
]
