private-tracking
upstreamIfNone: aBlock
	repository handleLibgitError: [ | localBranch gitUpstream |
		localBranch := self repositoryHandle lookupLocalBranch: self name.
		gitUpstream := localBranch upstream.
		gitUpstream ifNil: [ ^ aBlock value ].
		^ IceGitRemoteBranch named: gitUpstream name inRepository: repository ]