"
I'm a model for IceRemote entries.
"
Class {
	#name : 'IceTipRemoteModel',
	#superclass : 'IceTipEntityModel',
	#traits : 'TWithBranchModel',
	#classTraits : 'TWithBranchModel classTrait',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'comparing' }
IceTipRemoteModel >> = anotherModel [

	self species = anotherModel species ifFalse: [ ^ false ].
	
	^ entity = anotherModel entity
]

{ #category : 'accessing' }
IceTipRemoteModel >> branches [
	^ self entity branches
]

{ #category : 'accessing' }
IceTipRemoteModel >> description [

	^ '{1} <{2}>' format: { self name. self entity url }
]

{ #category : 'actions' }
IceTipRemoteModel >> newDeleteAction [
	
	^ IceTipStandardAction new
		repository: self repositoryModel entity;
		message: ('Removing remote {1}' format: { self name });
		onSuccessRepositoryModified;
		action: [ self repositoryModel entity removeRemote: self entity ];
		yourself
]

{ #category : 'actions' }
IceTipRemoteModel >> newFetchAction [
	
	^ IceTipStandardAction new
		repository: self repositoryModel entity;
		message: ('Fetching remote {1}' format: { self name });
		onSuccessRepositoryModified;
		action: [ self entity fetch ];
		yourself
]
