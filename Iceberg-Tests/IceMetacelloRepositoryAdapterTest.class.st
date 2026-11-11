"
I test how the Metacello adapter of a git repository reads a baseline at a ref, without checking anything out: the repository has one commit with BaselineOfFoo, tagged v1.0.0, on branch master.
"
Class {
	#name : 'IceMetacelloRepositoryAdapterTest',
	#superclass : 'TestCase',
	#instVars : [
		'fixture',
		'adapter'
	],
	#category : 'Iceberg-Tests-Metacello',
	#package : 'Iceberg-Tests',
	#tag : 'Metacello'
}

{ #category : 'running' }
IceMetacelloRepositoryAdapterTest >> setUp [

	super setUp.
	fixture := IceSinglePackageFixture inGit.
	fixture packageName1: 'BaselineOfFoo'.
	fixture setUp.
	fixture repository createTag: 'v1.0.0'.
	adapter := IceMetacelloRepositoryAdapter for: fixture repository withVersion: 'v1.0.0'
]

{ #category : 'running' }
IceMetacelloRepositoryAdapterTest >> tearDown [

	fixture tearDown.
	super tearDown
]

{ #category : 'tests' }
IceMetacelloRepositoryAdapterTest >> testARefThatNamesNothingIsNotFound [

	self should: [ adapter baselineOf: 'Foo' atVersion: 'nothing' ] raise: NotFound
]

{ #category : 'tests' }
IceMetacelloRepositoryAdapterTest >> testAnswersNilForABaselineTheCommitDoesNotHave [

	self assert: (adapter baselineOf: 'Bar' atVersion: 'v1.0.0') isNil
]

{ #category : 'tests' }
IceMetacelloRepositoryAdapterTest >> testReadsABaselineAtABranch [

	self assert: (adapter baselineOf: 'Foo' atVersion: fixture repository branchName) notNil
]

{ #category : 'tests' }
IceMetacelloRepositoryAdapterTest >> testReadsABaselineAtABranchOnlyTheRemoteHas [
	"A clone made for Metacello has a local branch for its default one only: another branch is the remote's"

	| remoteFixture local remote |
	remoteFixture := IceWithRemoteFixture inGit.
	remoteFixture packageName1: 'BaselineOfFoo'.
	remoteFixture setUp.
	[
		local := remoteFixture repository.
		remote := remoteFixture remoteRepository.
		remote createBranch: 'dev' inCommit: remote headCommit.
		local fetch.
		self deny: (local localBranches anySatisfy: [ :each | each name = 'dev' ]).
		self assert: ((IceMetacelloRepositoryAdapter for: local withVersion: 'dev') baselineOf: 'Foo' atVersion: 'dev') notNil ]
		ensure: [ remoteFixture tearDown ]
]

{ #category : 'tests' }
IceMetacelloRepositoryAdapterTest >> testReadsABaselineAtACommit [

	| id |
	id := fixture repository headCommit id.
	self assert: (adapter baselineOf: 'Foo' atVersion: id) notNil.
	self assert: (adapter baselineOf: 'Foo' atVersion: (id first: 7)) notNil
]

{ #category : 'tests' }
IceMetacelloRepositoryAdapterTest >> testReadsABaselineAtATag [

	self assert: (adapter baselineOf: 'Foo' atVersion: 'v1.0.0') notNil
]
