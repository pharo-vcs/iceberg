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
self flag: 'Comparaison normale ?'.
	^ aIceDefinition asMCDefinition className 
		= definition asMCDefinition className.
]

{ #category : #dependencies }
IceClassDependency >> referencedClasses [

	^ {definition asMCDefinition superclassName} , self referencedSharedPool
]

{ #category : #'as yet unclassified' }
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
