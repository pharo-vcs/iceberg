accessing
name
	^ 'Commits from {1} to {2}' format: { 
		self fromCommit shortId. 
		self toCommit shortId }