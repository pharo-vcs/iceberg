tests
testPropertiesFileIsStoredInDisk

	| ston |
	self repository properties
		at: #bla put: #blo;
		store.
		
	ston := (STON fromStream: (self repository codeDirectory / '.properties') readStream).
	self assert: (ston at: #bla) equals: #blo