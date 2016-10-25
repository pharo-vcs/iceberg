tests - branchs
testBranchIncludesCommit
	(self lastCommits: 3) do: [ :commit |
		self assert: (repository branch includesCommit: commit) 
	]
	