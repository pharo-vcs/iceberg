Class {
	#name : 'IceTipCollectionRepositoryProvider',
	#superclass : 'Object',
	#instVars : [
		'collection'
	],
	#category : 'Iceberg-UI-Tests',
	#package : 'Iceberg-UI-Tests'
}

{ #category : 'accessing' }
IceTipCollectionRepositoryProvider >> addRepository: aRepository [
	
	collection add: aRepository
]

{ #category : 'accessing' }
IceTipCollectionRepositoryProvider >> collection: anObject [
	collection := anObject
]

{ #category : 'accessing' }
IceTipCollectionRepositoryProvider >> repositories [

	^ collection
]
