tests
testPropertiesFileIsStoredInDisk

	| ston |
	repository properties
		at: #bla put: #blo;
		store.
		
	ston := (STON fromStream: (repository codeDirectory / '.properties') readStream).
	self assert: (ston at: #bla) equals: #blo