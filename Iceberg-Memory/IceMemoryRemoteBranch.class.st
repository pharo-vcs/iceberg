Class {
	#name : 'IceMemoryRemoteBranch',
	#superclass : 'IceRemoteBranch',
	#instVars : [
		'remote',
		'commit'
	],
	#category : 'Iceberg-Memory',
	#package : 'Iceberg-Memory'
}

{ #category : 'accessing' }
IceMemoryRemoteBranch >> commit [
	^ commit
]

{ #category : 'accessing' }
IceMemoryRemoteBranch >> commit: anIceMemoryCommit [ 
	commit := anIceMemoryCommit
]

{ #category : 'accessing' }
IceMemoryRemoteBranch >> remote: anIceMemoryRemote [ 
	
	remote := anIceMemoryRemote
]

{ #category : 'accessing' }
IceMemoryRemoteBranch >> remoteName [
	
	^ remote name
]

{ #category : 'accessing' }
IceMemoryRemoteBranch >> shortname [
	
	^ name
]
