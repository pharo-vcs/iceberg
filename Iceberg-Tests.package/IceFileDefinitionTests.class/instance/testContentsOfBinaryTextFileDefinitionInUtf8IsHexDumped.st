tests
testContentsOfBinaryTextFileDefinitionInUtf8IsHexDumped

	| definition hexDumped |
	hexDumped := self hexDumped: self class bytesWithIlegalLeadingBytes.
	
	definition := (IceFileDefinition
		named: 'aName'
		path: Path new
		contents: self class bytesWithIlegalLeadingBytes).
	
	self assert: definition contents equals: hexDumped.