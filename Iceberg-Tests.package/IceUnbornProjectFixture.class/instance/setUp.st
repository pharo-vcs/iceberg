running
setUp

	super setUp.
	repository workingCopy project: repository newUnbornProject.
	repository commitWithMessage: 'Remove project file'.
	repository workingCopy refreshProjectFromRepository.