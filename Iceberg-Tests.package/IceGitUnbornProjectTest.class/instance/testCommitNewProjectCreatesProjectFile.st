tests
testCommitNewProjectCreatesProjectFile

	self repository workingCopy project: (IceProject onRepository: self repository withSourceDirectory: fixture subdirectory).
	self repository commitWithMessage: 'Create project file'.
	self assert: (self repository headCommit fileSystem / '.project') exists