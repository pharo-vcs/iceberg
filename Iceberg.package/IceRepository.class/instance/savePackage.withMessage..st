actions
savePackage: packageName withMessage: commitMessage
	| package mcVersion newCommit |
	package := self getOrCreatePackageNamed: packageName.

	"File out changes"
	mcVersion := self 
		internalSavePackage: package
		withMessage: commitMessage.

	"Commit"
	newCommit := self backend commit: { mcVersion } withMessage: commitMessage.
	
	"Update Monticello metadata"
	mcVersion info fromCommit: newCommit package: package.
	package workingCopy versionInfo: mcVersion info.
	mcVersion addToCache.

	"Iceberg own announcements"
	loadedCode commited: newCommit changingPackages: { package }.
	self announcer announce: IceCommited new.
	