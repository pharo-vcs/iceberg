tests
testContentsOfTextFileDefinitionInUtf8IsDecoded

	| text definition |
	text := 'aTextInutf8 î áüÅå∫∂'.
	definition := (IceFileDefinition
		named: 'aName'
		path: Path new
		contents: text utf8Encoded).
	
	self assert: definition contents equals: text.