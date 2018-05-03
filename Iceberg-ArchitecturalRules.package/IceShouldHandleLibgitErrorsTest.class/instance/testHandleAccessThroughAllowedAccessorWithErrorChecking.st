tests
testHandleAccessThroughAllowedAccessorWithErrorChecking

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testMethodAccessHandleThroughAccessorWithErrorHandler).

	self assert: critiques isEmpty.