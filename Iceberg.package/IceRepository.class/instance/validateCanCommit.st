validating
validateCanCommit
	"Verify sync between image version and working copy"
	(self loadedCode referenceCommit = self headCommit)
		ifFalse: [ IceWorkingCopyDesyncronized signal ]