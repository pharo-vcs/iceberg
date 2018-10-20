private-pushing
basicPushTo: aRemote
	| gitRemote |
	
	gitRemote := (LGitRemote of: self repositoryHandle named: aRemote name) lookup.
	[ 
		| pushProgress |
		pushProgress := IcePushTransferProgress new.
		"Push branch"
		self 
			pushBranchToRemote: aRemote 
			gitRemote: gitRemote 
			progress: pushProgress.
		"Push tags"
		self 
			pushTagsToRemote: aRemote
			gitRemote: gitRemote
			progress: pushProgress.
			
		"Verify we have an stream"
		self setUpstreamIfMissing: aRemote ] 
	on: LGit_GIT_ENONFASTFORWARD 
	do: [ :e | 
		e resignalAs: (IceRemoteDesynchronized new
			remote: aRemote;
			yourself) ]