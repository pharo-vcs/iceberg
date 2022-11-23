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
IceTipRepositoriesModel >> repositoryGroups [
	| sortGroup groups |

	groups := self repositories 
		collect: [ :each | 
			each entity project tags 
				ifNotEmpty: [ :tags | tags first asString ]
				ifEmpty: [ '' ] ]
		as: Set.
	
	sortGroup := Dictionary newFromPairs: { ''. 0. 'system'. 100 }.
	groups := groups sorted: 
		[ :each | sortGroup at: each ifAbsent: [ 1 ] ] ascending, 
		[ :each | each yourself ] ascending.
	^ groups collect: [ :each | 
		IceTipRepositoryGroupModel new
			repositoryProvider: repositoryProvider;
			group: each ]
]

{ #category : #accessing }
IceTipRepositoriesModel >> repositoryProvider: aProvider [

	repositoryProvider := aProvider
]
