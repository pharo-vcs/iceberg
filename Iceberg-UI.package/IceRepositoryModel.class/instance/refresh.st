actions
refresh
	super refresh.
	outgoingCommitsPerRemote removeAll.
	incomingCommitsPerRemote removeAll.
	
"	self repository refresh
"