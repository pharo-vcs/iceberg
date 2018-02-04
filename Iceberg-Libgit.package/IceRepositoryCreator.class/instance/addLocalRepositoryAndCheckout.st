private actions
addLocalRepositoryAndCheckout
	| repository |
	repository := self addLocalRepository.
	repository fetchFrom: (repository remotes 
		detect:[ :each | each referencesSameRemoteLocationAs: self remoteToUse ]).
	repository switchToBranchNamed: self branchName.
	^ repository