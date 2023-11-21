Class {
	#name : 'IceCleanWorkingCopyTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Common',
	#package : 'Iceberg-Tests',
	#tag : 'Common'
}

{ #category : 'testing' }
IceCleanWorkingCopyTest class >> isAbstract [

	^ self == IceCleanWorkingCopyTest
]

{ #category : 'helpers' }
IceCleanWorkingCopyTest >> commit1 [

	^ self currentCommitOfPackage: self packageName1
]

{ #category : 'helpers' }
IceCleanWorkingCopyTest >> commit2 [

	^ self currentCommitOfPackage: self packageName2
]

{ #category : 'helpers' }
IceCleanWorkingCopyTest >> currentCommitOfPackage: aPackageName [

	^ (self repository workingCopy packageNamed: aPackageName) currentCommit
]

{ #category : 'tests' }
IceCleanWorkingCopyTest >> testWorkingCopyHasSingleCommit [
 
	self repository workingCopy initializePackagesFromRepository.
	self assert: self repository workingCopy hasSingleCommit
]

{ #category : 'tests' }
IceCleanWorkingCopyTest >> testWorkingCopyIsInSingleCommitStateWhenNewPackageIsCreated [
 	
	self repository workingCopy initializePackagesFromRepository.
	self repository workingCopy addPackageNamed: 'NewPackage'.
	
	self
		assert: self repository workingCopy workingCopyState singleCommit
		equals: (self repository packageNamed: self packageName1) currentCommit.
		
	self shouldnt: [self repository workingCopy validateCanCommit] raise: IceWorkingCopyDesyncronized 
]

{ #category : 'tests' }
IceCleanWorkingCopyTest >> testWorkingCopyIsInSingleCommitStateWhenPackageIsNotLoaded [
 	
	(self repository packageNamed: self packageName1) unload.
	
	self
		assert: self repository workingCopy workingCopyState singleCommit
		equals: (self repository packageNamed: self packageName2) currentCommit.
	
	self deny: (self repository packageNamed: self packageName1) isLoaded.
	self
		assert: self repository workingCopy workingCopyState singleCommit
		equals: (self repository packageNamed: self packageName1) currentCommit.
		
	self shouldnt: [self repository workingCopy validateCanCommit] raise: IceWorkingCopyDesyncronized 
]

{ #category : 'tests' }
IceCleanWorkingCopyTest >> testWorkingCopyIsNotUnknownCommot [
 	
	self repository workingCopy initializePackagesFromRepository.
	self deny: self repository workingCopy hasUnknownCommit
]

{ #category : 'tests' }
IceCleanWorkingCopyTest >> testWorkingCopySingleCommitIsPackage1Commit [
 	
	self repository workingCopy initializePackagesFromRepository.
	self
		assert: self repository workingCopy workingCopyState singleCommit
		equals: (self repository packageNamed: self packageName1) currentCommit
]

{ #category : 'tests' }
IceCleanWorkingCopyTest >> testWorkingCopySingleCommitIsPackage2Commit [
 	
	self repository workingCopy initializePackagesFromRepository.
	self
		assert: self repository workingCopy workingCopyState singleCommit
		equals: (self repository packageNamed: self packageName2) currentCommit
]

{ #category : 'tests' }
IceCleanWorkingCopyTest >> testWorkingStateIncludesPackage1CurrentCommit [
 	
	self repository workingCopy initializePackagesFromRepository.
	self assert: (self repository workingCopy workingCopyState includesCommit: self commit1).
]

{ #category : 'tests' }
IceCleanWorkingCopyTest >> testWorkingStateIncludesPackage2CurrentCommit [
 	
	self repository workingCopy initializePackagesFromRepository.
	self assert: (self repository workingCopy workingCopyState includesCommit: self commit2).
]
