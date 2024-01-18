Class {
	#name : 'IceDependencyEnvironment',
	#superclass : 'Object',
	#instVars : [
		'commit',
		'definitions'
	],
	#category : 'Iceberg-Cherrypicking',
	#package : 'Iceberg',
	#tag : 'Cherrypicking'
}

{ #category : 'instance creation' }
IceDependencyEnvironment class >> on: anIceGitCommit [ 
	^ self new 
	commit: anIceGitCommit;
	yourself 
]

{ #category : 'accessing' }
IceDependencyEnvironment >> allSubclassesNamesOf: aName [

	| result |
	result := self subclassNamesOf: aName.
	result ifEmpty: [ ^ result ].
	
	^ result , (result flatCollect: [ :e | self allSubclassesNamesOf: e ]).
]

{ #category : 'accessing' }
IceDependencyEnvironment >> allUsingTraitNamed: aName [ 
	| result |
	result := self usersOfTraitNamed: aName.
	result ifEmpty: [ ^ result ].

	^ result
		, (result flatCollect: [ :e | self allUsingTraitNamed:  e ])
]

{ #category : 'querying' }
IceDependencyEnvironment >> classes [
	
	^ self definitions select: [ :e | e isClassDefinition ]
]

{ #category : 'accessing' }
IceDependencyEnvironment >> commit: anIceGitCommit [ 
	commit := anIceGitCommit
]

{ #category : 'private' }
IceDependencyEnvironment >> definitions [

	^ definitions
		ifNil: [ 
			definitions := commit packages flatCollect: [ :package | (commit snapshotForPackage: package) definitions ] ]
]

{ #category : 'querying' }
IceDependencyEnvironment >> subclassNamesOf: aString [
	^ self classes
		select: [ :e | e superclassName = aString ]
		thenCollect: [ :e | e className ]
]

{ #category : 'accessing' }
IceDependencyEnvironment >> traits [
	^ self definitions select: [ :e | e isTraitDefinition ]
]

{ #category : 'accessing' }
IceDependencyEnvironment >> usersOfTraitNamed: aName [ 
	^ (self traits , self classes) 
		select: [ :e | e traitComposition includesSubstring: aName ]
		thenCollect: [ :e | e className ]
]
