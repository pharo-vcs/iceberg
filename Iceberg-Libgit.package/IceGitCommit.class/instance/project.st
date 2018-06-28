API-project
project

	"In case the commit does not have a project file, we the project of the working copy as a fallback.
	This case is special for old pre-project code, for backwards compatibility"
	^ (self fileSystem / '.project') exists
		ifTrue: [ self basicProject ]
		ifFalse: [ self repository workingCopy project ]