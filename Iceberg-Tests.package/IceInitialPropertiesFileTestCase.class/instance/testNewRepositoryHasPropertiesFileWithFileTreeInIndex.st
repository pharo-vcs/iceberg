running
testNewRepositoryHasPropertiesFileWithFileTreeInIndex
	| format |
	format := IceLibgitRepository defaultFileFormatType.
	[ | fixture |
	IceLibgitRepository defaultFileFormatType: IceLibgitFiletreeWriter name.
	fixture := IceBasicFixture inGit.
	fixture setUp.
	self assert: fixture repository properties writerClass equals: IceLibgitFiletreeWriter.
	self assert: (fixture repository index includes: fixture repository properties propertiesPath) ]
		ensure: [ IceLibgitRepository defaultFileFormatType: format ]