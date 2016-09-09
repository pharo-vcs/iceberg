commits
addCommit: newCommit
	commits ifNotNil: [
		"If commits are nil here, it means that they have not been loaded, 
		so the commit being added will be loaded when all commits are loaded.
		Current strategy loads all commits at once, at some point we will require to be smarter, 
		and allow to work loading only the latest commit when ther rest of them are not needed."
		commits add: (self repository addCommit: newCommit)
	]
