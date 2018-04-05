private-tracking
upstreamIfNone: aBlock
	
	repository withRepoDo: [ :repo | | localBranch gitUpstream |
		localBranch := repo lookupLocalBranch: self name.
		gitUpstream := localBranch upstream.
		gitUpstream ifNil: [ ^ aBlock value ].
		^ IceGitRemoteBranch named: gitUpstream name inRepository: repository ]