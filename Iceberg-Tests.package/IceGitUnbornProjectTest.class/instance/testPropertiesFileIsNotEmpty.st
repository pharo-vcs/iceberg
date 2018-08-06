tests
testPropertiesFileIsNotEmpty

	| props |
	props := STON fromStream: (self repository workingCopy fileSystem / '.properties') readStream.
	self assert: (props includesKey: #format)
	
	
	