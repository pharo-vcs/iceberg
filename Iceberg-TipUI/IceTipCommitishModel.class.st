"
I'm a base model for all commitish models to be used.
I can provide #commitModels which changes depending on concrete model.
"
Class {
	#name : 'IceTipCommitishModel',
	#superclass : 'IceTipEntityModel',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipCommitishModel >> commitId [
	
	^ self entity commit id
]

{ #category : 'accessing' }
IceTipCommitishModel >> commitModels [
	self subclassResponsibility
]

{ #category : 'testing' }
IceTipCommitishModel >> isBranch [

	^ self entity isBranch
]

{ #category : 'testing' }
IceTipCommitishModel >> isCommitish [

	^ true
]

{ #category : 'accessing' }
IceTipCommitishModel >> shortCommitId [
	
	^ self entity shortId
]

{ #category : 'accessing' }
IceTipCommitishModel >> tagModels [
	
	^ self repositoryModel tagModels
]
