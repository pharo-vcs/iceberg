commits
addCommit: newCommit
	"Notice that we have just commited into this branch so it has a new commit."

	| realCommit |
	commits ifNotNil: [
		"If commits are nil here, it means that they have not been loaded, 
		so the commit being added will be loaded when all commits are loaded.
		Current strategy loads all commits at once, at some point we will require to be smarter, 
		and allow to work loading only the latest commit when ther rest of them are not needed."

		"First add it to the repository (in fact the repository could have another version of the commit, in this case use it."
		realCommit := (self repository addCommit: newCommit).
		
		(commits notEmpty and: [commits first = newCommit]) ifTrue: [ 
			"Commit is already loaded, this is right, the repository just loaded the commits of this branch so the branch is up to date, do nothing."
			^ self
		]. 
	
		(commits includes: realCommit) ifTrue: [ 
			"Commit is already loaded but is not the last one... this should not happen."
			self error: 'Inconsistent commit history... this is most probably a bug, please report it'. ].

		"Everything is ok, just remember the new commit."
		commits add: realCommit.
	]
