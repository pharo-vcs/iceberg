utilities
pushRepository: repository andThen: aBlock
	UIManager default informUserDuring: [ :bar | | remote |
		remote := repository pushRemote.
		bar label: ('Publishing local commits to {1}' format: {remote}).
		[ repository pushTo: remote ]
		on: IceRemoteDesynchronized, IceMergeAborted
		do: [ :e | e acceptError: (IceInteractiveErrorVisitor repository: repository) ]. 
		aBlock value ]