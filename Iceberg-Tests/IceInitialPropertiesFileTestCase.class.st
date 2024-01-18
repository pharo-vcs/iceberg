Class {
	#name : 'IceInitialPropertiesFileTestCase',
	#superclass : 'IceParameterizedTestCase',
	#category : 'Iceberg-Tests-Formats',
	#package : 'Iceberg-Tests',
	#tag : 'Formats'
}

{ #category : 'running' }
IceInitialPropertiesFileTestCase >> testNewRepositoryHasPropertiesFileWithFileTreeInIndex [
	| format |
	format := IceLibgitRepository defaultFileFormatType.
	[ | fixture |
	IceLibgitRepository defaultFileFormatType: IceLibgitFiletreeWriter name.
	fixture := IceBasicRepositoryFixture inGit.
	fixture setUp.
	fixture repository commitWithMessage: 'Add properties file'.

	self assert: fixture repository properties writerClass equals: IceLibgitFiletreeWriter.
	self assert: (fixture repository headCommit fileSystem resolve: fixture repository properties propertiesFilePath) exists ]
		ensure: [ IceLibgitRepository defaultFileFormatType: format ]
]

{ #category : 'running' }
IceInitialPropertiesFileTestCase >> testNewRepositoryHasPropertiesFileWithTonelInIndex [
	| format |
	format := IceLibgitRepository defaultFileFormatType.
	[ | fixture |
	IceLibgitRepository defaultFileFormatType: IceLibgitTonelWriter name.
	fixture := IceBasicRepositoryFixture inGit.
	fixture setUp.
	fixture repository commitWithMessage: 'Add properties file'.

	self assert: fixture repository properties writerClass equals: IceLibgitTonelWriter.
	self assert: (fixture repository headCommit fileSystem resolve: fixture repository properties propertiesFilePath) exists ]
		ensure: [ IceLibgitRepository defaultFileFormatType: format ]
]
