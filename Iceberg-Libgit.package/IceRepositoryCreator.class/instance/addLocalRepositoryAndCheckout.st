private actions
addLocalRepositoryAndCheckout
	| localRepository |
	localRepository := self addLocalRepository.
	localRepository remotes 
		detect:[ :each | each referencesSameRemoteLocationAs: self remoteToUse ]
		ifFound: [ :found | localRepository fetchFrom: found ].
	localRepository switchToCommitishNamed: self commitishName.
	^ localRepository