"
I'm a generic model for Iceberg entities (tipically, repositories, commits, packages, etc., etc., etc.) 
"
Class {
	#name : #IceTipEntityModel,
	#superclass : #IceTipModel,
	#instVars : [
		'entity',
		'repositoryModel'
	],
	#category : #'Iceberg-TipUI-Model'
}

{ #category : #'instance creation' }
IceTipEntityModel class >> new [
	self error: 'Use #for:'
]

{ #category : #'instance creation' }
IceTipEntityModel class >> on: anObject [ 
	^ self basicNew 
		initializeEntity: anObject;
		yourself
]

{ #category : #'instance creation' }
IceTipEntityModel class >> repositoryModel: aRepositoryModel on: anObject [ 
	^ self basicNew		
		initializeEntity: anObject;
		repositoryModel: aRepositoryModel;
		yourself
]

{ #category : #accessing }
IceTipEntityModel >> description [
	"A decorated description of this entity. 
	 It can return a text (in case decorations apply) or a simple string."
	^ self subclassResponsibility
]

{ #category : #accessing }
IceTipEntityModel >> descriptionDecorator [
	
	^ IceTipTextDecorator none
]

{ #category : #accessing }
IceTipEntityModel >> displayString [
	^ self entity name
]

{ #category : #accessing }
IceTipEntityModel >> entity [
	^ entity
]

{ #category : #initialization }
IceTipEntityModel >> initializeEntity: anObject [
	entity := anObject.
	self initialize
	
]

{ #category : #testing }
IceTipEntityModel >> isCommitish [
	
	^ false
]

{ #category : #testing }
IceTipEntityModel >> isModelOf: anObject [
	^ self entity = anObject
]

{ #category : #tagging }
IceTipEntityModel >> newCreateTagAction: aString [
	<noCache>

	^ IceTipStandardAction new 
		repository: self entity;
		message: ('Creating tag {1} on commit {2}' format: { aString. self commit shortId });
		onSuccessRepositoryModified;
		action: [ self commit createTag: aString ]
		yourself
]

{ #category : #accessing }
IceTipEntityModel >> repositoryModel [
	^ repositoryModel
]

{ #category : #accessing }
IceTipEntityModel >> repositoryModel: anObject [
	repositoryModel := anObject
]

{ #category : #accessing }
IceTipEntityModel >> shortDescription [
	"Answer a <String> describing a short version of the receiver from its description. If there is no description, answer an empty <String> to avoid breaking the Push (see https://github.com/pharo-project/pharo/issues/12123)"

	^ self description asString
		ifEmpty: [ String empty ]
		ifNotEmpty: [ : d | d lines first ]
]
