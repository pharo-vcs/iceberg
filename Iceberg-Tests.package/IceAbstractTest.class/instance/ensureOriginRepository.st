running
ensureOriginRepository
	^ self 
		ensureOriginRepository: ('https://github.com/pharo-vcs/{1}.git' format: { projectName })
		for: projectName