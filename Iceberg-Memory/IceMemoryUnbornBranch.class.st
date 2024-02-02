Class {
	#name : 'IceMemoryUnbornBranch',
	#superclass : 'IceUnbornBranch',
	#instVars : [
		'name'
	],
	#category : 'Iceberg-Memory',
	#package : 'Iceberg-Memory'
}

{ #category : 'instance creation' }
IceMemoryUnbornBranch class >> inRepository: anIceMemoryRepository named: aString [ 
	
	^ (super inRepository: anIceMemoryRepository)
		name: aString;
		yourself
]

{ #category : 'accessing' }
IceMemoryUnbornBranch >> name [

	^ name
]

{ #category : 'accessing' }
IceMemoryUnbornBranch >> name: aString [ 
	
	name := aString
]
