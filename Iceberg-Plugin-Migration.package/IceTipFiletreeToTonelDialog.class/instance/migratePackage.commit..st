actions
migratePackage: each commit: commit
	| filetreePackage srcDir subDirWithDelim |
	
	srcDir := self codeDirectory.
	subDirWithDelim := self codeDirectoryWithDelim.
	
	TonelWriter fileOut: (commit versionFor: each) on: srcDir.
	filetreePackage := IceLibgitFiletreeWriter directoryNameFor: each.
	(srcDir / filetreePackage) ensureDeleteAll.
	self repository addFilesToIndex: { 
		subDirWithDelim, (IceLibgitTonelWriter directoryNameFor: each).
		subDirWithDelim, (IceLibgitFiletreeWriter directoryNameFor: each) }