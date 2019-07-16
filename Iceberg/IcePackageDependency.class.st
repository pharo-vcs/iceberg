"
I am a dependency to a package.
"
Class {
	#name : #IcePackageDependency,
	#superclass : #IceDependency,
	#instVars : [
		'name'
	],
	#category : 'Iceberg-Cherrypicking'
}

{ #category : #dependencies }
IcePackageDependency >> addTransitiveDependenciesFrom: anIceDiff to: anIceCherrypicker [ 
	"No transitive dependencies of a package"
]

{ #category : #testing }
IcePackageDependency >> isDependencyTo: anIcePackageDefinition [ 

	^ name = anIcePackageDefinition name
]

{ #category : #accessing }
IcePackageDependency >> name [
	^ name
]

{ #category : #accessing }
IcePackageDependency >> name: anObject [
	name := anObject
]
