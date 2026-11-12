"
Adapter for allowing metacello to use Iceberg to download packages and versions.
"
Class {
	#name : 'IceMetacelloRepositoryAdapter',
	#superclass : 'Object',
	#instVars : [
		'repository',
		'projectVersion'
	],
	#category : 'Iceberg-Adapters',
	#package : 'Iceberg',
	#tag : 'Adapters'
}

{ #category : 'instance creation' }
IceMetacelloRepositoryAdapter class >> for: anIceRepository withVersion: aString [ 

	| projectVersion |
		
	projectVersion := aString isEmptyOrNil 
		ifTrue: [ anIceRepository head description ]
		ifFalse: [ aString ].

	^ self new 
		repository: anIceRepository;
		projectVersion: projectVersion;
		yourself
]

{ #category : 'comparing' }
IceMetacelloRepositoryAdapter >> = other [
	^ other species = self species 
		and: [ other description = self description ]
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> addTo: aMCRepositoryGroup [ 
	"Do nothing, we do not need to register the repository into the monticello registry"
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> baselineOf: aProjectName atVersion: aRefName [
	"The Monticello definitions of BaselineOf<aProjectName> at aRefName (a tag, a branch, a commit; see commitAt:), read from its commit: nothing is checked out or loaded. nil when that commit has no such package"

	| commit name |
	commit := self commitAt: aRefName.
	name := 'BaselineOf' , aProjectName.
	(commit includesPackageNamed: name) ifFalse: [ ^ nil ].
	^ (self repository mcVersionFor:
		   (IceSavedPackageVersion fromCommit: commit package: (IcePackage named: name repository: self repository) mcPackage)) snapshot
		  definitions
]

{ #category : 'testing' }
IceMetacelloRepositoryAdapter >> canUpgradeTo: anMCGitBasedRepository [ 
  (anMCGitBasedRepository isKindOf: self class) ifFalse: [ ^ false ].

  ^ self projectPath = anMCGitBasedRepository projectPath 
	and: [ self repoPath = anMCGitBasedRepository repoPath and: [ self projectVersion = anMCGitBasedRepository projectVersion ]]
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> commitAt: aRefName [
	"The commit aRefName names: a tag (v1.0.0), a local branch, a branch of the origin remote (master in a fresh clone), or a commit (3f2a91c). Signals NotFound when it names none"

	| notFound |
	self repository tags detect: [ :each | each name = aRefName ] ifFound: [ :tag | ^ tag commit ].
	notFound := [ NotFound signalFor: aRefName in: self repository ].
	^ self repository lookupCommit: aRefName ifAbsent: [
			  self repository remotes ifEmpty: [ ^ notFound value ].
			  self repository lookupCommit: self repository origin name , '/' , aRefName ifAbsent: notFound ]
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> description [
		
	^ self repository origin url, '[', projectVersion, ']'
]

{ #category : 'fetching' }
IceMetacelloRepositoryAdapter >> fetchPackageNamed: aString [
	"The fetch operation just makes sure we have the correct version in disk"

	self repository head description = projectVersion ifFalse: [
		(self repository commitishNamed: projectVersion)
			checkoutWithStrategy: IceCheckoutDoNotLoadPackages new ]
]

{ #category : 'initialization' }
IceMetacelloRepositoryAdapter >> flushForScriptGet [
	"do nothing"
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> getOrCreateIcebergRepository [

	^ self repository
]

{ #category : 'testing' }
IceMetacelloRepositoryAdapter >> hasNoLoadConflicts: anMCGitBasedRepository [
	"Copied from MCGitBasedNetworkRepository"
  	(anMCGitBasedRepository isKindOf: self class) ifFalse: [ ^ false ].

	^ self projectPath = anMCGitBasedRepository projectPath and: [
		self repoPath = anMCGitBasedRepository repoPath and: [ 
			self projectVersion = anMCGitBasedRepository projectVersion ] ]
]

{ #category : 'comparing' }
IceMetacelloRepositoryAdapter >> hash [
	"Not a good hash, but is copied from MCRepository"
	^ self description hash
]

{ #category : 'compatibility' }
IceMetacelloRepositoryAdapter >> isRemote [
	"User for Komitter"
	^ false
]

{ #category : 'testing' }
IceMetacelloRepositoryAdapter >> isValid [
	^ true
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> loadPackageNamed: aName intoLoader: aLoader [

	| package found |

	"We need to check if we have the correct version of the package"
	self fetchPackageNamed: aName.

	package := self repository workingCopy packageNamed: aName.
	found := package latestVersion mcVersion.
	aLoader addVersion: found.
	^ {
		  found.
		  self }
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> packageNamed: aName [

	^ self packageNamed: aName ifAbsent: [ NotFound signal: aName ]
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> packageNamed: aName ifAbsent: aBlock [

	^ self
		packageNamed: aName
		ifPresent: [ :found | found ]
		ifAbsent: aBlock
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> packageNamed: aName ifPresent: aBlock [

	^ self
		  packageNamed: aName
		  ifPresent: aBlock
		  ifAbsent: [ NotFound signal: aName ]
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> packageNamed: aName ifPresent: presentBlock ifAbsent: absentBlock [

	| package |
	self repository head description = projectVersion ifFalse: [
		(self repository commitishNamed: projectVersion)
			checkoutWithStrategy: IceCheckoutDoNotLoadPackages new ].

	package := self repository workingCopy
		           packageNamed: aName
		           ifAbsent: [ ^ absentBlock value ].
	^ presentBlock value: package latestVersion mcVersion
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> projectPath [
	^ self repository origin projectPath
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> projectVersion [
	^ projectVersion
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> projectVersion: anObject [
	projectVersion := anObject
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> repoPath [
	^ self repository subdirectory 
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> repository [

	^ repository
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> repository: anObject [
	repository := anObject
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> repositoryDescription [
	^ self repository description

]

{ #category : 'querying' }
IceMetacelloRepositoryAdapter >> repositoryVersionString [
	^ self repository workingCopy referenceCommit id
]

{ #category : 'compatibility' }
IceMetacelloRepositoryAdapter >> unregister [

	^ MCRepositoryGroup default removeRepository: self
]

{ #category : 'versions' }
IceMetacelloRepositoryAdapter >> versionFrom: aVersionName [ 
	| packageName package version |
	packageName := (MCFileTreeRepository parseName: aVersionName) first.
	package := self repository packageNamed: packageName.
	
	version := package latestVersion.
	version info name = aVersionName ifFalse: [
		version := package versions detect: [ :ver | ver info name = aVersionName ]].
	
	^ version mcVersion
	
	
	
	
]

{ #category : 'accessing' }
IceMetacelloRepositoryAdapter >> versions [
	"The versions of the project: my repository's tags, each answering name and date"

	^ self repository tags
]
