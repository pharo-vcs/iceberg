running
testNewRepositoryHasPropertiesFileWithFileTreeInIndex
	| format |
	format := IceLibgitRepository defaultFileFormatType.
	[ | fixture |
	IceLibgitRepository defaultFileFormatType: IceLibgitFiletreeWriter name.
	fixture := IceBasicRepositoryFixture inGit.
	fixture setUp.
	fixture repository commitWithMessage: 'Add properties file'.
		1halt.
	self assert: fixture repository properties writerClass equals: IceLibgitFiletreeWriter.
	self assert: (fixture repository headCommit fileSystem resolve: fixture repository project propertiesFilePath) exists ]
		ensure: [ IceLibgitRepository defaultFileFormatType: format ]