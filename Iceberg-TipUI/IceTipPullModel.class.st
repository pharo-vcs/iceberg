"
I'm a model to present pull commits and operations.
"
Class {
	#name : 'IceTipPullModel',
	#superclass : 'IceTipRemoteActionModel',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipPullModel >> commitModels [

	^ (self entity branch incomingCommitsFrom: self remote) collect: [
		  :each |
		  IceTipCommitModel repositoryModel: self repositoryModel on: each ]
]

{ #category : 'actions' }
IceTipPullModel >> newPullAction [

	^ IceTipStandardAction new 
		repository: self entity;
		message: ('Pulling from {1}' format: { self remote name });
		onSuccessRepositoryModified;
		action: [ self entity pullFrom: self remote ];
		yourself
]
