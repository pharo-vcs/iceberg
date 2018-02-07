building
composeBranchesIn: composite
	composite fastTable
		title: 'Branches';
		display: #allBranches;
		column: 'Name' evaluated: [ :branch :repo | 
			self 
				descriptionTextForBranch: branch
				repository: repo ]
		