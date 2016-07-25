private
loadAllCommits
	commitDictionary := Dictionary new.

	self repository lookupCommitsInCurrentBranch do: [ :commit | 
		commit repository: self.
		commitDictionary at: commit commitId put: commit.
	].

	^ commitDictionary