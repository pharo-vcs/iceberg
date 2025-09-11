"
I'm a model to provide access to all repositories registered.
"
Class {
	#name : 'IceTipRepositoriesModel',
	#superclass : 'IceTipModel',
	#instVars : [
		'repositoryProvider'
	],
	#classInstVars : [
		'sortGroup'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'adding' }
IceTipRepositoriesModel class >> addTag: aTag priority: aPriority [

	sortGroup at: aTag put: aPriority
]

{ #category : 'class initialization' }
IceTipRepositoriesModel class >> initialize [

	sortGroup := Dictionary newFromPairs: { ''. 0. 'system'. 100 }
]

{ #category : 'accessing' }
IceTipRepositoriesModel class >> sortGroup [

	^ sortGroup 
]

{ #category : 'accessing' }
IceTipRepositoriesModel >> repositories [

	^ repositoryProvider repositories collect: [ :each |
		  IceTipRepositoryModel on: each ]
]

{ #category : 'accessing' }
IceTipRepositoriesModel >> repositoryGroups [

	| groups |
	groups := self repositories
		          collect: [ :each | each entity project tags ifNotEmpty: [ :tags | tags first asString ] ifEmpty: [ '' ] ]
		          as: Set. "sort groups:
		1. user defined groups with a defined priority (<0) sorted by priority
	 	2. 'general' group (all projects without a group tag).
		3. user defined groups without defined priority, sorted alphabetically
		4. last (always last) system group
		See class side"
	groups := groups sorted:
		          [ :each | self class sortGroup at: each ifAbsent: [ 1 ] ] ascending , [ :each | each yourself ] ascending. "add default group first if it is not there yet."
	(groups isEmpty or: [ groups first = '' ]) ifFalse: [ groups := groups copyWithFirst: '' ].

	^ groups collect: [ :each |
			  IceTipRepositoryGroupModel new
				  repositoryProvider: repositoryProvider;
				  group: each ]
]

{ #category : 'accessing' }
IceTipRepositoriesModel >> repositoryProvider: aProvider [

	repositoryProvider := aProvider
]
