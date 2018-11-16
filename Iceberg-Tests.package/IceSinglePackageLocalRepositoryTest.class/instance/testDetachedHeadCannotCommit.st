tests-commit
testDetachedHeadCannotCommit

	self repository branch commit checkout.
	self assert: self repository head isDetached.
	self should: [self repository validateCanCommit] raise: IceWorkingCopyDesyncronized.