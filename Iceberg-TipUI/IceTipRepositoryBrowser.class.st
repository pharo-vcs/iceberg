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
	
	^ SpecBoxLayout newVertical
		add: #toolbar withConstraints: [ :c | c height: IceTipToolbar defaultHeight ];
		add: (SpecPanedLayout newHorizontal
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

{ #category : #'event handling' }
IceTipRepositoryBrowser >> commitishSelected: ann [
	| selection |
	
	ann newSelectedRowIndexes 
		ifNotEmpty: [ :indexes |
			selection := sidebarTree widget dataSource elementAt: indexes first.
			(selection depth = 0 or: [ selection hasChildren ]) 
				ifTrue: [ ^ self "just refresh on leafs" ].
			historyPanel model: selection data model ]
]

{ #category : #accessing }
IceTipRepositoryBrowser >> contextClass [
	^ IceTipRepositoryContext
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
	sidebarTree widget dataSource: self newSidebarTreeDataSource.
	self selectCurrentBranch.
]

{ #category : #initialization }
IceTipRepositoryBrowser >> initializeWidgets [
	super initializeWidgets.	
	
	sidebarTree := self newIceOutline.
	historyPanel := self instantiate: IceTipHiedraHistoryBrowser on: self model headModel.
	historyPanel beForMerge.
	
	self initializeSidebarTree.
	sidebarTree widget
		onAnnouncement: FTSelectionChanged 
		send: #commitishSelected: 
		to: self. 
	
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
    self sidebarTree widget 
        in: [ :this | 
            this selectRowIndexes: #(). 
            this dataSource 
                rootForItems: self model repositoryModelsByGroup;
                expandRoots ];
        refresh.
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
	| index branch |
	branch := self model headModel.
	index := sidebarTree widget dataSource
		indexOfElementMatching: [ :each | each isLeaf and: [ each model name = branch name ] ].
	sidebarTree widget selectIndex: index
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
