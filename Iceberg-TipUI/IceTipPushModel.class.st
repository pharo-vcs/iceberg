"
I'm a model to present push commits and operations.
"
Class {
	#name : 'IceTipPushModel',
	#superclass : 'IceTipRemoteActionModel',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipPushModel >> commitModels [

	^ (self entity outgoingCommitsTo: self remote) collect: [ :each |
		  IceTipCommitModel repositoryModel: self repositoryModel on: each ]
]

{ #category : 'actions' }
IceTipPushModel >> newPushAction [

	^ IceTipStandardAction new 
		repository: self entity;
		message: ('Pushing to {1}' format: { self remote name }) ;
		onSuccessRepositoryModified;
		action: [ self entity pushTo: self remote ];
		yourself
]
