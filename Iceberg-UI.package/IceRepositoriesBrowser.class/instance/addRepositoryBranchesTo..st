building
addRepositoryBranchesTo: composite
	composite fastTable
		title: 'Branches';
		display: #branches;
		column: 'Name' evaluated: #name;
		column: 'Status' evaluated: [ :branch :model | model statusForBranch: branch ]