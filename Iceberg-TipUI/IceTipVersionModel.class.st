"
I'm a model for IceLogVersion entries. 

- I provide log-specific entries.
- I can install a certain method version.
"
Class {
	#name : 'IceTipVersionModel',
	#superclass : 'IceTipCommitModel',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipVersionModel >> commit [
	^ self entity commit
]

{ #category : 'actions' }
IceTipVersionModel >> newInstallAction [

	^ IceTipStandardAction new
		  repository: self repositoryModel entity;
		  message: ('Installing {1} - {2}' format: {
						   self entity definition.
						   self name });
		  onSuccessRepositoryModified;
		  action: [ self entity install ];
		  yourself
]

{ #category : 'accessing' }
IceTipVersionModel >> source [
	^ self entity source
]
