testing
isDirty

	"Compare against the project extracted from the commit.
	If the commit has no project, it will be an unborn project."
	^ repository workingCopy referenceCommit basicProject ~= self