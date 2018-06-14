storing
addToIndex: anIceGitIndex 

	anIceGitIndex addPath: (self propertiesFileReference relativeTo: commitish fileSystem).
	anIceGitIndex addPath: '.project'