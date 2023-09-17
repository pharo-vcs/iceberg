Class {
	#name : 'IceMemoryChange',
	#superclass : 'IceChange',
	#instVars : [
		'package'
	],
	#category : 'Iceberg-Memory',
	#package : 'Iceberg-Memory'
}

{ #category : 'instance creation' }
IceMemoryChange class >> on: anIcePackage [ 
	
	^ self new
		package: anIcePackage;
		yourself
]

{ #category : 'visiting' }
IceMemoryChange >> accept: aVisitor [
	
	aVisitor visitMemoryChange: self
]

{ #category : 'displaying' }
IceMemoryChange >> displayingProgressString [
	^ 'Comparing memory changes of ' , self package name
]

{ #category : 'accessing' }
IceMemoryChange >> package [
	^ package
]

{ #category : 'accessing' }
IceMemoryChange >> package: anIcePackage [
	
	package := anIcePackage
]
