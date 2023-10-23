Class {
	#name : 'IceLocalRepositoryMissingTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Git',
	#package : 'Iceberg-Tests',
	#tag : 'Git'
}

{ #category : 'running' }
IceLocalRepositoryMissingTest >> newFixture [

	^ IceMissingLocalRepositoryFixture inGit
]

{ #category : 'running' }
IceLocalRepositoryMissingTest >> testDeleteDoesNothing [

	self shouldnt: [ self repository delete ] raise: Error
]

{ #category : 'running' }
IceLocalRepositoryMissingTest >> testRepositoryIsMissing [

	self assert: self repository isMissing
]
