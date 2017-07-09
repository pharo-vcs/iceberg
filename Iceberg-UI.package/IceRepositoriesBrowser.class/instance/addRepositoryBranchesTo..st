building
addRepositoryBranchesTo: composite
	| branches |
	(branches := composite fastTreeTable)
		title: 'Branches';
		display: [ :repository | 
			| localisations |
			localisations := repository remotes collect: [ :remote | IceBranchGroupModel repository: repository remote: remote ] as: OrderedCollection.
			repository hasLocalBraches
				ifTrue: [ localisations addFirst: (IceBranchGroupModel localFromRepository: repository) ].
			localisations ];
		children: #children;
		column: 'Name' evaluated: #nameToDisplay;
		column: 'Status' evaluated: #status;
		allExpanded.

	"actions"
	branches addAction: self branchCreateNewAction.
	
	"selection actions"
	branches
		addSelectionAction: self branchSwitchAction;
		addSelectionAction: self branchCompareWithCurrentAction