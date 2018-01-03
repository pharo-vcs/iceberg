printing
longDescription
	
	^  'The repository is not placed in a branch, and thus commits are not possible. 
	- (Recommended) Create a new branch from current commit {1}. This will prevent (complicated) merges due to unrelated histories and losing changes. Merges can be done once changes are safe.
	- Discard all local changes and checkout an existing branch.
	- (Advanced) Switch to an existing branch without loading the code. This may provoke merges of unrelated histories in the image and potential lose of changes.' format: { self workingCopyCommitName }.