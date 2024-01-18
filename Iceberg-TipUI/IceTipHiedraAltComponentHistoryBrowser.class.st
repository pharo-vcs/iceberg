Class {
	#name : 'IceTipHiedraAltComponentHistoryBrowser',
	#superclass : 'IceTipHistoryBrowser',
	#instVars : [
		'hiedraColumnController'
	],
	#category : 'Iceberg-TipUI-View-Repository-HiedraAlt',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository-HiedraAlt'
}

{ #category : 'commands' }
IceTipHiedraAltComponentHistoryBrowser >> availableCommands [ 
	| rootGroup |
	
	rootGroup := self rootCommandsGroup.
	IceTipCleanCommandGroupVisitor new visit: rootGroup.
	^ rootGroup
]

{ #category : 'commands' }
IceTipHiedraAltComponentHistoryBrowser >> contextMenuCommands [

	self availableCommands
		commandOrGroupNamed: self class selectionCommandGroupName
		ifFound: [ :subgroup | 
			^ subgroup beRoot asMenuPresenter ].
		
	self error: 'Should not arrive here'
]

{ #category : 'initialization' }
IceTipHiedraAltComponentHistoryBrowser >> initializeCommitList [

	self error: 'Should not arrive here'
]

{ #category : 'initialization' }
IceTipHiedraAltComponentHistoryBrowser >> initializeHiedraColumn [
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
IceTipHiedraAltComponentHistoryBrowser >> initializePresenters [

	commitList := self newComponentList.
	commitList contextMenu: [ self contextMenuCommands ].
	
	commitInfoTabs := self instantiate: IceTipCommitInfoPresenter.
	
	self initializeHiedraColumn
]

{ #category : 'initialization' }
IceTipHiedraAltComponentHistoryBrowser >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
]

{ #category : 'initialization' }
IceTipHiedraAltComponentHistoryBrowser >> newCommitRow: index commit: item [ 
	
	^ self 
		instantiate: IceTipHiedraAltHistoryRowPresenter 
		on: { (hiedraColumnController formAtRow: index). item }
]

{ #category : 'accessing' }
IceTipHiedraAltComponentHistoryBrowser >> refresh [

	self refreshHiedraColumn.
	super refresh
]

{ #category : 'commands' }
IceTipHiedraAltComponentHistoryBrowser >> refreshCommands [

	self refreshToolbarWith: self availableCommands
]

{ #category : 'accessing' }
IceTipHiedraAltComponentHistoryBrowser >> refreshCommitList [
	| commitModels |
	
	commitModels := self model commitModels.
	commitList model: (SpGeneratorListModel on: [ :generator | 
		commitModels withIndexDo: [ :each :index |
			generator yield: (self newCommitRow: index commit: each) ] ]).
	commitInfoTabs selectedModel: (commitModels ifNotEmpty: #first ifEmpty: [ nil ])
]

{ #category : 'accessing' }
IceTipHiedraAltComponentHistoryBrowser >> refreshHiedraColumn [
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
IceTipHiedraAltComponentHistoryBrowser >> selectedCommit [

	^ commitList selection selectedItem ifNotNil: #item
]

{ #category : 'accessing' }
IceTipHiedraAltComponentHistoryBrowser >> selectedItem [

	^ self selectedCommit
]

{ #category : 'initialization' }
IceTipHiedraAltComponentHistoryBrowser >> updatePresenter [

	"self refresh"
]
