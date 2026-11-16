"
I check where a Metacello repository description says its project lives, without cloning it
"
Class {
	#name : 'IceMetacelloRepositoryTypeTest',
	#superclass : 'TestCase',
	#category : 'Iceberg-Tests-Metacello',
	#package : 'Iceberg-Tests',
	#tag : 'Metacello'
}

{ #category : 'tests' }
IceMetacelloRepositoryTypeTest >> testAHostedRepositoryLivesAtItsOwnerAndName [

	self assert: (IceMetacelloRepositoryType for: 'gitlab://owner/name:v1.2.0/src') projectUrl equals: 'gitlab://owner/name'
]

{ #category : 'tests' }
IceMetacelloRepositoryTypeTest >> testALocalCloneIsNamedByItsWholeDescription [

	self assert: (IceMetacelloRepositoryType for: 'gitlocal:///tmp/name/src') projectUrl equals: 'gitlocal:///tmp/name/src'
]
