validating
validateCanCommit
	"Verify sync between image version and working copy"	
	"If there are incomming commits is out of sync"
	
	"Check that head is not detached"
	self repository validateCanCommit.
	
	"Check that our current state lets us commit"
	self workingCopyState validateCanCommit