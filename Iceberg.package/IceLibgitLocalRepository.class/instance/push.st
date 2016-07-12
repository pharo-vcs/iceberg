actions
push
	self withRepoDo: [ :repo |
		| gitRemote credentials credentialsCallback reference remoteBranchName |
		gitRemote := (LGitRemote of: repo named: 'origin') lookup.
		reference := repo head.	
		remoteBranchName := reference name. "TODO: https://github.com/npasserini/iceberg/issues/90"
		
		credentials := gitRemote class credentialsSsh.
		credentialsCallback := LGitCredAcquireCallback
			on: [ :cred :url :username_from_url :allowed_types :data | 
				credentials createWith: cred.
				0 ].

		gitRemote
			pushWithRefSpec: (LGitRefSpec new
				source: reference name;
				destination: remoteBranchName;
				yourself)
			pushOptions: (LGitPushOptions defaults
				callbacks: (LGitRemoteCallbacks defaults
					credentials: credentialsCallback;
					yourself);
				yourself).

		"Since the push created the branch in the remote, we can now add an upstream to this branch."
		reference upstream ifNil: [ 
			reference setUpstream: 'origin/', reference basename ]
	]
