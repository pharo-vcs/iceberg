Class {
	#name : #IceDependencyEnvironment,
	#superclass : #Object,
	#instVars : [
		'commit',
		'definitions'
	],
	#category : #'Iceberg-Cherrypicking'
}

{ #category : #'instance creation' }
IceDependencyEnvironment class >> on: anIceGitCommit [ 
	^ self new 
	commit: anIceGitCommit;
	yourself 
]

{ #category : #'as yet unclassified' }
IceDependencyEnvironment >> allSubclassesNamesOf: aName [

	| result |
	result := self subclassNamesOf: aName.
	result ifEmpty: [ ^ result ].
	
	^ result , (result flatCollect: [ :e | self allSubclassesNamesOf: e ]).
]

{ #category : #'as yet unclassified' }
IceDependencyEnvironment >> allusedTraitsNamesOf: aName [ 
	| result |
	result := self usedTraitsNamesOf: aName.
	result ifEmpty: [ ^ result ].

	^ result
		, (result flatCollect: [ :e | self allusedTraitsNamesOf:  e ])
]

{ #category : #querying }
IceDependencyEnvironment >> classes [
	
	^ self definitions select: [ :e | e isClassDefinition ]
]

{ #category : #accessing }
IceDependencyEnvironment >> commit: anIceGitCommit [ 
	commit := anIceGitCommit
]

{ #category : #private }
IceDependencyEnvironment >> definitions [

	^ definitions
		ifNil: [ 
			definitions := commit packages flatCollect: [ :package | (commit snapshotForPackage: package) definitions ] ]
]

{ #category : #querying }
IceDependencyEnvironment >> subclassNamesOf: aString [
	^ self classes
		select: [ :e | e superclassName = aString ]
		thenCollect: [ :e | e className ]
]

{ #category : #'as yet unclassified' }
IceDependencyEnvironment >> traits [
	^ self definitions select: [ :e | e isTraitDefinition ]
]

{ #category : #'as yet unclassified' }
IceDependencyEnvironment >> usedTraitsNamesOf: aString [ 
	^ (self traits , self classes) 
		select: [ :e | e traitComposition includesSubstring: aString ]
		thenCollect: [ :e | e className ]
]
