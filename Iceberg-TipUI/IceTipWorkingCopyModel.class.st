"
I'm a model to for IceWorkingCopy entries.
"
Class {
	#name : 'IceTipWorkingCopyModel',
	#superclass : 'IceTipModel',
	#instVars : [
		'sortingStrategy',
		'repositoryModel',
		'workingCopy'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'instance creation' }
IceTipWorkingCopyModel class >> on: aRepositoryModel [

	^ self on: aRepositoryModel workingCopy: aRepositoryModel workingCopy
]

{ #category : 'instance creation' }
IceTipWorkingCopyModel class >> on: aRepositoryModel workingCopy: aWorkingCopy [

	^ self new
		  repositoryModel: aRepositoryModel;
		  workingCopy: aWorkingCopy;
		  yourself
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> branchName [
	^ self repositoryModel branchName
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> commitId [
	^ repositoryModel commitId
]

{ #category : 'operations' }
IceTipWorkingCopyModel >> copyCommitIDToClipboard [
	
	repositoryModel copyCommitIDToClipboard
]

{ #category : 'API - changes' }
IceTipWorkingCopyModel >> diffToReferenceCommit [

	^ IceTipWorkingCopyDiffModel
		  repositoryModel: self repositoryModel
		  on: self workingCopy
]

{ #category : 'instance creation' }
IceTipWorkingCopyModel >> newCommitAction [

	^ IceTipCommitAction new
		workingCopy: self workingCopy;
		repository: self workingCopy repository;
		yourself
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> packageModels [

	^ self sortingStrategy sort:
		  (self workingCopy packages collect: [ :each |
			   IceTipPackageModel workingCopyModel: self on: each ])
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> repository [

	^ self repositoryModel entity
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> repositoryModel [
	^ repositoryModel
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> repositoryModel: anIceTipRepositoryModel [ 
	repositoryModel := anIceTipRepositoryModel
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> repositoryName [
	^ self repositoryModel name
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> reset [
	self repositoryModel reset
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> shortCommitId [
	^ repositoryModel shortCommitId
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> sortingStrategy [
	^ sortingStrategy ifNil: [ sortingStrategy := IceSortingStrategy new first: #modified ]
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> status [
	^ self repositoryModel status
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> statusDecorator [

	^ self repositoryModel statusDecorator
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> workingCopy [

	^ workingCopy
]

{ #category : 'accessing' }
IceTipWorkingCopyModel >> workingCopy: aWorkingCopy [

	workingCopy := aWorkingCopy
]
