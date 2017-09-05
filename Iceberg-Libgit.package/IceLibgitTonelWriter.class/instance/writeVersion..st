writing
writeVersion: aVersion
	(self repositoryDirectory / aVersion package name) deleteAll.
	self writeSnapshot: aVersion snapshot
	