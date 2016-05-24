repository handling
createLocalClone
	| readonly remoteUrl targetDirName |
	self in: self location parent executeCommand: 
		{'clone'.
		branch notNil ifTrue: {'-b'. branch}.
		readonly ifTrue: {'--depth'. '1'}.
		remoteUrl.
		location basename}
