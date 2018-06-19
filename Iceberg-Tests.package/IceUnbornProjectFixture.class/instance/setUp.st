running
setUp

	super setUp.
	repository workingCopy project: (IceUnbornProject onRepository: repository).
	repository commitWithMessage: 'Remove project file'.
	repository workingCopy refreshProjectFromRepository.