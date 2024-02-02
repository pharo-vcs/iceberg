Class {
	#name : 'IceMemoryRemote',
	#superclass : 'IceRemote',
	#instVars : [
		'remoteRepository',
		'branchRepository'
	],
	#category : 'Iceberg-Memory',
	#package : 'Iceberg-Memory'
}

{ #category : 'instance creation' }
IceMemoryRemote class >> name: aString remoteRepository: aRepository branchRepository: aMCBranchRepository [

	^ self new
		name: aString;
		remoteRepository: aRepository;
		branchRepository: aMCBranchRepository;
		yourself
]

{ #category : 'comparing' }
IceMemoryRemote >> = anIceMemoryRemote [ 
	
	^ self species = anIceMemoryRemote species
		and: [ self remoteRepository = anIceMemoryRemote remoteRepository ]
]

{ #category : 'accessing' }
IceMemoryRemote >> branchRepository: aMCDictionaryRepository [ 
	branchRepository := aMCDictionaryRepository
]

{ #category : 'branches' }
IceMemoryRemote >> branches [
	
	^ (self latestCommitsOf: branchRepository)
		collect: [ :latestVersion |
			(IceMemoryRemoteBranch new
				name: latestVersion package name;
				repository: localRepository;
				commit: (IceMemoryCommit new
					repository: localRepository;
					mcCommit: latestVersion;
					yourself);
				remote: self;
				yourself)						
			yourself ]
]

{ #category : 'fetching' }
IceMemoryRemote >> fetch [

	self fetchCommitsThat: [ :each | true ].
	
	"Call post fetch to fix unknown commits"
	localRepository postFetch.
]

{ #category : 'fetching' }
IceMemoryRemote >> fetchBranch: anIceMemoryRemoteBranch [ 
	
	self fetchCommitsThat: [ :each | each name = anIceMemoryRemoteBranch name ]
]

{ #category : 'fetching' }
IceMemoryRemote >> fetchCommitsThat: aBlock [

	"Really low level.
	Copy all files from the remote branch reposiory to the local remote tracked branches repository"
	| remoteBranchRepository remoteCodeRepository |
	remoteBranchRepository := self remoteRepository branchRepository.
	remoteCodeRepository := self remoteRepository codeRepository.
	remoteBranchRepository allVersionInfos
		select: aBlock
		thenDo: [ :aVersionInfo | | remoteBranchVersion |
			remoteBranchVersion := remoteBranchRepository versionWithInfo: aVersionInfo.
			self assert: remoteBranchVersion notNil.
			branchRepository
				versionWithInfo: aVersionInfo
				ifAbsent: [ branchRepository storeVersion: remoteBranchVersion ].
			
			remoteBranchVersion dependencies do: [ :dependencyInfo |
				localRepository codeRepository
					versionWithInfo: dependencyInfo
					ifAbsent: [ localRepository codeRepository storeVersion: (remoteCodeRepository versionWithInfo: dependencyInfo) ] ] ]
]

{ #category : 'private-commits' }
IceMemoryRemote >> latestCommitsOf: aMCDictionaryRepository [ 
	
	^ (aMCDictionaryRepository sortedVersionInfos
		groupedBy:[ :each | each name ])
			values collect: [ :versions | | versionInfo |
				versionInfo := (versions sorted: [ :a :b | a timeStamp > b timeStamp ]) first.
				aMCDictionaryRepository versionWithInfo: versionInfo ]
]

{ #category : 'private-commits' }
IceMemoryRemote >> latestMCVersionForBranchNamed: aName ifPresent: presentBlock ifAbsent: absentBlock [
	
	| latestVersionInfo latestVersion branchCommits |
	branchCommits := branchRepository sortedVersionInfos
		select: [ :each | each name = aName ].
	
	branchCommits ifEmpty: [ ^ absentBlock value ].
	
	latestVersionInfo := (branchCommits sorted: [ :a :b | a timeStamp > b timeStamp ]) first.
	latestVersion := branchRepository versionWithInfo: latestVersionInfo.

	presentBlock value: latestVersion
]

{ #category : 'printing' }
IceMemoryRemote >> printOn: aStream [

	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		print: remoteRepository;
		nextPutAll: ')'
]

{ #category : 'branches' }
IceMemoryRemote >> remoteBranchNamed: aName ifPresent: presentBlock ifAbsent: absentBlock [ 

	^ self
		latestMCVersionForBranchNamed: aName
		ifPresent: [ :latestVersion | 
			presentBlock value: (IceMemoryRemoteBranch new
				name: latestVersion package name;
				repository: localRepository;
				commit: (IceMemoryCommit new
					repository: localRepository;
					mcCommit: latestVersion;
					yourself);
				remote: self;
				yourself) ]
		ifAbsent: absentBlock
]

{ #category : 'accessing' }
IceMemoryRemote >> remoteRepository [
	^ remoteRepository
]

{ #category : 'accessing' }
IceMemoryRemote >> remoteRepository: aRepository [ 
	remoteRepository := aRepository
]
