private-impacting-changes
removeClassNamed: aString 
	
	"Impact the system.
	This should be enhanced"
	(Smalltalk globals at: aString ifAbsent: [ ^ self ]) removeFromSystem