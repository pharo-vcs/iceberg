"
I am a dependency to a method.
"
Class {
	#name : #IceMethodDependency,
	#superclass : #IceDefinedDependency,
	#category : 'Iceberg-Cherrypicking'
}

{ #category : #comparing }
IceMethodDependency >> = anObject [

	^ super = anObject and: [definition selector = anObject definition selector]

]

{ #category : #comparing }
IceMethodDependency >> hash [

	^ super hash bitXor: definition className hash
]

{ #category : #testing }
IceMethodDependency >> isDependencyTo: anIceMethodDefinition [

	^ 	anIceMethodDefinition asMCDefinition isMethodDefinition and: [ 
		anIceMethodDefinition asMCDefinition className = definition className and: [ 
		anIceMethodDefinition asMCDefinition selector = definition selector ] ]
]

{ #category : #dependencies }
IceMethodDependency >> referencedClasses [

	^ self referencedNames , {definition className}
]

{ #category : #dependencies }
IceMethodDependency >> referencedNames [

	^ ((RBParser parseMethod: definition source) allChildren
		select: #isVariable) collect: #name
]

{ #category : #dependencies }
IceMethodDependency >> referencedTraits [
	
	"The method cannot diferenciate if the reference is a trait or a class, so I try both"
	^ self referencedClasses 
]
