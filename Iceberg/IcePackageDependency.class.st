"
I am a dependency to a package.
"
Class {
	#name : 'IcePackageDependency',
	#superclass : 'IceDependency',
	#instVars : [
		'definition'
	],
	#category : 'Iceberg-Cherrypicking',
	#package : 'Iceberg',
	#tag : 'Cherrypicking'
}

{ #category : 'comparing' }
IcePackageDependency >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ definition name = anObject definition name
]

{ #category : 'dependencies' }
IcePackageDependency >> addTransitiveDependenciesFrom: anIceDiff to: anIceCherrypicker [ 
	"No transitive dependencies of a package"
]

{ #category : 'accessing' }
IcePackageDependency >> definition [ 
	^ definition 
]

{ #category : 'accessing' }
IcePackageDependency >> definition: aIcePackageDefinition [
	definition := aIcePackageDefinition
]

{ #category : 'comparing' }
IcePackageDependency >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ definition name hash
]

{ #category : 'testing' }
IcePackageDependency >> isDependencyTo: anIcePackageDefinition [
	^ definition name = anIcePackageDefinition name
]
