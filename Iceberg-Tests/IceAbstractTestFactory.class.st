Class {
	#name : #IceAbstractTestFactory,
	#superclass : #Object,
	#category : 'Iceberg-Tests-Common-Fixtures'
}

{ #category : #initialization }
IceAbstractTestFactory class >> setUp [

	^ self new setUp
]

{ #category : #accessing }
IceAbstractTestFactory >> ensureRemoteRepository [
	
	self subclassResponsibility
]

{ #category : #testing }
IceAbstractTestFactory >> isGit [
	
	self subclassResponsibility
]

{ #category : #initialization }
IceAbstractTestFactory >> newRemoteNamed: aName toRepository: aRepository [

	self subclassResponsibility
]

{ #category : #initialization }
IceAbstractTestFactory >> newRepositoryNamed: projectName [

	^ self newRepositoryNamed: projectName withSubdirectory: ''
]

{ #category : #initialization }
IceAbstractTestFactory >> newRepositoryNamed: projectName withSubdirectory: aSubdirectory [

	self subclassResponsibility
]

{ #category : #initialization }
IceAbstractTestFactory >> tearDownWithRepository: aRepository [
		
	self subclassResponsibility
]
