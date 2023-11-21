Class {
	#name : 'IceShouldHandleLibgitErrorsTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-ArchitecturalRules',
	#package : 'Iceberg-ArchitecturalRules'
}

{ #category : 'rules' }
IceShouldHandleLibgitErrorsTest class >> libgitRepositoryHandleAccessors [
	self shouldBeImplemented.
]

{ #category : 'tests' }
IceShouldHandleLibgitErrorsTest >> check: aRule on: aMethod [

	| lintRule |
	lintRule := aRule asRBRule.
	lintRule checkMethod: aMethod.
	^ lintRule result smallLintCritics
]

{ #category : 'tests' }
IceShouldHandleLibgitErrorsTest >> testDefinedRepositoryAccessorDoesNotBreakRule [

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testDefinedRepositoryAccessor).
	
	self assert: critiques isEmpty.
]

{ #category : 'tests' }
IceShouldHandleLibgitErrorsTest >> testDirectHandleAccessWithErrorChecking [

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testMethodAccessHandleDirectlyWithErrorHandler).
	
	self assert: critiques isEmpty.
]

{ #category : 'tests' }
IceShouldHandleLibgitErrorsTest >> testDirectHandleAccessWithoutErrorChecking [

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testMethodAccessHandleDirectly).
	
	self assert: critiques notEmpty.
]

{ #category : 'tests' }
IceShouldHandleLibgitErrorsTest >> testHandleAccessThroughAllowedAccessorWithErrorChecking [

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testMethodAccessHandleThroughAccessorWithErrorHandler).

	self assert: critiques isEmpty.
]

{ #category : 'tests' }
IceShouldHandleLibgitErrorsTest >> testHandleAccessThroughAllowedAccessorWithoutErrorChecking [

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testMethodAccessHandleThroughAccessor).

	self assert: critiques notEmpty.
]

{ #category : 'tests' }
IceShouldHandleLibgitErrorsTest >> testMethodNotBreakingRuleYieldsNoCritiques [

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testMethodNotBreakingRule).

	self assert: critiques isEmpty.
]

{ #category : 'tests' }
IceShouldHandleLibgitErrorsTest >> testNonDefinedRepositoryAccessorBreaksRule [

	| critiques |
	critiques := self check: IceShouldHandleLibgitErrors on: (IceLibgitRuleBreakerRepository >> #testNonDefinedRepositoryAccessor).
	
	self assert: critiques notEmpty.
]
