private validating
validateCanCommit
	"Verify sync between image version and working copy"
	(self loadedCode referenceCommit = self branch lastCommit)
		ifFalse: [ IceWorkingCopyDesyncronized signal ]