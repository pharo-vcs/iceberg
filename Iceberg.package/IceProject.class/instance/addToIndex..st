storing
addToIndex: anIceGitIndex 
	1halt.
	anIceGitIndex addPath: (self propertiesFileReference relativeTo: commitish fileSystem).
	anIceGitIndex addPath: '.project'