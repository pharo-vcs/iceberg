building
addRepositoryBranchesTo: composite
	| branches |
	
	(branches := composite fastTable)
		title: 'Branches';
		display: #branches;
		column: 'Name' evaluated: [ :branch :model | model descriptionTextForBranch: branch ];
		column: 'Status' evaluated: [ :branch :model | model statusForBranch: branch ].
		
	"actions"
	branches addAction: self branchCreateNew.
	"selection actions"
	branches 
		addSelectionAction: self branchSwitch;
		addSelectionAction: self branchCompareWithCurrent	