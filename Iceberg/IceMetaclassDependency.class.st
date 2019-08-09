"
I am a dependency to a metaclass.
"
Class {
	#name : #IceMetaclassDependency,
	#superclass : #IceDependency,
	#instVars : [
		'definition'
	],
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #dependencies }
IceMetaclassDependency >> addTransitiveDependenciesFrom: anIceDiff to: anIceCherrypicker [
	IceNodeQuery new
		on: anIceDiff tree;
		className: definition name;
		execute;
		ifFound:
				[ :anIceNode | anIceCherrypicker addClassDependencyOf: anIceNode value definition ]
]

{ #category : #accessing }
IceMetaclassDependency >> definition [
	^ definition
]

{ #category : #accessing }
IceMetaclassDependency >> definition: anIceClassDefinition [
	definition:= anIceClassDefinition 
]

{ #category : #visiting }
IceMetaclassDependency >> isDependencyTo: anIceClassDefinition [
	^ anIceClassDefinition basicName = definition basicName
]
