private
loadAllCommits
	commits := Dictionary new.

	self repository lookupCommitsInCurrentBranch do: [ :commit | 
		commit addToRepository: self.
	].

	^ commits