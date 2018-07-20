running
testNewRepositoryHasPropertiesFileWithTonelInIndex
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