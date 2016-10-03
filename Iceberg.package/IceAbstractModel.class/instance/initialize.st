initialization
initialize
	incommingCommits := IceCachedValue for: [ self entity incommingCommits ].
	outgoingCommits := IceCachedValue for: [ self entity outgoingCommits ]