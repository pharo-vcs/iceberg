"
I am a dependency to a trait.
"
Class {
	#name : #IceTraitDependency,
	#superclass : #IceDefinedDependency,
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #comparing }
IceTraitDependency >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	^ super = anObject
		and: [ self definition name = anObject definition name ]
]

{ #category : #comparing }
IceTraitDependency >> hash [
	"Answer an integer value that is related to the identity of the receiver."
	^ super hash bitXor: definition name hash.
	"^ definition hash"
]

{ #category : #visiting }
IceTraitDependency >> isDependencyTo: anIceTraitDefinition [
	^ anIceTraitDefinition name = definition name
]

{ #category : #dependencies }
IceTraitDependency >> referencedClasses [

	^ {  }
]

{ #category : #dependencies }
IceTraitDependency >> referencedPackages [
	^ self definition asMCDefinition category
]

{ #category : #dependencies }
IceTraitDependency >> referencedTraits [
	^ (((RBParser
		parseExpression: definition asMCDefinition traitComposition)
		allChildren select: #isVariable) collect: #name ) , self usedTraitsNames  
]

{ #category : #'as yet unclassified' }
IceTraitDependency >> usedTraitsNames [
	^ self cherrypicker environment
		allUsingTraitNamed: self definition name
]
