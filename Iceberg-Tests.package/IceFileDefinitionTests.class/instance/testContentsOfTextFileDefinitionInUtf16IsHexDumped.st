tests
testContentsOfTextFileDefinitionInUtf16IsHexDumped

	| text definition bytes |
	text := 'aTextInutf8 î áüÅå∫∂'.
	bytes := text encodeWith: #utf16.
	
	definition := (IceFileDefinition
		named: 'aName'
		path: Path new
		contents: bytes).
	
	self assert: definition contents equals: (self hexDumped: bytes).