writing
addToChangeBuilder: anIceChangeImporter 

	anIceChangeImporter
		addFileNamed: self propertiesFilePath segments last
		path: self propertiesFilePath
		contents: self contentsString