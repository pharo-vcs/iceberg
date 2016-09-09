actions
savePackage: packageName withMessage: commitMessage
	| package mcVersion |
	package := self getOrCreatePackageNamed: packageName.

	"File out changes"
	mcVersion := self 
		internalSavePackage: package
		withMessage: commitMessage.

	"Commit"
	self backend commit: { mcVersion } withMessage: commitMessage.
	
	"Update Monticello metadata"
	mcVersion info fromCommit: self headCommit package: package.
	package workingCopy versionInfo: mcVersion info.
	mcVersion addToCache.

	"Iceberg own announcements"
	self announcer announce: IceCommited new.
	