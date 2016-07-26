commits
loadCommits
	commitDictionary := Dictionary new.

	(self repository backend lookupCommitsInBranch: self name) do: [ :commit | 
		commit repository: self repository.
		commitDictionary at: commit commitId put: commit.
	].

	^ commitDictionary