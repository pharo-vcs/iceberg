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

{ #category : #commands }
IceTipHistoryBrowser class >> buildCommandsGroupWith: presenterIntance forRoot: rootCommandGroup [
	rootCommandGroup
		register: ((CmCommandGroup named: 'commit commands') asSpecGroup
			register: (IceTipCherryPickCommand forSpec context: presenterIntance )
		)
]

{ #category : #specs }
IceTipHistoryBrowser class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add: #toolbar expand: false fill: true padding: 0;
		add:
			(SpPanedLayout newVertical
				add: #commitList;
				add: #commitInfoTabs;
				yourself);
		yourself
]

{ #category : #specs }
IceTipHistoryBrowser class >> panelSpec [
	<spec>
	
	^ SpPanedLayout newVertical
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
	commitList
		beResizable;
		addColumn:
			((SpStringTableColumn
				evaluated: [ :each | each timeStamp asLocalStringYMDHM ])
				title: 'Timestamp';
				width: 110 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			((SpStringTableColumn evaluated: #shortId)
				title: 'Commit';
				width: 60 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			((SpStringTableColumn evaluated: #author)
				title: 'Author';
				width: 150 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			((SpStringTableColumn evaluated: #descriptionWithDecoration)
				title: 'Description';
				yourself);
		whenSelectionChangedDo: [ commitInfoTabs selectedModel: self selectedCommit ];
		selectIndex: 1;
		contextMenu:
				[ (self rootCommandsGroup / 'commit commands') beRoot asMenuPresenter ]
]

{ #category : #initialization }
IceTipHistoryBrowser >> initializeWidgets [
	super initializeWidgets.	
	commitList := self newTable.
	commitInfoTabs := self instantiate: IceTipCommitInfoPresenter.
	
	self initializeCommitList.
	
	self focusOrder 
		add: commitList;
		add: commitInfoTabs.
		
	self refreshCommitList.
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
	self refreshCommitList 
]

{ #category : #accessing }
IceTipHistoryBrowser >> refreshCommitList [
	| commitModels |
	commitModels := self model commitModels.
	commitList items: commitModels.
	commitInfoTabs selectedModel: (commitModels ifNotEmpty: #first ifEmpty: [ nil ])
]

{ #category : #accessing }
IceTipHistoryBrowser >> selectedCommit [
	^ commitList selection selectedItem
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
		ifNotNil: [ 'History of {1}' format: {self model repositoryName} ]
		ifNil: [ 'History' ]
]
