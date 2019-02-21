Class {
	#name : #IceFileDefinitionTests,
	#superclass : #TestCase,
	#category : 'Iceberg-Tests-Changes'
}

{ #category : #'as yet unclassified' }
IceFileDefinitionTests class >> bytesWithIlegalLeadingBytes [

	^ #[102 111 111 160 102 111 111]
]

{ #category : #tests }
IceFileDefinitionTests >> hexDumped: bytesWithIlegalLeadingBytes [
	
	^ String streamContents: [ :str |
		bytesWithIlegalLeadingBytes hexDumpOn: str max: Float infinity ].
]

{ #category : #tests }
IceFileDefinitionTests >> testContentsOfBinaryTextFileDefinitionInUtf8IsHexDumped [

	| definition hexDumped |
	hexDumped := self hexDumped: self class bytesWithIlegalLeadingBytes.
	
	definition := (IceFileDefinition
		named: 'aName'
		path: Path new
		contents: self class bytesWithIlegalLeadingBytes).
	
	self assert: definition contents equals: hexDumped.
]

{ #category : #tests }
IceFileDefinitionTests >> testContentsOfTextFileDefinitionInUtf16IsHexDumped [

	| text definition bytes |
	text := 'aTextInutf8 î áüÅå∫∂'.
	bytes := text encodeWith: #utf16.
	
	definition := (IceFileDefinition
		named: 'aName'
		path: Path new
		contents: bytes).
	
	self assert: definition contents equals: (self hexDumped: bytes).
]

{ #category : #tests }
IceFileDefinitionTests >> testContentsOfTextFileDefinitionInUtf8IsDecoded [

	| text definition |
	text := 'aTextInutf8 î áüÅå∫∂'.
	definition := (IceFileDefinition
		named: 'aName'
		path: Path new
		contents: text utf8Encoded).
	
	self assert: definition contents equals: text.
]
