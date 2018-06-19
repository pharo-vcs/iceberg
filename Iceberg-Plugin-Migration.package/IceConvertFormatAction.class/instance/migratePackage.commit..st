private
migratePackage: each commit: commit
	| filetreePackage srcDir subDirWithDelim |
	
	srcDir := self codeDirectory.
	subDirWithDelim := self codeDirectoryWithDelim.
	
	self writerClass forInternalStoreFileOut: (commit versionFor: each) mcVersion on: repository.
	filetreePackage := commit writerClass directoryNameFor: each.
	(srcDir / filetreePackage) ensureDeleteAll.
	self repository addFilesToIndex: { 
		subDirWithDelim, (IceLibgitTonelWriter directoryNameFor: each).
		subDirWithDelim, (IceLibgitFiletreeWriter directoryNameFor: each) }