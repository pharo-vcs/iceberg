auxiliar
tempDirectories
	^ super tempDirectories, { 
		self absoluteLocation.  
		'github-cache' asFileReference / 'pharo-vcs' / 'pharo-git-test'
	}