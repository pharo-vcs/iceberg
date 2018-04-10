auxiliar
saveNewVersion
	| newVersionNumber |
	newVersionNumber := self createLocalChanges.
	repository commitWithMessage: ('Saving version {1}' format: {newVersionNumber}).
