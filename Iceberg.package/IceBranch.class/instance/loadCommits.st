commits
loadCommits
	commits := SortedCollection sortBlock: [ :a :b | a datetime > b datetime ].
	self repository backend lookupCommitsInBranch: self name into: self.
