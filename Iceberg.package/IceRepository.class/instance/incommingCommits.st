querying
incommingCommits
	| loadedCommits |
	loadedCommits := self workingCopies collect: [ :wc | 
		(self versionDescriptorFor: wc versionInfo) commitID hex  ].
	
	^ self allCommitsNewerThanAny: loadedCommits	