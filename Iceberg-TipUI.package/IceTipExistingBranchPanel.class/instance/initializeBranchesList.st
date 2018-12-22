initialization
initializeBranchesList
	| dataSource |
	branchesList widget
		addColumn: (IceTipTableColumn newAction: #shortDescriptionWithDecoration);
		dataSource: (dataSource := self newBranchListDataSource);
		bindKeyCombination: Character cr toAction: [ self accept ];
		onAnnouncement: FTStrongSelectionChanged do: [ self accept ].
	
	"
	We would prefere to have this implementation but for now we have a bug with the caches because #branchModels return the same cache used by the datasource but not #defaultBranchSelection. If we correct that later we can clean the code bellow.
	
	self model defaultBranchSelection ifNotNil: [ :branchModel | branchesList widget selectRowIndex: (dataSource elements indexOf: branchModel) ]."
	
	self model branchModels detect: #isHead ifFound: [ :head | branchesList widget selectRowIndex: (dataSource elements indexOf: head) ] ifNone: [ self model hasBranches ifTrue: [ branchesList widget selectFirstVisibleRow ] ]