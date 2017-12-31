printing
longDescription
	
	| branchName |
	branchName := repository branchName.
	^  'Commit pending changes to {1}. The working copy has changes to commit. The repository is set in branch {1} and the image is synchronized to it. Proceed to commit before doing anything else (like synchronizing with external repositories).'
		format: { branchName }.