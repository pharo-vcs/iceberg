actions
migratePackage: each commit: commit
	| filetreePackage srcDir subDirWithDelim |
	
	srcDir := self repository codeDirectory.
	subDirWithDelim := self repository subdirectory isEmptyOrNil 
		ifTrue: [ '' ]
		ifFalse: [ self repository subdirectory, '/' ].
	
	TonelWriter fileOut: (commit versionFor: each) on: srcDir.
	filetreePackage := IceLibgitFiletreeWriter directoryNameFor: each.
	(srcDir / filetreePackage) ensureDeleteAll.
	self repository addFilesToIndex: { 
		subDirWithDelim, (IceLibgitTonelWriter directoryNameFor: each).
		subDirWithDelim, (IceLibgitFiletreeWriter directoryNameFor: each) }