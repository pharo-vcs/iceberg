Class {
	#name : #IceUrlProtocol,
	#superclass : #Object,
	#category : 'Iceberg-Url'
}

{ #category : #'as yet unclassified' }
IceUrlProtocol class >> defaultProtocol [

	^ IceSSHProtocol
]

{ #category : #accessing }
IceUrlProtocol class >> description [
	
	^ self subclassResponsibility
]

{ #category : #testing }
IceUrlProtocol class >> isAbstract [

	^ self == IceUrlProtocol 
]
