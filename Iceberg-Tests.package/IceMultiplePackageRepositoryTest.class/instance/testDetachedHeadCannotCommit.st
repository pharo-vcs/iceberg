tests-commit
testDetachedHeadCannotCommit

	repository branch commit checkout.
	self assert: repository head isDetached.
	self should: [repository validateCanCommit] raise: IceWorkingCopyDesyncronized.