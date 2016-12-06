auxiliar
tempDirectories
	^ super tempDirectories, { 
		self absoluteLocation.  
		'github-cache' asFileReference / 'npasserini' / 'pharo-git-test'
	}