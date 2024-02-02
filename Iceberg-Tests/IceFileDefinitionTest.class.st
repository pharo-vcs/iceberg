Class {
	#name : 'IceFileDefinitionTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Changes',
	#package : 'Iceberg-Tests',
	#tag : 'Changes'
}

{ #category : 'accessing' }
IceFileDefinitionTest class >> bytesWithIlegalLeadingBytes [

	^ #[102 111 111 160 102 111 111]
]

{ #category : 'tests' }
IceFileDefinitionTest >> hexDumped: bytesWithIlegalLeadingBytes [
	
	^ String streamContents: [ :str |
		bytesWithIlegalLeadingBytes hexDumpOn: str max: Float infinity ].
]

{ #category : 'tests' }
IceFileDefinitionTest >> testContentsOfBinaryTextFileDefinitionInUtf8IsHexDumped [

	| definition hexDumped |
	hexDumped := self hexDumped: self class bytesWithIlegalLeadingBytes.
	
	definition := (IceFileDefinition
		named: 'aName'
		path: Path new
		contents: self class bytesWithIlegalLeadingBytes).
	
	self assert: definition contents equals: hexDumped.
]

{ #category : 'tests' }
IceFileDefinitionTest >> testContentsOfTextFileDefinitionInUtf16IsHexDumped [

	| text definition bytes |
	text := 'aTextInutf8 î áüÅå∫∂'.
	bytes := text encodeWith: #utf16.
	
	definition := (IceFileDefinition
		named: 'aName'
		path: Path new
		contents: bytes).
	
	self assert: definition contents equals: (self hexDumped: bytes).
]

{ #category : 'tests' }
IceFileDefinitionTest >> testContentsOfTextFileDefinitionInUtf8IsDecoded [

	| text definition |
	text := 'aTextInutf8 î áüÅå∫∂'.
	definition := (IceFileDefinition
		named: 'aName'
		path: Path new
		contents: text utf8Encoded).
	
	self assert: definition contents equals: text.
]
