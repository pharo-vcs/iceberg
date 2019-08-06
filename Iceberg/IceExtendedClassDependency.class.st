Class {
	#name : #IceExtendedClassDependency,
	#superclass : #IceDefinedDependency,
	#instVars : [
		'name'
	],
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #comparing }
IceExtendedClassDependency >> = anObject [
self flag: 'comparaison de package origine et étendu ? '.
	^ super = anObject and: [ self name = anObject name ]
]

{ #category : #dependencies }
IceExtendedClassDependency >> addTransitiveDependenciesFrom: anIceDiff to: aCheryPicker [
	super addTransitiveDependenciesFrom: anIceDiff  to: aCheryPicker.
	1 halt.
]

{ #category : #adding }
IceExtendedClassDependency >> isDependencyTo: aDefinition [
	^ aDefinition name = self name.
]

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
