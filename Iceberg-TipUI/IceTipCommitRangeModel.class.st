Class {
	#name : 'IceTipCommitRangeModel',
	#superclass : 'IceTipCommitishModel',
	#instVars : [
		'toCommit'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipCommitRangeModel >> commitModels [

	^ (self fromCommit newCommitWalk uptoCommit: self toCommit) commits
		  collect: [ :each |
			  IceTipCommitModel repositoryModel: self repositoryModel on: each ]
]

{ #category : 'accessing' }
IceTipCommitRangeModel >> fromCommit [
	^ self entity
]

{ #category : 'accessing' }
IceTipCommitRangeModel >> name [
	^ 'Commits from {1} to {2}' format: { 
		self fromCommit shortId. 
		self toCommit shortId }
]

{ #category : 'accessing' }
IceTipCommitRangeModel >> toCommit [
	^ toCommit
]

{ #category : 'accessing' }
IceTipCommitRangeModel >> toCommit: anObject [
	toCommit := anObject
]
