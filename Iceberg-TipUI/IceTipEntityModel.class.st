"
I'm a generic model for Iceberg entities (tipically, repositories, commits, packages, etc., etc., etc.) 
"
Class {
	#name : 'IceTipEntityModel',
	#superclass : 'IceTipModel',
	#instVars : [
		'entity',
		'repositoryModel'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'instance creation' }
IceTipEntityModel class >> new [
	self error: 'Use #for:'
]

{ #category : 'instance creation' }
IceTipEntityModel class >> on: anObject [ 
	^ self basicNew 
		initializeEntity: anObject;
		yourself
]

{ #category : 'instance creation' }
IceTipEntityModel class >> repositoryModel: aRepositoryModel on: anObject [ 
	^ self basicNew		
		initializeEntity: anObject;
		repositoryModel: aRepositoryModel;
		yourself
]

{ #category : 'accessing' }
IceTipEntityModel >> description [
	"A decorated description of this entity. 
	 It can return a text (in case decorations apply) or a simple string."
	^ self subclassResponsibility
]

{ #category : 'accessing' }
IceTipEntityModel >> descriptionDecorator [
	
	^ IceTipTextDecorator none
]

{ #category : 'accessing' }
IceTipEntityModel >> displayString [
	^ self entity name
]

{ #category : 'accessing' }
IceTipEntityModel >> entity [
	^ entity
]

{ #category : 'fetching' }
IceTipEntityModel >> fetch [

	self entity fetch
]

{ #category : 'initialization' }
IceTipEntityModel >> initializeEntity: anObject [
	entity := anObject.
	self initialize
	
]

{ #category : 'testing' }
IceTipEntityModel >> isCommitish [
	
	^ false
]

{ #category : 'testing' }
IceTipEntityModel >> isModelOf: anObject [
	^ self entity = anObject
]

{ #category : 'accessing' }
IceTipEntityModel >> name [
	
	^ self entity name
]

{ #category : 'tagging' }
IceTipEntityModel >> newCreateTagAction: aString [
	<noCache>

	^ IceTipStandardAction new 
		repository: self entity;
		message: ('Creating tag {1} on commit {2}' format: { aString. self commit shortId });
		onSuccessRepositoryModified;
		action: [ self entity createTag: aString ]
		yourself
]

{ #category : 'accessing' }
IceTipEntityModel >> repositoryModel [
	^ repositoryModel
]

{ #category : 'accessing' }
IceTipEntityModel >> repositoryModel: anObject [
	repositoryModel := anObject
]

{ #category : 'accessing' }
IceTipEntityModel >> shortDescription [

	^ self description asString
		ifNotEmpty: [ :aString | aString lines first ]
		ifEmpty: [ 'No message' ]
]

{ #category : 'accessing' }
IceTipEntityModel >> shortDescriptionWithTags [

	^ String streamContents: [ :stream |
		self entity tags do: [ :each | 
			stream << '[' << each name << '] ' ].
		stream << self shortDescription ]
]
