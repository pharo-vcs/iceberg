"
A model for a repository group. 
Repository groups are taken from tags added to the repository metadata (usually in .project file).
NOTICE: first tag will be taken as the group.
"
Class {
	#name : 'IceTipRepositoryGroupModel',
	#superclass : 'IceTipModel',
	#instVars : [
		'repositoryProvider',
		'repositories',
		'group'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipRepositoryGroupModel class >> defaultLabel [

	^ 'Projects'
]

{ #category : 'private - testing' }
IceTipRepositoryGroupModel >> containsRepository: aRepository [
	
	(self group isEmpty and: [ aRepository project tags isEmpty ])
		ifTrue: [ ^ true ].

	^ aRepository project tags includes: self group
]

{ #category : 'accessing' }
IceTipRepositoryGroupModel >> group [

	^ group
]

{ #category : 'accessing' }
IceTipRepositoryGroupModel >> group: aGroup [

	group := aGroup
]

{ #category : 'accessing' }
IceTipRepositoryGroupModel >> label [
	
	^ self group 
		ifNotEmpty: [ self group capitalized ]
		ifEmpty: [ self class defaultLabel ]
]

{ #category : 'accessing' }
IceTipRepositoryGroupModel >> repositories [

	^ repositories := repositoryProvider repositories
		                  select: [ :each | self containsRepository: each ]
		                  thenCollect: [ :each |
		                  IceTipRepositoryModel on: each ]
]

{ #category : 'accessing' }
IceTipRepositoryGroupModel >> repositoryProvider: aProvider [

	repositoryProvider := aProvider
]
