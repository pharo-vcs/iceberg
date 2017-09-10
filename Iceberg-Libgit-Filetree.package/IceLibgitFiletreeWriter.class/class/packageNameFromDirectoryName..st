accessing
packageNameFromDirectoryName: aString
	^ aString copyFrom: 1 to: (aString findString: '.package') - 1