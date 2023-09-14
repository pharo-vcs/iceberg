Class {
	#name : 'IceTipUnknownCommitRepositoryTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-UI-Tests',
	#package : 'Iceberg-UI-Tests'
}

{ #category : 'running' }
IceTipUnknownCommitRepositoryTest >> newFixture [

	^ IceWithRemoteAndUnknownCommitFixture inGit
]

{ #category : 'running' }
IceTipUnknownCommitRepositoryTest >> testRepositoryStatusIsUnknown [

	| model status |
	model := IceTipRepositoryModel on: self repository.
	status := model status.
	
	self assert: (status beginsWith: 'Fetch required. Unknown ').
	self assert: (status endsWith: self repository workingCopy referenceCommit shortId).
]
