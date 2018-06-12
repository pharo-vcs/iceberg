running
setUp

	super setUp.
	(repository workingCopy fileSystem / '.project') ensureDelete.
	repository index addPath: '.project'.
	repository commitWithMessage: 'Remove project file'.