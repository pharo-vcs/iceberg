tests
testNonDefinedRepositoryAccessorBreaksRule

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testNonDefinedRepositoryAccessor).
	
	self assert: critiques notEmpty.