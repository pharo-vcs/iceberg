Class {
	#name : 'IceMemoryRepository',
	#superclass : 'IceRepository',
	#instVars : [
		'branchRepository',
		'codeRepository',
		'head',
		'remotes',
		'remoteBranchRepository',
		'tagDictionary'
	],
	#category : 'Iceberg-Memory',
	#package : 'Iceberg-Memory'
}

{ #category : 'examples' }
IceMemoryRepository class >> exampleDetachedHead [

	| repository |
	repository := self exampleWithNoChanges.
	repository head commit checkout.
	self assert: repository head isDetached.
	^ repository
]

{ #category : 'examples' }
IceMemoryRepository class >> exampleDetachedWorkingCopy [

	| repository |
	repository := self exampleNotLoaded.
	repository workingCopy addPackageNamed: 'AnotherNonExistentPackage'.
	repository commitWithMessage: 'a second commit'.
	repository head commit ancestors anyOne checkout.
	self assert: repository workingCopy isDetached.
	^ repository
]

{ #category : 'examples' }
IceMemoryRepository class >> exampleNotLoaded [

	| repository |
	repository := self exampleUnbornRepository.
	repository workingCopy addPackageNamed: 'NewPackageInMemory'.
	repository commitWithMessage: 'first commit'.
	repository unload.
	self assert: repository workingCopy isLoaded not.
	^ repository
]

{ #category : 'examples' }
IceMemoryRepository class >> exampleUnbornRepository [

	| repository |
	repository := IceMemoryRepository new.
	self assert: repository branch isUnbornBranch.
	^ repository
]

{ #category : 'examples' }
IceMemoryRepository class >> exampleWithChanges [

	| repository anotherPackageName |
	anotherPackageName := 'AnotherNonExistentPackage' asSymbol.
	repository := self exampleWithNoChanges.
	repository workingCopy addPackageNamed: anotherPackageName.
	(Object << 'IceGeneratedClassForUI' package: anotherPackageName) install.
	self assert: repository isModified.
	^ repository
]

{ #category : 'examples' }
IceMemoryRepository class >> exampleWithNoChanges [

	| repository |
	repository := self exampleNotLoaded.
	repository checkout.
	self assert: repository isModified not.
	^ repository
]

{ #category : 'instance creation' }
IceMemoryRepository class >> new [

	| newRepository |
	newRepository := super new.
	newRepository
		initializeWithBranchRepository: MCDictionaryRepository new
		initializeWithCodeRepository: MCDictionaryRepository new.
	^ newRepository
]

{ #category : 'branches' }
IceMemoryRepository >> allBranches [
	
	^ self latestMCCommits collect: [ :latestVersion |
			(IceMemoryLocalBranch new
				name: latestVersion package name;
				repository: self;
				commit: (IceMemoryCommit new
					repository: self;
					mcCommit: latestVersion;
					yourself);
				yourself)						
			yourself ]
]

{ #category : 'accessing' }
IceMemoryRepository >> branch [
	
	head validateIsBranch.
	^ head
]

{ #category : 'branches' }
IceMemoryRepository >> branchNamed: aName ifPresent: presentBlock ifAbsent: absentBlock [
	
	^ self
		latestMCVersionForBranchNamed: aName
		ifPresent:  [ :latestVersion | 
			^ IceMemoryLocalBranch new
				name: latestVersion package name;
				repository: self;
				commit: (IceMemoryCommit new
					repository: self;
					mcCommit: latestVersion;
					yourself);
				yourself ]
		ifAbsent: absentBlock
		inBranchMCRepository: branchRepository
]

{ #category : 'private-accessing' }
IceMemoryRepository >> branchRepository [
	^ branchRepository
]

{ #category : 'API-registry' }
IceMemoryRepository >> checkForRegistryConflicts [

	"Nothing. I never create registry conflicts"
]

{ #category : 'private-accessing' }
IceMemoryRepository >> codeRepository [
	^ codeRepository
]

{ #category : 'private-commits' }
IceMemoryRepository >> commitPackage: aMCPackage author: aString ancestors: ancestors dependencies: dependencies inInternalRepository: aRepository [ 
	
	^ self
		commitPackage: aMCPackage
		author: aString
		message: ''
		ancestors: ancestors
		dependencies: dependencies
		inInternalRepository: aRepository
]

{ #category : 'private-commits' }
IceMemoryRepository >> commitPackage: aMCPackage author: authorString message: messageString ancestors: ancestors dependencies: dependencies inInternalRepository: aRepository [ 
	
	| newCommit |
	newCommit := MCVersion new
		setPackage: aMCPackage
		info: (MCVersionInfo
			name: aMCPackage name
			id: UUID new
			message: messageString
			date: Date today
			time: Time now
			ancestors: ancestors)
		snapshot: aMCPackage snapshot
		dependencies: dependencies.
	aRepository storeVersion: newCommit.
	^ newCommit
]

{ #category : 'TOMOVE' }
IceMemoryRepository >> computeLoadedVersionOf: anIceSavedPackage [ 
	^ IceSavedPackageVersion
		fromCommit: head commit
		package: anIceSavedPackage
]

{ #category : 'branches' }
IceMemoryRepository >> createBranch: branchName inCommit: aCommit [

	| newBranchCommit iceCommit |

	(self head isUnbornBranch and: [ aCommit isNoCommit ])
		ifTrue: [ ^ head := IceMemoryUnbornBranch inRepository: self named: branchName ].

	(self hasBranchNamed: branchName)
		ifTrue: [ IceBranchAlreadyExists new
			branchName: branchName;
			signal ].
	
	newBranchCommit := self
		commitPackage: (MCPackage named: branchName)
		author: 'Branch created'
		message: branchName
		ancestors: #()
		dependencies: aCommit mcCommit dependencies
		inInternalRepository: branchRepository.
		
	"We create an ice commit. This is the commit that is visible in the model"
	iceCommit := IceMemoryCommit new.
	iceCommit repository: self.
	iceCommit mcCommit: newBranchCommit.
	
	^ (self newBranchNamed: branchName commit: iceCommit)
		switch;
		yourself
]

{ #category : 'testing' }
IceMemoryRepository >> hasBranchNamed: aString [ 
	
	"This could be optimized at the cost of complicating a bit the code.
	It is not worth it yet."
	
	[ self branchNamed: aString. ^ true ] on: IceBranchNotFound do: [ ^ false ]
]

{ #category : 'API-tags' }
IceMemoryRepository >> hasTagNamed: aString [ 
	
	^ tagDictionary includesKey: aString
]

{ #category : 'accessing' }
IceMemoryRepository >> head [

	^ head
]

{ #category : 'initialization' }
IceMemoryRepository >> initialize [

	super initialize.
	tagDictionary := Dictionary new.
	remotes := Dictionary new
]

{ #category : 'private-initialize-release' }
IceMemoryRepository >> initializeWithBranchRepository: aRepository initializeWithCodeRepository: anotherRepository [

	branchRepository := aRepository.
	codeRepository := anotherRepository.
	self setHead: (IceMemoryUnbornBranch inRepository: self named: 'master').
]

{ #category : 'private-monticello' }
IceMemoryRepository >> internalStoreVersion: aMCVersion [ 
	
	codeRepository storeVersion: aMCVersion
]

{ #category : 'TOMOVE' }
IceMemoryRepository >> isPackageExported: anIceSavedPackage [ 
	
	^ head commit packageNames includes: anIceSavedPackage packageName
]

{ #category : 'private-commits' }
IceMemoryRepository >> latestCommitsOf: aRepository [ 

	^ (aRepository sortedVersionInfos
		groupedBy:[ :each | each name ])
			values collect: [ :versions | | versionInfo |
				versionInfo := (versions sorted: [ :a :b | a timeStamp > b timeStamp ]) first.
				aRepository versionWithInfo: versionInfo ]
]

{ #category : 'private-commits' }
IceMemoryRepository >> latestMCCommits [
	
	^ (branchRepository sortedVersionInfos
		groupedBy:[ :each | each name ])
			values collect: [ :versions | | versionInfo |
				versionInfo := (versions sorted: [ :a :b | a timeStamp > b timeStamp ]) first.
				branchRepository versionWithInfo: versionInfo ]
]

{ #category : 'branches' }
IceMemoryRepository >> latestMCVersionForBranchNamed: aName ifPresent: presentBlock ifAbsent: absentBlock inBranchMCRepository: aBranchMCRepository [
	
	| latestVersionInfo latestVersion branchCommits |
	branchCommits := aBranchMCRepository sortedVersionInfos
		select: [ :each | each name = aName ].
	
	branchCommits ifEmpty: [ ^ absentBlock value ].
	
	latestVersionInfo := (branchCommits sorted: [ :a :b | a timeStamp > b timeStamp ]) first.
	latestVersion := aBranchMCRepository versionWithInfo: latestVersionInfo.

	presentBlock value: latestVersion
]

{ #category : 'branches' }
IceMemoryRepository >> localBranches [
	
	^ (self latestCommitsOf: branchRepository) collect: [ :latestVersion |
			(IceMemoryLocalBranch new
				name: latestVersion package name;
				repository: self;
				commit: (IceMemoryCommit new
					repository: self;
					mcCommit: latestVersion;
					yourself);
				yourself)						
			yourself ]
]

{ #category : 'TOMOVE' }
IceMemoryRepository >> mcVersionFor: iceVersion [

	| branchCommit dependencyCommitInfo |
	"The ice version knows the branch version.
	We lookup the branch commit that knows the specific package versions.
	We then ask the branch commit for the package version for the corresponding version"
	branchCommit := branchRepository versionWithInfo: (MCVersionInfo new
		instVarNamed: 'id'
		put: (UUID fromString: iceVersion commit id asString);
		yourself).
	dependencyCommitInfo := branchCommit dependencies detect: [ :each |
		each package name = iceVersion packageName ].
	^ codeRepository versionWithInfo: dependencyCommitInfo
]

{ #category : 'branches' }
IceMemoryRepository >> newBranchNamed: aString commit: aCommit [

	^ IceMemoryLocalBranch new
		name: aString;
		commit: aCommit;
		repository: self;
		yourself
]

{ #category : 'commits' }
IceMemoryRepository >> newCommitWalk [
	
	^ IceMemoryCommitWalk forRepository: self
]

{ #category : 'private-changes' }
IceMemoryRepository >> newIndex [
	
	^ IceMemoryIndex on: self
]

{ #category : 'API-commits' }
IceMemoryRepository >> newNoCommit [
	
	^ IceMemoryNoCommit repository: self
]

{ #category : 'API-project' }
IceMemoryRepository >> newProjectFromCommit: aCommit [ 
	
	^ IceMemoryProject onRepository: self
]

{ #category : 'API-project' }
IceMemoryRepository >> newUnbornProject [
	
	^ IceMemoryProject onRepository: self commitish: workingCopy referenceCommit
]

{ #category : 'accessing' }
IceMemoryRepository >> origin [
	
	^ self remoteNamed: 'origin'
]

{ #category : 'private-tags' }
IceMemoryRepository >> peelTag: anIceTag [ 
	
	^ tagDictionary at: anIceTag name
]

{ #category : 'printing' }
IceMemoryRepository >> printOn: aStream [
	aStream
		nextPutAll: 'an';
		nextPutAll: self class name
]

{ #category : 'remotes' }
IceMemoryRepository >> remoteAt: aString put: aRemote [

	remotes at: aString put: aRemote
]

{ #category : 'remote-branches' }
IceMemoryRepository >> remoteBranchNamed: aName ifPresent: presentBlock ifAbsent: absentBlock [ 

	^ self
		latestMCVersionForBranchNamed: aName
		ifPresent: [ :latestVersion | 
			^ IceMemoryRemoteBranch new
				name: latestVersion package name;
				repository: self;
				commit: (IceMemoryCommit new
					repository: self;
					mcCommit: latestVersion;
					yourself);
				yourself ]
		ifAbsent: absentBlock
		inBranchMCRepository: remoteBranchRepository
]

{ #category : 'private-accessing' }
IceMemoryRepository >> remoteBranchRepository [

	^ remoteBranchRepository
]

{ #category : 'initialize-release' }
IceMemoryRepository >> remoteBranchRepository: aMCRepository [

	remoteBranchRepository := aMCRepository
]

{ #category : 'remotes' }
IceMemoryRepository >> remoteNamed: aString ifAbsent: aBlockClosure [ 
	
	^ remotes at: aString ifAbsent: aBlockClosure
]

{ #category : 'remote-branches' }
IceMemoryRepository >> remoteTrackedBranches [

	^ remotes flatCollect: [ :each | each branches ]
]

{ #category : 'accessing' }
IceMemoryRepository >> remotes [
	
	^ remotes values
]

{ #category : 'API-tags' }
IceMemoryRepository >> removeTag: aTag [
	
	tagDictionary removeKey: aTag name
]

{ #category : 'private-head' }
IceMemoryRepository >> setHead: aCommitish [

	head := aCommitish
]

{ #category : 'accessing' }
IceMemoryRepository >> subdirectory [
	"Required for compatibility with some diff utilities that expect a tree"
	^ ''
]

{ #category : 'API-accessing' }
IceMemoryRepository >> subdirectoryPath [
	
	^ RelativePath new
]

{ #category : 'branches' }
IceMemoryRepository >> switchToBranchNamed: aString onCommit: aCommit [ 
	
	head := self newBranchNamed: aString commit: aCommit
]

{ #category : 'API-tags' }
IceMemoryRepository >> tags [
	
	^ tagDictionary keys collect: [ :k | IceTag named: k inRepository: self ]
]

{ #category : 'private-tags' }
IceMemoryRepository >> tagsAt: aString put: anIceMemoryCommit [ 
	
	tagDictionary at: aString put: anIceMemoryCommit
]
