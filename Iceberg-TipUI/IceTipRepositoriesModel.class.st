"
I'm a model to provide access to all repositories registered.
"
Class {
	#name : #IceTipRepositoriesModel,
	#superclass : #IceTipModel,
	#instVars : [
		'repositories'
	],
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #accessing }
IceTipRepositoriesModel >> repositories [
	^ repositories
]

{ #category : #accessing }
IceTipRepositoriesModel >> repositories: aCollection [

	repositories := aCollection collect: [ :each | (IceTipRepositoryModel on: each) beCached ]
]
