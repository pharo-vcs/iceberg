tests
testMethodNotBreakingRuleYieldsNoCritiques

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testMethodNotBreakingRule).

	self assert: critiques isEmpty.