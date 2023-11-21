Class {
	#name : 'IceLibgitRuleBreakerRepository',
	#superclass : 'IceLibgitRepository',
	#category : 'Iceberg-ArchitecturalRules',
	#package : 'Iceberg-ArchitecturalRules'
}

{ #category : 'tests' }
IceLibgitRuleBreakerRepository >> testDefinedRepositoryAccessor [

	<repositoryHandleAccessor>
	^ handle
]

{ #category : 'tests' }
IceLibgitRuleBreakerRepository >> testMethodAccessHandleDirectly [

	^ handle allBranches
]

{ #category : 'tests' }
IceLibgitRuleBreakerRepository >> testMethodAccessHandleDirectlyWithErrorHandler [

	self handleLibgitError: [handle allBranches]
]

{ #category : 'tests' }
IceLibgitRuleBreakerRepository >> testMethodAccessHandleThroughAccessor [

	^ self testDefinedRepositoryAccessor allBranches
]

{ #category : 'tests' }
IceLibgitRuleBreakerRepository >> testMethodAccessHandleThroughAccessorWithErrorHandler [

	self handleLibgitError: [ self testDefinedRepositoryAccessor allBranches]
]

{ #category : 'tests' }
IceLibgitRuleBreakerRepository >> testMethodNotBreakingRule [

	^ 1+1
]

{ #category : 'tests' }
IceLibgitRuleBreakerRepository >> testNonDefinedRepositoryAccessor [

	^ handle
]
