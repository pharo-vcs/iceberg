auxiliar
saveNewVersion
	| newVersionNumber |
	newVersionNumber := self createLocalChanges.
	repository commitPackagesWithMessage: ('Saving version {1}' format: {newVersionNumber}).
