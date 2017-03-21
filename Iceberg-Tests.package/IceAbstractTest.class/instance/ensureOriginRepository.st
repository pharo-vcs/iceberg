running
ensureOriginRepository
	^ self 
		ensureOriginRepository: ('https://github.com/npasserini/{1}.git' format: { projectName })
		for: projectName