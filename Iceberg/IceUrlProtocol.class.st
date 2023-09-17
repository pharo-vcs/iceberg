Class {
	#name : 'IceUrlProtocol',
	#superclass : 'Object',
	#category : 'Iceberg-Url',
	#package : 'Iceberg',
	#tag : 'Url'
}

{ #category : 'accessing - defaults' }
IceUrlProtocol class >> defaultProtocol [

	^ IceSSHProtocol
]

{ #category : 'accessing' }
IceUrlProtocol class >> description [
	
	^ self subclassResponsibility
]

{ #category : 'testing' }
IceUrlProtocol class >> isAbstract [

	^ self == IceUrlProtocol 
]
