Class {
	#name : 'IceTipHiedraAltHistoryBrowser',
	#superclass : 'IceTipHistoryBrowser',
	#instVars : [
		'hiedraColumnController'
	],
	#category : 'Iceberg-TipUI-View-Repository-HiedraAlt',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository-HiedraAlt'
}

{ #category : 'commands' }
IceTipHiedraAltHistoryBrowser >> availableCommands [ 
	| rootGroup |
	
	rootGroup := self rootCommandsGroup.
	IceTipCleanCommandGroupVisitor new visit: rootGroup.
	^ rootGroup
]

{ #category : 'commands' }
IceTipHiedraAltHistoryBrowser >> contextMenuCommands [

	self availableCommands
		commandOrGroupNamed: self class selectionCommandGroupName
		ifFound: [ :subgroup | 
			^ subgroup beRoot asMenuPresenter ].
		
	self error: 'Should not arrive here'
]

{ #category : 'initialization' }
IceTipHiedraAltHistoryBrowser >> initializeCommitList [

	commitList
		beResizable;
		addColumn: (SpCompositeTableColumn new
			title: 'Commit';		
			addColumn: (SpImageTableColumn new 
				evaluated: [ :each | 
					(hiedraColumnController formAtRow: (commitList items indexOf: each) ) ];
				"beNotExpandable;"
				yourself);
			addColumn: (SpStringTableColumn new
				evaluated: [ :each | each tagsDescription ];				
				displayColor: [ :each | each tagDecorator color ];
				displayBold: [ :each | each tagDecorator isBold ];
				displayItalic: [ :each | each tagDecorator isItalic ];
				yourself);
			addColumn: (SpStringTableColumn new
				evaluated: #shortDescription;				
				yourself);
			yourself);
		addColumn: (SpStringTableColumn new
			title: 'Author';
			evaluated: #author;				
			width: 180;
			yourself);
		addColumn: ((SpStringTableColumn
			evaluated: [ :each | each timeStamp asLocalStringYMDHM ])
			title: 'Timestamp';
			width: 120;
			yourself);			
		whenSelectionChangedDo: [ :aSelection | 
			self selectionChanged: aSelection selectedItem ]
]

{ #category : 'initialization' }
IceTipHiedraAltHistoryBrowser >> initializeHiedraColumn [
	| ancestorIds |
	
	hiedraColumnController := HiColumnController new.
	hiedraColumnController renderer
		linkWidth: 3.5;
		nodeRadius: 1.5;
		nodeBorderWidth: 3.0;
		arrowSize: 0;
		nodeConnectionOffset: 3;
		cellWidth: 7";
		useUniformColorStrategy".

	ancestorIds := Dictionary new.
	self model commitModels do: [ :aCommit |
		"Note: Hiedra expects each ancestor id corresponds to a commit in elements."
		ancestorIds
			at: aCommit id
			put: aCommit entity ancestorIds ].

	hiedraColumnController ruler: (HiRulerBuilder
		"Note: ids should keep the original order."
		newRulerValues: (self model commitModels collect: #id) 
		linksBlock: [ :id | ancestorIds at: id ]).

	hiedraColumnController renderer rowHeight: 20
]

{ #category : 'initialization' }
IceTipHiedraAltHistoryBrowser >> initializePresenters [

	commitList := self newTable.
	commitList contextMenu: [ self contextMenuCommands ].
	
	commitInfoTabs := self instantiate: IceTipCommitInfoPresenter.
	
	self initializeHiedraColumn.
	self initializeCommitList	
]

{ #category : 'initialization' }
IceTipHiedraAltHistoryBrowser >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
]

{ #category : 'initialization' }
IceTipHiedraAltHistoryBrowser >> newCommitRow: index commit: item [ 
	
	^ self 
		instantiate: IceTipHiedraAltHistoryRowPresenter 
		on: { (hiedraColumnController formAtRow: index). item }
]

{ #category : 'accessing' }
IceTipHiedraAltHistoryBrowser >> refresh [

	self refreshHiedraColumn.
	super refresh
]

{ #category : 'commands' }
IceTipHiedraAltHistoryBrowser >> refreshCommands [

	self refreshToolbarWith: self availableCommands
]

{ #category : 'accessing' }
IceTipHiedraAltHistoryBrowser >> refreshHiedraColumn [
	| ancestorIds walk |

	self flag: #TODO. "Move this to a model"
	ancestorIds := OrderedDictionary new.
	walk := self model entity newCommitWalk. 
	walk revwalk 
		beSortedByCommitTime;
		beSortedParentsBeforeChildren.
	walk commitsDo: [ :aCommit |
		ancestorIds
			at: aCommit id
			put: aCommit ancestorIds ].
	hiedraColumnController reset.

	"Note: ids should keep the original order to generate the ruler correctly."
	hiedraColumnController ruler: (HiRulerBuilder
		newRulerValues: ancestorIds keys
		linksBlock: [ :id | ancestorIds at: id ])
]

{ #category : 'accessing' }
IceTipHiedraAltHistoryBrowser >> selectedItem [

	^ self selectedCommit
]

{ #category : 'initialization' }
IceTipHiedraAltHistoryBrowser >> updatePresenter [

	"self refresh"
]
