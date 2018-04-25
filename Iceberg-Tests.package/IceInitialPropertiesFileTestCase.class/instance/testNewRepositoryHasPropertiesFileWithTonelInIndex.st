running
testNewRepositoryHasPropertiesFileWithTonelInIndex
	| format |
	format := IceLibgitRepository defaultFileFormatType.
	[ | fixture |
	IceLibgitRepository defaultFileFormatType: IceLibgitTonelWriter name.
	fixture := IceBasicRepositoryFixture inGit.
	fixture setUp.
	self assert: fixture repository properties writerClass equals: IceLibgitTonelWriter.
	self assert: (fixture repository index includes: fixture repository properties propertiesPath) ]
		ensure: [ IceLibgitRepository defaultFileFormatType: format ]