API-history
includesCommit: anIceCommit
	^ [ self lookupCommit: anIceCommit id. true ] 
		on: LGit_GIT_ENOTFOUND do: [ false ]