writing
addPropertiesFileToChangeBuilder: anIceChangeImporter 

	self repositoryProperties isUnborn
		ifTrue: [ ^ self ].

	1halt.
	anIceChangeImporter
		addFileNamed: self propertiesFilePath segments last
		path: self propertiesFilePath
		contents: self repositoryProperties contentsString.