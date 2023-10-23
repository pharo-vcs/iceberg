Class {
	#name : 'IceGitRemote',
	#superclass : 'IceRemote',
	#category : 'Iceberg-Libgit-Core',
	#package : 'Iceberg-Libgit',
	#tag : 'Core'
}

{ #category : 'testing' }
IceGitRemote class >> canHandleUrl: aRepositoryUrl [
	^ self subclassResponsibility 
]

{ #category : 'testing' }
IceGitRemote class >> isAbstract [

	^ self == IceGitRemote
]

{ #category : 'testing' }
IceGitRemote class >> isValidUrl: aRepositoryUrl [
	^ self allSubclasses  
		anySatisfy: [ :subclass | subclass canHandleUrl: aRepositoryUrl ]
]

{ #category : 'instance creation' }
IceGitRemote class >> name: aName url: anUrl [
	^ (self url: anUrl)
		name: aName;
		yourself
]

{ #category : 'instance creation' }
IceGitRemote class >> url: aRepositoryUrl [
	self allSubclasses
		detect: [ :subclass | subclass canHandleUrl: aRepositoryUrl ]
		ifFound: [ :subclass | ^ subclass new url: aRepositoryUrl ]
		ifNone: [ IceWrongUrl signal: 'Remote repository scheme not supported: ', aRepositoryUrl ]
]

{ #category : 'comparing' }
IceGitRemote >> = another [
	^ self species = another species
		and: [ self referencesSameRemoteLocationAs: another ]
]

{ #category : 'branches' }
IceGitRemote >> branches [
	
	^ self localRepository remoteTrackedBranches select: [ :e | e remoteName = self name ]
]

{ #category : 'fetching' }
IceGitRemote >> doFetchWithRefSpec: refSpec [

	localRepository handleLibgitError: [
		[
		(LGitRemote of: self repositoryHandle named: self name)
			lookup;
			fetchWithCredentials:
				(IceCredentialsProvider defaultForRemote: self)
			andProgressCallback: IceGitTransferProgress new
			refSpec: refSpec
			proxyConfigurationBlock: [ :proxyOpt | Iceberg configureLGitProxyOpt: proxyOpt ] ]
			on: LGitAbstractError
			do: [ :e | e acceptError: (IceLibgitErrorVisitor onContext: self) ] ]
]

{ #category : 'fetching' }
IceGitRemote >> fetch [

	self doFetchWithRefSpec: nil.

	"Call post fetch to fix unknown commits"
	localRepository postFetch
]

{ #category : 'fetching' }
IceGitRemote >> fetchBranch: aBranch [

	| refSpec |
	refSpec := LGitRefSpec fromString:
		           ('{2}:refs/remotes/{1}/{2}' format: {
				            self name.
				            aBranch name }).

	self doFetchWithRefSpec: refSpec
]

{ #category : 'branches' }
IceGitRemote >> remoteBranchNamed: aString ifPresent: presentBlock ifAbsent: absentBlock [

	localRepository handleLibgitError: [
		| found |
		found := self repositoryHandle 
			lookupRemoteBranch: self name , '/' , aString 
			ifAbsent: [ nil ].
		^ found 
			ifNotNil: [ presentBlock value: (localRepository basicNewRemoteBranchNamed: found name) ]
			ifNil: absentBlock ]
]

{ #category : 'accessing' }
IceGitRemote >> repositoryHandle [

	<repositoryHandleAccessor>
	^ localRepository repositoryHandle
]
