accessing
mcRepositoryClass
	^ MCGitBasedNetworkRepository allSubclasses detect: [ :e | e basicDescription = self class type ].