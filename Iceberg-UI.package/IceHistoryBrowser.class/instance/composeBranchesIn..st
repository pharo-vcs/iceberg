building
composeBranchesIn: composite
	composite fastTable
		title: 'Branches';
		display: #branchesForCheckout;
		column: 'Name' evaluated: [ :branch | branch name ]
		