"
I'm a model to provide access to all repositories registered.
"
Class {
	#name : #IceTipRepositoriesModel,
	#superclass : #IceTipModel,
	#instVars : [
		'repositoryProvider'
	],
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #accessing }
IceTipRepositoriesModel >> repositories [
	
	^ repositoryProvider repositories collect: [ :each | (IceTipRepositoryModel on: each) beCached ]
]

{ #category : #accessing }
IceTipRepositoriesModel >> repositoryProvider: aProvider [

	repositoryProvider := aProvider
]
