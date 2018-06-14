tests
testPropertiesFileIsStoredInMemory

	| ston |
	self repository properties
		at: #bla put: #blo.
		
	ston := (STON fromStream: (self repository codeDirectory / '.properties') readStream).
	self deny: (ston includesKey: #bla) equals: #blo.
	self assert: (self repository properties at: #bla) equals: #blo