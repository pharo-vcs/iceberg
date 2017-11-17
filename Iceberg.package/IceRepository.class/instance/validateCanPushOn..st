validating
validateCanPushOn: aRemote
	| commits |
	
	self flag: #todo. "I need to perform a fetch to have access to latest commits, but this can 
	be done better by emulating the 'git status' command (to know if we are x commit behind)."
	self fetchFrom: aRemote.
	commits := self branch incomingCommitsFrom: aRemote.
	commits ifEmpty: [ ^ self ].

	IceRemoteDesynchronized new 
		asResumable;
		remote: aRemote;
		signal