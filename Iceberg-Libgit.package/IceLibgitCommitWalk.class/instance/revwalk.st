accessing
revwalk

	repository handleLibgitError: [
		^ revwalk
			ifNil: [ "Keep a reference to the repo so that it does not get garbage collected 
				(that would free C memory and make leave the revwalk object dumb)"
				lgitRepository := self repositoryHandle.
				revwalk := LGitRevwalk of: self repositoryHandle ]]