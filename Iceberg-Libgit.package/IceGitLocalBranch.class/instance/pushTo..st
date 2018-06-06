API-remotes
pushTo: aRemote
	
	repository handleLibgitError: [ | gitRemote |
		gitRemote := (LGitRemote of: self repositoryHandle named: aRemote name) lookup.
		[ gitRemote
			pushWithRefSpec:
				(LGitRefSpec new
					source: self fullname;
					destination: self fullname;
					yourself)
			pushOptions:
				(LGitPushOptions defaults
					callbacks: (LGitRemoteCallbacks withProvider: (IceCredentialsProvider defaultForRemote: aRemote));
					yourself) ]
			on: LGit_GIT_ENONFASTFORWARD
			do: [ :e | 
				e
					resignalAs:
						(IceRemoteDesynchronized new
							remote: aRemote;
							yourself) ] ]