"
I am a dependency for the IceDefinitions that have a MCDefinition.
"
Class {
	#name : 'IceDefinedDependency',
	#superclass : 'IceDependency',
	#instVars : [
		'definition'
	],
	#category : 'Iceberg-Cherrypicking',
	#package : 'Iceberg',
	#tag : 'Cherrypicking'
}

{ #category : 'comparing' }
IceDefinedDependency >> = anObject [
	"Answer whether the receiver and anObject represent the same object."
	self == anObject
		ifTrue: [ ^ true ].
	self species = anObject species
		ifFalse: [ ^ false ].
	^ definition className = anObject definition className
]

{ #category : 'dependencies' }
IceDefinedDependency >> addTransitiveDependenciesFrom: anIceDiff to: anIceCherrypicker [
	| asDependencyVisitor |
	asDependencyVisitor := IceAsDependencyVisitor new.
	asDependencyVisitor cherrypicker: anIceCherrypicker .

	self referencedClasses
		do: [ :aName | 
			IceNodeQuery new
				on: anIceDiff tree;
				className: aName;
				execute;
				ifFound:
						[ :iceNode | anIceCherrypicker addDependency: (iceNode accept: asDependencyVisitor) ] ].

	self referencedTraits
		do: [ :aName | 
			IceNodeQuery new
				on: anIceDiff tree;
				traitName: aName;
				execute;
				ifFound:
						[ :iceNode | anIceCherrypicker addDependency: (iceNode accept: asDependencyVisitor) ] ].

	self referencedPackages
		do: [ :aName | 
			IceNodeQuery new
				on: anIceDiff tree;
				packageName: aName;
				execute;
				ifFound:
						[ :iceNode | anIceCherrypicker addDependency: (iceNode accept: asDependencyVisitor) ] ]
]

{ #category : 'accessing' }
IceDefinedDependency >> definition [
	^ definition
]

{ #category : 'accessing' }
IceDefinedDependency >> definition: anObject [
	definition := anObject
]

{ #category : 'comparing' }
IceDefinedDependency >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ definition className hash
]

{ #category : 'dependencies' }
IceDefinedDependency >> referencedClasses [

	^ self subclassResponsibility 
]

{ #category : 'dependencies' }
IceDefinedDependency >> referencedPackages [
	^ self subclassResponsibility
]

{ #category : 'dependencies' }
IceDefinedDependency >> referencedTraits [

	^ self subclassResponsibility 
]
