Class {
	#name : #IceExtendedClassDependency,
	#superclass : #IceDefinedDependency,
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #comparing }
IceExtendedClassDependency >> = anObject [
	^ super = anObject and: [ self definition name = anObject definition name ]
]

{ #category : #comparing }
IceExtendedClassDependency >> hash [
	^ super hash bitXor: self definition name hash
]

{ #category : #adding }
IceExtendedClassDependency >> isDependencyTo: anIceDefinition [
	^ anIceDefinition name = self definition name
]

{ #category : #dependencies }
IceExtendedClassDependency >> referencedClasses [
	^ {definition name asSymbol }
]

{ #category : #dependencies }
IceExtendedClassDependency >> referencedPackages [
	^ {self definition packageName}
]

{ #category : #dependencies }
IceExtendedClassDependency >> referencedTraits [
	
	^ self referencedClasses 
]

{ #category : #visiting }
IceExtendedClassDependency >> visitExtensionDefinition: anIceExtensionDefinition [
	^ definition  name = anIceExtensionDefinition name
]
