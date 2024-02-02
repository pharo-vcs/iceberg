Class {
	#name : 'IceTestDefinition',
	#superclass : 'IceDefinition',
	#instVars : [
		'contents'
	],
	#category : 'Iceberg-Tests-Changes',
	#package : 'Iceberg-Tests',
	#tag : 'Changes'
}

{ #category : 'instance creation' }
IceTestDefinition class >> named: aString contents: aContensts [
	
	^ self new
		name: aString;
		contents: aContensts;
		yourself
]

{ #category : 'comparing' }
IceTestDefinition >> = aTestDefinition [
	
	^ super = aTestDefinition
		and: [ contents = aTestDefinition contents ]
]

{ #category : 'accessing' }
IceTestDefinition >> contents [

	^ contents
]

{ #category : 'accessing' }
IceTestDefinition >> contents: aString [ 
	
	contents := aString
]

{ #category : 'comparing' }
IceTestDefinition >> hash [

	^ super hash + contents hash
]

{ #category : 'initialization' }
IceTestDefinition >> initialize [
	super initialize.
	name := 'test'
]
