Class {
	#name : 'IceNewRepositoryTest',
	#superclass : 'IceBornRepositoryTest',
	#category : 'Iceberg-Tests-Common',
	#package : 'Iceberg-Tests',
	#tag : 'Common'
}

{ #category : 'running' }
IceNewRepositoryTest class >> isAbstract [

	^ self == IceNewRepositoryTest
]

{ #category : 'tests' }
IceNewRepositoryTest >> testNewRepositoryBranchIsNamedMaster [

	self assert: self repository branch name equals: 'master'
]

{ #category : 'tests' }
IceNewRepositoryTest >> testNewRepositoryHasNoTags [

	self assert: self repository tags isEmpty
]

{ #category : 'tests' }
IceNewRepositoryTest >> testNewRepositoryPushDoesNothing [

	self shouldnt: [ self repository push ] raise: Error
]

{ #category : 'tests' }
IceNewRepositoryTest >> testNewRepositoryPushToExplicitRemoteDoesNothing [

	self shouldnt: [ self repository pushTo: (IceGitRemote url: 'git@github.com:pharo-vcs/testing.git') ] raise: Error
]
