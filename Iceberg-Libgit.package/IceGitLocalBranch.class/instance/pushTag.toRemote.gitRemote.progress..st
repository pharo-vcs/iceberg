private-pushing
pushTag: tag toRemote: aRemote gitRemote: gitRemote progress: pushProgress

	gitRemote 
		pushWithRefSpec: (LGitRefSpec new
			source: 'refs/tags/' , tag name;
			destination: 'refs/tags/' , tag name;
			yourself)
		pushOptions: (LGitPushOptions defaults
			callbacks: ((LGitRemoteCallbacks withProvider: (IceCredentialsProvider defaultForRemote: aRemote))
				pushTransferProgress: pushProgress;
				yourself);
			yourself)