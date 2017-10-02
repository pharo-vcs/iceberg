writing
writeVersion: aVersion
	(self repositoryDirectory / aVersion package name) ensureDeleteAll.
	self writeSnapshot: aVersion snapshot
	