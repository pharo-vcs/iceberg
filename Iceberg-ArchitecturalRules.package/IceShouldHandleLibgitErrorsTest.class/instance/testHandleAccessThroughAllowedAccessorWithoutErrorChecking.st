tests
testHandleAccessThroughAllowedAccessorWithoutErrorChecking

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testMethodAccessHandleThroughAccessor).

	self assert: critiques notEmpty.