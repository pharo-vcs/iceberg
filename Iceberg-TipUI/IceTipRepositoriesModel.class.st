"
I'm a model to provide access to all repositories registered.
"
Class {
	#name : 'IceTipRepositoriesModel',
	#superclass : 'IceTipModel',
	#instVars : [
		'repositoryProvider'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipRepositoriesModel >> repositories [

	^ repositoryProvider repositories collect: [ :each |
		  IceTipRepositoryModel on: each ]
]

{ #category : 'accessing' }
IceTipRepositoriesModel >> repositoryGroups [
	| sortGroup groups |

	groups := self repositories
		collect: [ :each |
			each entity project tags
				ifNotEmpty: [ :tags | tags first asString ]
				ifEmpty: [ '' ] ]
		as: Set.

	"sort groups:
	 	1. 'general' group (all projects without a group tag).
		2. user defined groups sorted alphabetically
		3. last (always last) system group"
	sortGroup := Dictionary newFromPairs: { ''. 0. 'system'. 100 }.
	groups := groups sorted:
		[ :each | sortGroup at: each ifAbsent: [ 1 ] ] ascending,
		[ :each | each yourself ] ascending.

	"add default group first if it is not there yet."
	(groups isEmpty or: [ groups first = ''])
		ifFalse: [ groups := groups copyWithFirst: '' ].

	^ groups collect: [ :each |
		IceTipRepositoryGroupModel new
			repositoryProvider: repositoryProvider;
			group: each ]
]

{ #category : 'accessing' }
IceTipRepositoriesModel >> repositoryProvider: aProvider [

	repositoryProvider := aProvider
]
