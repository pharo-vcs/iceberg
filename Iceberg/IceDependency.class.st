"
I am a dependency of an IceDefinition in a IceDiff.

"
Class {
	#name : #IceDependency,
	#superclass : #Object,
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #adding }
IceDependency >> addTransitiveDependenciesFrom: anIceDiff to: anIceCherrypicker [
	^ self subclassResponsibility
]

{ #category : #adding }
IceDependency >> isDependencyTo: aDefinition [
	^ self subclassResponsibility
]
