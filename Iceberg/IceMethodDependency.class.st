"
I am a dependency to a method.
"
Class {
	#name : 'IceMethodDependency',
	#superclass : 'IceDefinedDependency',
	#category : 'Iceberg-Cherrypicking',
	#package : 'Iceberg',
	#tag : 'Cherrypicking'
}

{ #category : 'comparing' }
IceMethodDependency >> = anObject [
	^ super = anObject
		and: [ definition asMCDefinition selector = anObject definition asMCDefinition selector ]
]

{ #category : 'testing' }
IceMethodDependency >> addTransitiveDependenciesFrom: anIceDiff to: anIceCherrypicker [
	super addTransitiveDependenciesFrom: anIceDiff to: anIceCherrypicker.

	self referencedSelectors
		do: [ :aSelector | 
			IceNodeQuery new
				on: anIceDiff tree;
				selector: aSelector;
				execute;
				ifFound: [ :anIceNode | anIceCherrypicker addDependency: (anIceNode accept: IceAsDependencyVisitor new  )] ]
]

{ #category : 'comparing' }
IceMethodDependency >> hash [
	^ super hash bitXor: definition asMCDefinition className hash
]

{ #category : 'testing' }
IceMethodDependency >> isDependencyTo: anIceMethodDefinition [

	^ 	anIceMethodDefinition isMethodDefinition and: [ 
		anIceMethodDefinition asMCDefinition className = definition className and: [ 
		anIceMethodDefinition asMCDefinition selector = definition selector ] ]
]

{ #category : 'dependencies' }
IceMethodDependency >> methodAST [
	^ RBParser parseMethod: definition asMCDefinition source
]

{ #category : 'dependencies' }
IceMethodDependency >> referencedClasses [

	^ self referencedNames , {definition className}
]

{ #category : 'dependencies' }
IceMethodDependency >> referencedNames [
	^ (self methodAST allChildren select: #isVariable) collect: #name
]

{ #category : 'dependencies' }
IceMethodDependency >> referencedPackages [
	^ { }
]

{ #category : 'computing - dependencies' }
IceMethodDependency >> referencedSelectors [
	
	^ (self methodAST allChildren select: #isMessage) collect: #selector
]

{ #category : 'dependencies' }
IceMethodDependency >> referencedTraits [
	
	"The method cannot diferenciate if the reference is a trait or a class, so I try both"
	^ self referencedClasses 
]
