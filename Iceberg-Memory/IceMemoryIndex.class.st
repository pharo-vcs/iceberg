Class {
	#name : 'IceMemoryIndex',
	#superclass : 'IceIndex',
	#instVars : [
		'modifiedVersions'
	],
	#category : 'Iceberg-Memory',
	#package : 'Iceberg-Memory'
}

{ #category : 'instance creation' }
IceMemoryIndex class >> on: anIceMemoryRepository [ 
	
	^ self new
		repository: anIceMemoryRepository;
		yourself
]

{ #category : 'adding' }
IceMemoryIndex >> addPackage: anIcePackageDefinition [ 
	
	"Nothing, the package should be already added"
]

{ #category : 'API - committing' }
IceMemoryIndex >> commitWithMessage: message andParents: parentCommits [

	| newCommit versionInfos packageNames iceCommit head headCommit |
	head := repository head.
	headCommit := repository headCommit.

	packageNames := headCommit packageNames asSet union: (modifiedVersions collect: [ :version | version package name ]).
	versionInfos := packageNames collect: [ :packageName |
		(modifiedVersions collect: #info)
			detect: [ :versionInfo | versionInfo package name = packageName ]
			ifNone: [ headCommit mcCommit dependencies detect: [ :mcVersionInfo | mcVersionInfo package name = packageName ] ] ].

	newCommit := repository
		commitPackage: (MCPackage named: head name)
		author: 'Lala?'
		message: message
		ancestors: (parentCommits collect: [:each | each mcCommit info ])
		dependencies: versionInfos
		inInternalRepository: repository branchRepository.
		
	parentCommits do: [ :each | 
		(repository branchRepository versionWithInfo: each mcCommit info)
			ifNil: [ repository branchRepository storeVersion: each mcCommit ] ].
		
	"We create an ice commit. This is the commit that is visible in the model"
	iceCommit := IceMemoryCommit new.
	iceCommit repository: repository.
	iceCommit mcCommit: newCommit.
	
	head isUnbornBranch ifTrue: [
		repository switchToBranchNamed: head name onCommit: iceCommit.
	] ifFalse: [
		head commit: iceCommit.
	].	
	^ iceCommit

]

{ #category : 'initialization' }
IceMemoryIndex >> initialize [

	super initialize.
	modifiedVersions := Set new
]

{ #category : 'testing' }
IceMemoryIndex >> isEmpty [
	
	^ modifiedVersions isEmpty
]

{ #category : 'accessing' }
IceMemoryIndex >> modifiedVersions [
	
	^ modifiedVersions
]

{ #category : 'storing' }
IceMemoryIndex >> storeMCVersion: aMCVersion [ 
	
	repository internalStoreVersion: aMCVersion.
	modifiedVersions add: aMCVersion.
]

{ #category : 'storing' }
IceMemoryIndex >> storeVersion: aMCVersion [ 
	
	self storeMCVersion: aMCVersion
]

{ #category : 'updating' }
IceMemoryIndex >> updateDiskWorkingCopy: anIceDiff [ 
	
	anIceDiff tree
		accept:
			(IceGitWorkingCopyUpdateVisitor new
				repository: repository;
				index: self;
				diff: anIceDiff)
]

{ #category : 'updating' }
IceMemoryIndex >> updateProject: anIceUnbornProject [ 
	
	"Nothing for now"
]
