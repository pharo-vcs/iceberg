tests
testDirectHandleAccessWithoutErrorChecking

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testMethodAccessHandleDirectly).
	
	self assert: critiques notEmpty.