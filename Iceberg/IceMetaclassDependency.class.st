"
I am a dependency to a metaclass.
"
Class {
	#name : #IceMetaclassDependency,
	#superclass : #IceDependency,
	#instVars : [
		'name'
	],
	#category : 'Iceberg-Cherrypicking'
}

{ #category : #dependencies }
IceMetaclassDependency >> addTransitiveDependenciesFrom: anIceDiff to: anIceCherrypicker [

	IceNodeQuery new
		on: anIceDiff tree;
		className: name;
		execute;
		ifFound: [ :aIceNode | 
			anIceCherrypicker addClassDependencyOf: aIceNode value definition asMCDefinition ]
]

{ #category : #visiting }
IceMetaclassDependency >> isDependencyTo: anIceClassDefinition [

	^ anIceClassDefinition basicName = name
]

{ #category : #accessing }
IceMetaclassDependency >> name [

	^ name
]

{ #category : #accessing }
IceMetaclassDependency >> name: aString [ 

	name := aString
]
