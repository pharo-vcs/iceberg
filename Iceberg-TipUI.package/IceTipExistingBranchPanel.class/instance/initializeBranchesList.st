initialization
initializeBranchesList
	| dataSource |
	branchesList widget
		addColumn: (IceTipTableColumn newAction: #shortDescriptionWithDecoration);
		dataSource: (dataSource := self newBranchListDataSource);
		bindKeyCombination: Character cr toAction: [ self accept ];
		onAnnouncement: FTStrongSelectionChanged do: [ self accept ].

	self model branchModels detect: #isHead ifFound: [ :head | branchesList widget selectRowIndex: (dataSource elements indexOf: head) ] ifNone: [ self model hasBranches ifTrue: [ branchesList widget selectFirstVisibleRow ] ]