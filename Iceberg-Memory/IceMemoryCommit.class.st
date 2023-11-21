"
I'm a commit that works on memory. 
I'm used for testing.
"
Class {
	#name : 'IceMemoryCommit',
	#superclass : 'IceCommit',
	#instVars : [
		'mcCommit'
	],
	#category : 'Iceberg-Memory',
	#package : 'Iceberg-Memory'
}

{ #category : 'comparing' }
IceMemoryCommit >> = aCommit [

	self == aCommit ifTrue: [ ^ true ].

	self species = aCommit species ifFalse: [ ^ false ].

	^ self mcCommit dependencies asSet = aCommit mcCommit dependencies asSet
]

{ #category : 'accessing' }
IceMemoryCommit >> ancestors [
	
	^ self mcCommit info ancestors collect: [ :parentMcCommitInfo | | iceCommit parentMcCommit |
		parentMcCommit := repository branchRepository versionWithInfo: parentMcCommitInfo.
		iceCommit := IceMemoryCommit new.
		iceCommit repository: repository.
		iceCommit mcCommit: parentMcCommit.
		iceCommit ]
]

{ #category : 'accessing' }
IceMemoryCommit >> author [
	
	^ mcCommit info author
]

{ #category : 'private-changes' }
IceMemoryCommit >> changedPackagesToCommitInfo: aCommit [
	
	| otherDependencies |
	otherDependencies := aCommit mcCommit dependencies.
	^ (mcCommit dependencies select: [ :each |
		| found |
		found := otherDependencies detect: [ :other | other name = each name ] ifNone: [ nil ].
		found isNil or: [ found id ~= each id ] ]) 
			collect: [ :each | each package ] as: Array
]

{ #category : 'private-changes' }
IceMemoryCommit >> changesFromCommit: anIceCommit [ 

	^ (anIceCommit changedPackagesToCommitInfo: self)
		collect: [ :package | IceMemoryChange on: package ]
]

{ #category : 'accessing' }
IceMemoryCommit >> comment [
	
	^ mcCommit info message
]

{ #category : 'ancestry' }
IceMemoryCommit >> commonAncestorWithCommit: anIceMemoryCommit [ 
	
	| ancestor ancestorInfo |
	ancestorInfo := mcCommit info commonAncestorWith: anIceMemoryCommit mcCommit info.
	ancestor := repository branchRepository versionWithInfo: ancestorInfo.
	ancestor ifNil: [ ^ nil ].
	
	^ IceMemoryCommit new
		repository: repository;
		mcCommit: ancestor;
		yourself
]

{ #category : 'private-monticello' }
IceMemoryCommit >> commonMCAncestorWith: anIceMemoryCommit [ 
	
	^ mcCommit info commonAncestorWith: anIceMemoryCommit mcCommit info
]

{ #category : 'API-tags' }
IceMemoryCommit >> createTag: aString [ 
	
	(self repository hasTagNamed: aString) ifTrue: [ 
		IceTagAlreadyExists new
			tagName: aString;
			signal ].
	self repository tagsAt: aString put: self.
	^ IceTag named: aString inRepository: self repository.
]

{ #category : 'accessing' }
IceMemoryCommit >> datetime [
	
	^ self mcCommit info timeStamp
]

{ #category : 'comparing' }
IceMemoryCommit >> hash [

	self mcCommit dependencies isEmpty ifTrue: [ ^ 0 hash ].
	self mcCommit dependencies size = 1 ifTrue: [ 
		^ self mcCommit dependencies anyOne hash ].
	
	"Fold only works for collection of >=2 elements"
	^ (self mcCommit dependencies asArray sort: [ :a :b | a timeStamp > b timeStamp ])
			fold: [ :a :b | a hash bitXor: b hash ]
]

{ #category : 'accessing' }
IceMemoryCommit >> id [
	^ self mcCommit info id asString
]

{ #category : 'accessing' }
IceMemoryCommit >> mcCommit [
	^ mcCommit
]

{ #category : 'accessing' }
IceMemoryCommit >> mcCommit: aMCVersion [ 
	self assert: (aMCVersion isKindOf: MCVersion).
	self assert: (aMCVersion dependencies allSatisfy: [ :each |
		  each isKindOf: IceMCVersionInfo ]).
	mcCommit := aMCVersion
]

{ #category : 'merging' }
IceMemoryCommit >> mergeWith: anIceMemoryCommit [ 
	
	^ repository workingCopy mergeCommit: anIceMemoryCommit
]

{ #category : 'accessing' }
IceMemoryCommit >> packageNames [
	
	^ (mcCommit dependencies collect: [ :each | each package name ]) asArray
]

{ #category : 'API-project' }
IceMemoryCommit >> project [
	
	^ IceMemoryProject onRepository: self repository commitish: self
]

{ #category : 'API-properties' }
IceMemoryCommit >> properties [

	^ IceRepositoryProperties
		fromDictionary: Dictionary new
		commitish: self
]

{ #category : 'TOMOVE' }
IceMemoryCommit >> snapshotFor: package [

	^ (self repository mcVersionFor: (self versionFor: package)) snapshot
]

{ #category : 'accessing' }
IceMemoryCommit >> timeStamp [
	
	^ self mcCommit info timeStamp
]
