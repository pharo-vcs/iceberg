Class {
	#name : 'IceTipRemoteActionModel',
	#superclass : 'IceTipCommitishModel',
	#instVars : [
		'remote'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipRemoteActionModel >> branchName [
	^ entity branchName
]

{ #category : 'testing' }
IceTipRemoteActionModel >> isRepositoryDetached [
	^ self entity workingCopy isDetached 
		or: [ self entity head isDetached ]
]

{ #category : 'accessing' }
IceTipRemoteActionModel >> remote [
	^ remote ifNil: [ | head |
		head := self repositoryModel entity head.
		remote := (head isBranch and: [ head hasUpstream ])
				ifTrue: [ head upstream remote ]
				ifFalse: [ self remoteModels first entity ] ]
]

{ #category : 'accessing' }
IceTipRemoteActionModel >> remoteModel [
	^ repositoryModel remoteModels detect: [ :e | e entity = self remote ]
]

{ #category : 'accessing' }
IceTipRemoteActionModel >> remoteModels [
	^ self repositoryModel remoteModels
]

{ #category : 'accessing' }
IceTipRemoteActionModel >> remoteName [
	^ self remote name, '/', self entity branch name
]

{ #category : 'accessing' }
IceTipRemoteActionModel >> repositoryName [
	^ self repositoryModel name
]

{ #category : 'accessing' }
IceTipRemoteActionModel >> useRemote: aRemoteModel [
	remote := aRemoteModel entity.
]
