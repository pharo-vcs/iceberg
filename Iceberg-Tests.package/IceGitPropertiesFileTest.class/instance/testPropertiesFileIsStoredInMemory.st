tests
testPropertiesFileIsStoredInMemory

	| ston |
	self repository properties
		at: #bla put: #blo.
		
	self deny: (self repository codeDirectory / '.properties') exists.
	self assert: (self repository properties at: #bla) equals: #blo