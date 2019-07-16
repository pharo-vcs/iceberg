"
I am a dependency to a trait.
"
Class {
	#name : #IceTraitDependency,
	#superclass : #IceDefinedDependency,
	#category : 'Iceberg-Cherrypicking'
}

{ #category : #visiting }
IceTraitDependency >> isDependencyTo: anIceTraitDefinition [

	^ anIceTraitDefinition name = definition className
]

{ #category : #dependencies }
IceTraitDependency >> referencedClasses [

	^ {  }
]

{ #category : #dependencies }
IceTraitDependency >> referencedTraits [

	^ ((RBParser parseExpression: definition traitComposition)
		allChildren select: #isVariable) collect: #name
]
