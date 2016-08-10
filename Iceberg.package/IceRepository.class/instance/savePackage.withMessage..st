actions
savePackage: packageName withMessage: commitMessage
	| package version |
	package := self packageNamed: packageName.
	version := self 
		internalSavePackage: package
		withMessage: commitMessage.

	self backend commit: { version } withMessage: commitMessage.
	
	"This is slow but it is required to replace working copy version info 
	with the info created by our backend, we should find a smarter way."
	self refresh.
	package workingCopy versionInfo: package versions first info.

	self announcer announce: IceCommited new.
	