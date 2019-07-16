"
I am a dependency for the IceDefinitions that have a MCDefinition.
"
Class {
	#name : #IceDefinedDependency,
	#superclass : #IceDependency,
	#instVars : [
		'definition'
	],
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #comparing }
IceDefinedDependency >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self species = anObject species ifFalse: [ ^ false ].
	^ definition className = anObject definition className
]

{ #category : #dependencies }
IceDefinedDependency >> addTransitiveDependenciesFrom: anIceDiff to: anIceCherrypicker [ 
	
	self referencedClasses do: [ :aName | 
		IceNodeQuery new
			on: anIceDiff tree;
			className: aName;
			execute;
			ifFound: [ :aIceNode | anIceCherrypicker addClassDependencyOf: aIceNode value definition asMCDefinition ]].

	self referencedTraits do: [ :aName | 
		IceNodeQuery new
			on: anIceDiff tree;
			traitName: aName;
			execute;
			ifFound: [ :aIceNode | anIceCherrypicker addTraitDependencyOf: aIceNode value definition asMCDefinition ]].

]

{ #category : #accessing }
IceDefinedDependency >> definition [
	^ definition
]

{ #category : #accessing }
IceDefinedDependency >> definition: anObject [
	definition := anObject
]

{ #category : #comparing }
IceDefinedDependency >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ definition className hash
]

{ #category : #testing }
IceDefinedDependency >> isDependencyTo: aDefinition [ 
	
	^ aDefinition accept: self
]

{ #category : #dependencies }
IceDefinedDependency >> referencedClasses [

	^ self subclassResponsibility 
]

{ #category : #dependencies }
IceDefinedDependency >> referencedTraits [

	^ self subclassResponsibility 
]
