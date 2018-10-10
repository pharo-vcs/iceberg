private
migratePackage: packageName commit: commit
	| filetreePackage srcDir subDirWithDelim mcVersion |
	
	srcDir := self codeDirectory.
	subDirWithDelim := self codeDirectoryWithDelim.
	
	mcVersion := (commit versionFor: packageName) mcVersion.
	mcVersion := self ensureMCVersionWithClassOrganisation: mcVersion.
	self writerClass 
		forInternalStoreFileOut: mcVersion 
		on: repository.
	filetreePackage := commit writerClass directoryNameFor: packageName.
	(srcDir / filetreePackage) ensureDeleteAll.
	self repository addFilesToIndex: { 
		subDirWithDelim, (IceLibgitTonelWriter directoryNameFor: packageName).
		subDirWithDelim, (IceLibgitFiletreeWriter directoryNameFor: packageName) }