tests
testDirectHandleAccessWithErrorChecking

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testMethodAccessHandleDirectlyWithErrorHandler).
	
	self assert: critiques isEmpty.