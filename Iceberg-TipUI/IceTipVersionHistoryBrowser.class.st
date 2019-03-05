"
I'm a browser and panel to show the version history of a method. 

(self onRepository: aRepository method: aMethod) openWithSpec.
"
Class {
	#name : #IceTipVersionHistoryBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'commitList',
		'selectedModel',
		'infoPage',
		'diffPage',
		'commitPanel'
	],
	#category : 'Iceberg-TipUI-View-Versions'
}

{ #category : #specs }
IceTipVersionHistoryBrowser class >> defaultSpec [
	<spec: #default>
	
	^ SpecPanedLayout newVertical
		add: #commitList;
		add: #commitPanel;
		yourself
]

{ #category : #'instance creation' }
IceTipVersionHistoryBrowser class >> onRepository: aRepository method: aMethod [
	
	^ self on: (IceTipVersionHistoryModel 
		repositoryModel: (IceTipRepositoryModel on: aRepository) beCached 
		on: aMethod)
		beCached
]

{ #category : #accessing }
IceTipVersionHistoryBrowser >> commitList [

	^ commitList
]

{ #category : #'accessing ui' }
IceTipVersionHistoryBrowser >> commitList: anObject [
	commitList := anObject
]

{ #category : #'accessing ui' }
IceTipVersionHistoryBrowser >> commitTabPanel [
	^ commitTabPanel
]

{ #category : #'accessing ui' }
IceTipVersionHistoryBrowser >> commitTabPanel: anObject [
	commitTabPanel := anObject
]

{ #category : #accessing }
IceTipVersionHistoryBrowser >> contextClass [
	"I want to inherit same activations as in a regular history browser, but commit comes from a 
	 diferent place. And I want some other functions (like a 'install' method)"

	^ IceTipVersionHistoryContext
]

{ #category : #private }
IceTipVersionHistoryBrowser >> diff [
	
	selectedModel ifNil: [ ^ self ].
	^ self 
		newDiffPanelLeft: ((self model commitModelAfter: selectedModel) 
			ifNotNil: #source
			ifNil: [ '' ])
		right: selectedModel source
]

{ #category : #private }
IceTipVersionHistoryBrowser >> info [ 
	
	selectedModel ifNil: [ ^ self ].
	^ IceTipReadOnlyForm items: selectedModel info
]

{ #category : #accessing }
IceTipVersionHistoryBrowser >> initialExtent [

	^ (700@700) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipVersionHistoryBrowser >> initializeCommitList [
	commitList widget
		beResizable;
		addColumn:
			(IceTipTableColumn new
				id: 'Timestamp';
				action: [ :each | each timeStamp asLocalStringYMDHM ];
				width: 110 * World displayScaleFactor;
				yourself);
		addColumn:
			(IceTipTableColumn new
				id: 'Commit';
				action: #shortId;
				width: 60 * World displayScaleFactor;
				yourself);
		addColumn:
			(IceTipTableColumn new
				id: 'Author';
				action: #author;
				width: 150 * World displayScaleFactor;
				yourself);
		addColumn:
			(IceTipTableColumn new
				id: 'Description';
				action: #descriptionWithDecoration;
				yourself);
		dataSource: self newCommitsDataSource;
		selectIndex: 1
]

{ #category : #initialization }
IceTipVersionHistoryBrowser >> initializeCommitPanel [
	"This will be initialised in fact on the first refresh"

	commitPanel
		addPage: (infoPage := self newInfoPage);
		addPage: (diffPage := self newDiffPage 
			title: 'Diff from ancestor';
			presenterProvider: [ self diff ];
			yourself)
]

{ #category : #initialization }
IceTipVersionHistoryBrowser >> initializeToolbar [
	"no toolbar"
]

{ #category : #initialization }
IceTipVersionHistoryBrowser >> initializeWidgets [

	super initializeWidgets.	
	commitList := self newIceTable.
	commitPanel := self newNotebook.
	
	self initializeCommitList.
	self initializeCommitPanel.
	
	commitList widget 
		onAnnouncement: FTSelectionChanged 
		send: #selectionChanged:
		to: self.
	
	self focusOrder 
		add: commitList;
		add: commitPanel.
		
	self refresh
]

{ #category : #accessing }
IceTipVersionHistoryBrowser >> model: anObject [

	super model: anObject.
	self refresh
]

{ #category : #'private factory' }
IceTipVersionHistoryBrowser >> newCommitsDataSource [
	^ IceTipDataSource new 
		tool: self;
		elements: #(); "It will be set when refreshing"
		yourself
]

{ #category : #'private factory' }
IceTipVersionHistoryBrowser >> newContextWithSelection: anObject [

	^ self newContext 
		item: anObject;
		yourself
]

{ #category : #'private factory' }
IceTipVersionHistoryBrowser >> newDiffPage [

	^ NotebookPage 
		title: 'Diff'
		icon: (self iconNamed: #diff)
		provider: [ self diff ]
]

{ #category : #'private factory' }
IceTipVersionHistoryBrowser >> newDiffPanelLeft: leftString right: rightString [

	^ (self instantiate: DiffPresenter) 
		leftText: leftString;
		rightText: rightString;
		showOptions: false
]

{ #category : #'private factory' }
IceTipVersionHistoryBrowser >> newDiffTab [
	^ self newTab 
		label: 'Diff';
		icon: (self iconNamed: #diff);
		closeable: false;
		yourself
]

{ #category : #'private factory' }
IceTipVersionHistoryBrowser >> newEmptyTab [
	^ self newTab 
		label: 'Info';
		icon: (self iconNamed: #smallQuestion);
		closeable: false;
		contents: '(No commit selected)' asMorph;
		yourself
]

{ #category : #'private factory' }
IceTipVersionHistoryBrowser >> newInfoPage [

	^ NotebookPage 
		title: 'Info'
		icon: (self iconNamed: #smallQuestion)
		provider: [ self info ]

]

{ #category : #'private factory' }
IceTipVersionHistoryBrowser >> newInfoTab [
	^ self newTab 
		label: 'Info';
		icon: (self iconNamed: #smallQuestion);
		closeable: false;
		yourself
]

{ #category : #accessing }
IceTipVersionHistoryBrowser >> refresh [

	commitList widget 
		in: [ :this | this dataSource elements: self model commitModels ];
		refresh.
	selectedModel := self model commitModels 
		ifNotEmpty: #first
		ifEmpty: [ nil ].
	self refreshCommitTabPanel
]

{ #category : #private }
IceTipVersionHistoryBrowser >> refreshCommitInfo [
	infoTab contents: (selectedModel info ifNotNil: [ 
		(IceTipReadOnlyForm items: selectedModel info) buildWithSpec ])
]

{ #category : #private }
IceTipVersionHistoryBrowser >> refreshCommitTabPanel [
	
	selectedModel ifNil: [ ^ self ].
	diffPage title: ('{1} to {2}' format: { 
		(self model commitModelAfter: selectedModel) 
			ifNotNil: #shortId
			ifNil: [ 'origin' ].
		selectedModel shortId }).
	commitPanel resetAllPageContents
]

{ #category : #private }
IceTipVersionHistoryBrowser >> refreshDiff [
	selectedModel ifNil: [ ^ self ].
	
	diffTab contents: (self 
		newDiffPanelLeft: ((self model commitModelAfter: selectedModel) 
			ifNotNil: #source
			ifNil: [ '' ] )
		right: selectedModel source)
]

{ #category : #private }
IceTipVersionHistoryBrowser >> refreshDiffLabel [
	
	diffTab label: ('{1} to {2}' format: { 
		(self model commitModelAfter: selectedModel) 
			ifNotNil: #shortId
			ifNil: [ 'origin' ].
		selectedModel shortId })
]

{ #category : #private }
IceTipVersionHistoryBrowser >> removeAllCommitPanelTabs [
	commitTabPanel tabs copy 
		do: [ :each | commitTabPanel removeTab: each ]
]

{ #category : #'event handling' }
IceTipVersionHistoryBrowser >> selectionChanged: ann [

	selectedModel := ann newSelectedRowIndexes 
		ifNotEmpty: [ :indexes |(self commitList widget dataSource elementAt: indexes first) ]
		ifEmpty: [ nil ].
	self refreshCommitTabPanel
]

{ #category : #private }
IceTipVersionHistoryBrowser >> showEmptyTab [
	emptyTab ifNil: [ emptyTab := self newEmptyTab ].
	self removeAllCommitPanelTabs.
	commitTabPanel addTab: emptyTab.
]

{ #category : #private }
IceTipVersionHistoryBrowser >> showInfoTabs [
	"This is just an optimisation to not refresh always. This way it will happen 
	 just if we come from a 'non-selection'"
	
	(commitTabPanel tabs includes: infoTab) ifFalse: [
		self removeAllCommitPanelTabs.
		commitTabPanel 
			addTab: infoTab ;
			addTab: diffTab ]. 
	
	self refreshCommitInfo.
	self refreshDiffLabel.
	"Refresh selected tab contents"
	
	commitTabPanel selectedTab ifNotNil: #tabSelected.
]

{ #category : #accessing }
IceTipVersionHistoryBrowser >> title [

	^ self model  
		ifNotNil: [ 'Versions of {1}' format: { self model name } ]
		ifNil: [ 'Versions' ]
]
