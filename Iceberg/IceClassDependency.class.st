"
I am a dependency to a class.
"
Class {
	#name : #IceClassDependency,
	#superclass : #IceDefinedDependency,
	#category : 'Iceberg-Cherrypicking'
}

{ #category : #comparing }
IceClassDependency >> = anObject [

	^ super = anObject and: [definition superclassName = anObject definition superclassName]

]

{ #category : #comparing }
IceClassDependency >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: definition superclassName hash
]

{ #category : #visiting }
IceClassDependency >> isDependencyTo: anIceClassDefinition [

	^ anIceClassDefinition asMCDefinition className = definition className

]

{ #category : #dependencies }
IceClassDependency >> referencedClasses [

	^ {definition superclassName} , self referencedSharedPool
]

{ #category : #dependencies }
IceClassDependency >> referencedSharedPool [

	^ (definition sharedPoolsString splitOn: ' ') collect: #asSymbol
]

{ #category : #dependencies }
IceClassDependency >> referencedTraits [

	^ ((RBParser parseExpression: definition traitComposition) allChildren select: #isVariable)
		collect: #name 
]
