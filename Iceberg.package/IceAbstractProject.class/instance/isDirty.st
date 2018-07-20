testing
isDirty
	"Compare against the project extracted from the HEAD commit.
	If the commit has no project, it will be an unborn project."
	^ self repository workingCopy referenceCommit project ~= self readOnlyVersion