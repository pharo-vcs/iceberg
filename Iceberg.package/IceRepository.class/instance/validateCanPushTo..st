validating
validateCanPushTo: aRemote
	| commits |
	
	"I need to perform a fetch to have access to latest commits, because there is no 
	 other way to know if local repository is behind remote repository."
	aRemote fetch.
	"Now I can check if we are in sync"
	commits := self branch incomingCommitsFrom: aRemote.
	commits ifEmpty: [ ^ self ].

	IceRemoteDesynchronized new 
		asResumable;
		remote: aRemote;
		signal