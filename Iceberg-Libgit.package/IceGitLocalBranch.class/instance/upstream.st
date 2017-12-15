private-tracking
upstream
	
	repository withRepoDo: [ :repo | | localBranch upstreamGitBranch |
		localBranch := repo lookupLocalBranch: self name.		
		^ upstreamGitBranch := localBranch upstream ifNil: [ | remoteGitBranch remoteName |
			remoteName := '/origin/', self name.
			[repo lookupRemoteBranch: remoteName]
				on: LGit_GIT_ENOTFOUND do: [ 
					"If we have no upstream, we return nil"
					nil ] ] ]