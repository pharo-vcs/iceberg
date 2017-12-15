tests-commit
testDetachedHeadCannotCommit

	repository branch commit checkout.
	self assert: repository isDetached.
	self deny: repository canCommit.