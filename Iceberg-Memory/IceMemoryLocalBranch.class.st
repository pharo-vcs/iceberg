Class {
	#name : 'IceMemoryLocalBranch',
	#superclass : 'IceLocalBranch',
	#instVars : [
		'commit',
		'upstream'
	],
	#category : 'Iceberg-Memory',
	#package : 'Iceberg-Memory'
}

{ #category : 'accessing' }
IceMemoryLocalBranch >> commit [

	^ commit
]

{ #category : 'accessing' }
IceMemoryLocalBranch >> commit: aCommit [

	commit := aCommit
]

{ #category : 'API-remotes' }
IceMemoryLocalBranch >> hasUpstream [
	
	^ upstream notNil
]

{ #category : 'merging' }
IceMemoryLocalBranch >> mergeWithBranch: anIceMemoryRemoteBranch [ 
	
	"Ensure that all commits of the remote branch are in the local branch mc repository"
	anIceMemoryRemoteBranch commits do: [ :each |
		repository branchRepository
			versionWithInfo: each mcCommit info
			ifAbsent: [ repository branchRepository storeVersion: each mcCommit ] ].
		
	commit := self commit mergeWith: anIceMemoryRemoteBranch commit
]

{ #category : 'API-remotes' }
IceMemoryLocalBranch >> setUpstream: anIceMemoryRemoteBranch [ 
	
	upstream := anIceMemoryRemoteBranch
]

{ #category : 'accessing' }
IceMemoryLocalBranch >> trackedBranch [
	
	^ repository remoteTrackedBranches detect: [ :each | each name = name ]
]

{ #category : 'tracking' }
IceMemoryLocalBranch >> tracksRemoteBranch [
	
	^ repository remoteTrackedBranches anySatisfy: [ :branch | branch name = self name ]
]

{ #category : 'API-remotes' }
IceMemoryLocalBranch >> upstream [

	^ upstream ifNil: [ IceUpstreamNotConfigured signal ]
]
