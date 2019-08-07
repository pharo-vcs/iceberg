"
I am a dependency to a class.
"
Class {
	#name : #IceClassDependency,
	#superclass : #IceDefinedDependency,
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #comparing }
IceClassDependency >> = anObject [
	^ super = anObject
		and: [ definition asMCDefinition superclassName = anObject definition asMCDefinition superclassName ]
]

{ #category : #comparing }
IceClassDependency >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ super hash bitXor: self definition asMCDefinition superclassName hash
]

{ #category : #visiting }
IceClassDependency >> isDependencyTo: aIceDefinition [
	^ aIceDefinition asMCDefinition className
		= definition asMCDefinition className
]

{ #category : #dependencies }
IceClassDependency >> referencedClasses [
	^ {definition asMCDefinition superclassName} , self subclassNames
		, self referencedSharedPool
]

{ #category : #dependencies }
IceClassDependency >> referencedPackages [

	^ self definition asMCDefinition category
]

{ #category : #dependencies }
IceClassDependency >> referencedSharedPool [
	^ (definition asMCDefinition sharedPoolsString splitOn: ' ') collect: #asSymbol
]

{ #category : #dependencies }
IceClassDependency >> referencedTraits [
	^ ((RBParser parseExpression: definition asMCDefinition traitComposition)
		allChildren select: #isVariable) collect: #name
]

{ #category : #'as yet unclassified' }
IceClassDependency >> subclassNames [

	^ self cherrypicker environment
		allSubclassesNamesOf: self definition name
]
