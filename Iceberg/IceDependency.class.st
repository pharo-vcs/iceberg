"
I am a dependency of an IceDefinition in a IceDiff.

"
Class {
	#name : #IceDependency,
	#superclass : #Object,
	#instVars : [
		'cherrypicker'
	],
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #adding }
IceDependency >> addTransitiveDependenciesFrom: anIceDiff to: anIceCherrypicker [
	^ self subclassResponsibility
]

{ #category : #accessing }
IceDependency >> cherrypicker [ 
	^ cherrypicker 
]

{ #category : #accessing }
IceDependency >> cherrypicker: anIceCherrypicker [
	cherrypicker :=anIceCherrypicker 
]

{ #category : #adding }
IceDependency >> isDependencyTo: aDefinition [
	^ self subclassResponsibility
]
