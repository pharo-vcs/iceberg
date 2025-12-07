"
Representation of a tag
"
Class {
	#name : 'IceTag',
	#superclass : 'IceCommitish',
	#instVars : [
		'name',
		'commit'
	],
	#category : 'Iceberg-Core',
	#package : 'Iceberg',
	#tag : 'Core'
}

{ #category : 'instance creation' }
IceTag class >> named: aTagName inRepository: anIceRepository [ 
	^ self new name: aTagName; repository: anIceRepository; yourself
]

{ #category : 'querying' }
IceTag >> commit [
	^ commit ifNil: [ commit := self repository peelTag: self ]
]

{ #category : 'API - tags' }
IceTag >> delete [

	self repository removeTag: self
]

{ #category : 'accessing' }
IceTag >> fileSystem [
	
	^ self commit fileSystem
]

{ #category : 'accessing' }
IceTag >> gitRef [
	^ self name
]

{ #category : 'testing' }
IceTag >> isTag [

	^ true
]

{ #category : 'querying' }
IceTag >> lastCommit [

	^ self repository backend revparse: self name
]

{ #category : 'accessing' }
IceTag >> name [
	^ name
]

{ #category : 'accessing' }
IceTag >> name: anObject [
	name := anObject
]

{ #category : 'API - history' }
IceTag >> newCommitWalk [

	^ repository newCommitWalk fromTag: self
]

{ #category : 'printing' }
IceTag >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPutAll: ': ';
		print: self name
]

{ #category : 'querying' }
IceTag >> versionFor: package [
	^ self commit versionFor: package
]

{ #category : 'accessing' }
IceTag >> versionsFor: package [ 
	^ self commit versionsFor: package
]
