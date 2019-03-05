"
I'm a browser and panel to show the history of a commitish (usually a branch or a tag). 
I'm usually used as part of an IceTipRepositoryBrowser.

(self onBranch: IceRepository registry anyOne branch) openWithSpec.
"
Class {
	#name : #IceTipHistoryBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'commitList',
		'commitInfoTabs'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipHistoryBrowser class >> defaultSpec [
	<spec: #default>
	
	^ SpecBoxLayout newVertical 
		add: #toolbar withConstraints: [ :c | c height: IceTipToolbar defaultHeight ];
		add: (SpecPanedLayout newVertical
			add: #commitList;
			add: #commitInfoTabs;
			yourself);
		yourself
]

{ #category : #specs }
IceTipHistoryBrowser class >> panelSpec [
	<spec>
	
	^ SpecPanedLayout newVertical
		add: #commitList;
		add: #commitInfoTabs;
		yourself
]

{ #category : #accessing }
IceTipHistoryBrowser >> beForMerge [
	self commitInfoTabs beForMerge
]

{ #category : #accessing }
IceTipHistoryBrowser >> commitInfoTabs [
	^ commitInfoTabs
]

{ #category : #accessing }
IceTipHistoryBrowser >> commitInfoTabs: anObject [
	commitInfoTabs := anObject
]

{ #category : #'accessing ui' }
IceTipHistoryBrowser >> commitList [
	^ commitList
]

{ #category : #'accessing ui' }
IceTipHistoryBrowser >> commitList: anObject [
	commitList := anObject
]

{ #category : #accessing }
IceTipHistoryBrowser >> contextClass [
	^ IceTipHistoryContext
]

{ #category : #accessing }
IceTipHistoryBrowser >> initialExtent [
	^ (700@700) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipHistoryBrowser >> initializeCommitList [
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
IceTipHistoryBrowser >> initializeWidgets [
	super initializeWidgets.	
	commitList := self newIceTable.
	commitInfoTabs := self instantiate: IceTipCommitInfoPresenter.
	
	self initializeCommitList.
	
	commitList widget 
		onAnnouncement: FTSelectionChanged 
		send: #selectionChanged:
		to: self.
	
	self focusOrder 
		add: commitList;
		add: commitInfoTabs.
		
	self refresh
]

{ #category : #accessing }
IceTipHistoryBrowser >> model: anObject [
	super model: anObject.
	self refresh
]

{ #category : #'private factory' }
IceTipHistoryBrowser >> newCommitsDataSource [
	^ IceTipDataSource new 
		tool: self;
		elements: #(); "It will be set when refreshing"
		yourself
]

{ #category : #'private factory' }
IceTipHistoryBrowser >> newContextWithSelection: anObject [
	^ self newContext 
		item: anObject;
		yourself
]

{ #category : #accessing }
IceTipHistoryBrowser >> refresh [
	| commitModels |
	commitModels := self model commitModels.
	commitList widget
		in: [ :this | this dataSource elements: commitModels ];
		refresh.
	commitInfoTabs selectedModel: (commitModels ifNotEmpty: #first ifEmpty: [ nil ])
]

{ #category : #'event handling' }
IceTipHistoryBrowser >> selectionChanged: ann [
	commitInfoTabs
		selectedModel:
			(ann newSelectedIndexes
				ifNotEmpty:
					[ :indexes | self commitList widget dataSource elementAt: indexes first ]
				ifEmpty: [ nil ])
]

{ #category : #accessing }
IceTipHistoryBrowser >> title [
	^ self model  
		ifNotNil: [ 'History of {1}' format: { self model name } ]
		ifNil: [ 'History' ]
]
