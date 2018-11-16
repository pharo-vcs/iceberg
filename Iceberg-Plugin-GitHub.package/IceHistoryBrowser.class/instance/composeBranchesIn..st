building
composeBranchesIn: composite
	composite fastTable
		title: 'Branches';
		display: [ :repo | repo allBranches 
			collect: [ :branch | 
				IceHistory on: branch repository: repo ] ];
		column: 'Name' evaluated: [ :branch :repo | 
			self 
				descriptionTextForBranch: branch
				repository: repo ]