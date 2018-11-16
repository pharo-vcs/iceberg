private-pushing
pushBranchToRemote: aRemote gitRemote: gitRemote progress: pushProgress
	
	gitRemote 
		pushWithRefSpec: (LGitRefSpec new
			source: self fullname;
			destination: self fullname;
			yourself)
		pushOptions: (LGitPushOptions defaults
			callbacks: ((LGitRemoteCallbacks withProvider: (IceCredentialsProvider defaultForRemote: aRemote)) 
				pushTransferProgress: pushProgress; 
				yourself);
			yourself)