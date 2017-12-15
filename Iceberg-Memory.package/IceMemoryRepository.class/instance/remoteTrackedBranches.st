remote-branches
remoteTrackedBranches

	^ remotes flatCollect: [ :each | each branches ]