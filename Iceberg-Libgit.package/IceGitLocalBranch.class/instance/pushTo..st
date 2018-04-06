API-remotes
pushTo: aRemote 
	
	repository withRepoDo: [ :repo |
		| gitRemote remoteBranchName |
		
		gitRemote := (LGitRemote of: repo named: aRemote name) lookup.
		
		[ gitRemote
			pushWithRefSpec: (LGitRefSpec new
				source: self fullname;
				destination: self fullname;
				yourself)
			pushOptions: (LGitPushOptions defaults
				callbacks: (LGitRemoteCallbacks withProvider: IceCredentialsProvider default);
				yourself) ]
		on: LGit_GIT_ENONFASTFORWARD do: [ :e |
			e resignalAs: (IceRemoteDesynchronized new 
				remote: aRemote;
				yourself)] ]