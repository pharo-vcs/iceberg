actions
merge: commitId 
	self command: { 'merge'. commitId . '-m'. '"Merge commit {1}"' format: commitId }