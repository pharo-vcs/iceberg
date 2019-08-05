Class {
	#name : #IceExtendedClassDependency,
	#superclass : #IceDefinedDependency,
	#instVars : [
		'name'
	],
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #accessing }
IceExtendedClassDependency >> name [
	^ name
]

{ #category : #accessing }
IceExtendedClassDependency >> name: anObject [
	name := anObject
]

{ #category : #dependencies }
IceExtendedClassDependency >> referencedClasses [
	^ { name asSymbol }
]

{ #category : #dependencies }
IceExtendedClassDependency >> referencedTraits [
	
	^ self referencedClasses 
]

{ #category : #visiting }
IceExtendedClassDependency >> visitExtensionDefinition: anIceExtensionDefinition [ 

	^ name = anIceExtensionDefinition className 
]
