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
	#category : #'Iceberg-TipUI-View-Versions'
}

{ #category : #specs }
IceTipVersionHistoryBrowser class >> defaultSpec [
	<spec: #default>
	
	^ SpPanedLayout newVertical
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
	commitList
		beResizable;
		addColumn:
			(SpStringTableColumn new
				title: 'Timestamp';
				evaluated: [ :each | each timeStamp asLocalStringYMDHM ];
				width: 110 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			(SpStringTableColumn new
				title: 'Commit';
				evaluated: #shortId;
				width: 60 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			(SpStringTableColumn new
				title: 'Author';
				evaluated: #author;
				width: 150 * self currentWorld displayScaleFactor;
				yourself);
		addColumn:
			(SpStringTableColumn new
				title: 'Description';
				evaluated: #descriptionWithDecoration;
				yourself);
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
	commitList := self newTable.
	commitPanel := self newNotebook.
	
	self initializeCommitList.
	self initializeCommitPanel.
	
	commitList whenSelectionChangedDo: [ :s |
		self selectionChanged: s ].
	
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

	^ SpNotebookPage  
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

	^ SpNotebookPage  
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

	commitList items: self model commitModels.
	selectedModel := self model commitModels 
		ifNotEmpty: #first
		ifEmpty: [ nil ].
	self refreshCommitTabPanel
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

{ #category : #'event handling' }
IceTipVersionHistoryBrowser >> selectionChanged: aSelection [

	selectedModel := aSelection selectedItem.
	self refreshCommitTabPanel
]

{ #category : #accessing }
IceTipVersionHistoryBrowser >> title [

	^ self model  
		ifNotNil: [ 'Versions of {1}' format: { self model name } ]
		ifNil: [ 'Versions' ]
]
