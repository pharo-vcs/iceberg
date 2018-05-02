tests
testDefinedRepositoryAccessorDoesNotBreakRule

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testDefinedRepositoryAccessor).
	
	self assert: critiques isEmpty.