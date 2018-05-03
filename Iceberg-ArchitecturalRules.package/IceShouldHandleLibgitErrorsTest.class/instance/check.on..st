tests
check: aRule on: aMethod

	| lintRule |
	lintRule := aRule asRBRule.
	lintRule checkMethod: aMethod.
	^ lintRule result smallLintCritics