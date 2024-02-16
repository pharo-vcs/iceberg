"
I am a cache providing access to several Ice objects, such as packages, repositories, working copies, etc.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : 'Iceberg',
	#superclass : 'Object',
	#classVars : [
		'EnableMetacelloIntegration',
		'ProxyURLExternalString',
		'RemoteTypeSelector',
		'ShowSystemRepositories'
	],
	#classInstVars : [
		'icebergAnnouncer'
	],
	#category : 'Iceberg-Core',
	#package : 'Iceberg',
	#tag : 'Core'
}

{ #category : 'accessing' }
Iceberg class >> announcer [
	^ icebergAnnouncer ifNil: [ icebergAnnouncer := IceAnnouncer new ]
]

{ #category : 'accessing' }
Iceberg class >> bootstrap [
	| metacelloRegistrationEntry |
	metacelloRegistrationEntry := MetacelloProjectRegistration registry baselineRegistry at: 'BaselineOfIceberg'.
	self
		bootstrapWithCommitId: metacelloRegistrationEntry currentVersionString
		packageList: (metacelloRegistrationEntry baselineProjectSpec version packages collect: #name)
]

{ #category : 'accessing' }
Iceberg class >> bootstrapWithCommitId: commitId packageList: packageNameList [

	| commit repository |
	repository := IceLibgitRepository new.
	commit := IceUnknownCommit new
		id: commitId;
		repository: repository;
 		yourself.
		
	repository name: 'iceberg'.
	repository workingCopy referenceCommit: commit.
	commit repository: repository.
	
	packageNameList do: [ :each |
		repository workingCopy basicAddPackage: (IcePackage
			named: each
			repository: repository) ].
	
	repository register
]

{ #category : 'proxy' }
Iceberg class >> configureLGitProxyOpt: aLGitProxyOptions [ 
	
	| proxyURL |
	proxyURL := self proxyURLExternalString.
	
	"If there is not configured proxy, let's return"
	proxyURL isNull ifTrue: [ ^ self ].
	
	aLGitProxyOptions prim_url: proxyURL
]

{ #category : 'proxy' }
Iceberg class >> createProxyURLExternalString [

	NetworkSystemSettings httpProxyServer isEmpty 
		ifTrue: [ ^ ProxyURLExternalString := ExternalAddress null ].
	
	ProxyURLExternalString := ExternalAddress fromString: self formatNetworkSettingsProxyServer. 
]

{ #category : 'settings' }
Iceberg class >> enableMetacelloIntegration [
	^ EnableMetacelloIntegration ifNil: [ EnableMetacelloIntegration := true ]
]

{ #category : 'settings' }
Iceberg class >> enableMetacelloIntegration: aBoolean [

	EnableMetacelloIntegration := aBoolean
]

{ #category : 'proxy' }
Iceberg class >> ensureProxyURLExternalString [


	"If we have a valid string in the external memory, we check its value"
	(ProxyURLExternalString isNotNil and: [ ProxyURLExternalString isNull not ]) ifTrue: [

		"If it is the same that we want, let's just continue. If it is different, we need to free it so, we can allocate a new one"
		ProxyURLExternalString utf8StringFromCString = self formatNetworkSettingsProxyServer
			ifTrue: [ ^ self ]
			ifFalse: [ ProxyURLExternalString free ] ].

	^ self createProxyURLExternalString
]

{ #category : 'proxy' }
Iceberg class >> formatNetworkSettingsProxyServer [

	^ String streamContents: [ :s |
		  s nextPutAll: 'https://'.
		  s nextPutAll: NetworkSystemSettings httpProxyServer.
		  s nextPutAll: ':'.
		  s nextPutAll: NetworkSystemSettings httpProxyPort printString ]
]

{ #category : 'accessing' }
Iceberg class >> icebergRepositoriesURLs [
	^ {
		'git@github.com:pharo-vcs/iceberg.git'. 
		'git@github.com:pharo-vcs/filetree.git'.
		'git@github.com:pharo-vcs/libgit2-pharo-bindings.git'
	}
]

{ #category : 'class initialization' }
Iceberg class >> initialize [
	self initializeSettings
]

{ #category : 'class initialization' }
Iceberg class >> initializeSettings [
	Smalltalk 
		at: #SystemSettingsPersistence 
		ifPresent: [ :class | | tree nodes | 
			tree := class default settingTree.
			nodes := tree deeplySelect: [ :node | node receiverPackage name beginsWith: 'Iceberg' ].
			class updateSettingNodes: nodes ]
]

{ #category : 'accessing' }
Iceberg class >> mcRepositoryFor: aLocationString [
	^ (IceMetacelloRepositoryType for: aLocationString) mcRepository 
]

{ #category : 'proxy' }
Iceberg class >> proxyURLExternalString [

	self ensureProxyURLExternalString.
	^ ProxyURLExternalString
]

{ #category : 'accessing' }
Iceberg class >> remoteTypeSelector [
	"Should be #scpURL or #httpsURL"
	^ RemoteTypeSelector ifNil: [ RemoteTypeSelector := #scpUrl ]
]

{ #category : 'accessing' }
Iceberg class >> remoteTypeSelector: anObject [
	RemoteTypeSelector := anObject
]

{ #category : 'accessing' }
Iceberg class >> repositoryForPackage: aPackage [

	| existingRepositories possibleRepositoryTypes |
	existingRepositories := aPackage mcWorkingCopy repositoryGroup repositories.
	possibleRepositoryTypes := IceRepository allSubclasses , { IceMetacelloRepositoryAdapter . MCGitHubRepository }.

	possibleRepositoryTypes do: [ :class |
		existingRepositories
			detect: [ :repo | repo isKindOf: class ]
			ifFound: [ :repo | ^ repo getOrCreateIcebergRepository ] ].

	self error: ('Could not find a git repository for {1}' format: { aPackage name })
]

{ #category : 'settings' }
Iceberg class >> settingsOn: aBuilder [
	<systemsettings>
	(aBuilder group: #Iceberg)
		parent: #SCM;
		with: [ (aBuilder setting: #enableMetacelloIntegration)
				target: self;
				order: 0.1;
				default: true;
				label: 'Enable Metacello integration';
				description: 'If selected, Metacello github:// repositories will be loaded using iceberg';
				with: [ 
					(aBuilder pickOne: #remoteTypeSelector)
						label: 'Remote type';
						description: 'When creating an Iceberg repository out of a github:// URL choose whether you want to user an SCP URL (i.e. with the form ''git@github.com:<username>/<project>.git'') or an HTTPS URL (i.e. with the form ''https://github.com/<username>/<project>.git''';
						domainValues:
							{('SCP (git@github.com:<username>/<project>.git)' -> #scpUrl).
							('HTTPS (https://github.com/<username>/<project>.git)' -> #httpsUrl).
							('HTTP (http://github.com/<username>/<project>.git)' -> #httpUrl)} ] ]
]

{ #category : 'settings' }
Iceberg class >> showSystemRepositories [
	^ ShowSystemRepositories ifNil: [ ShowSystemRepositories := false ]
]

{ #category : 'settings' }
Iceberg class >> showSystemRepositories: aBoolean [
	ShowSystemRepositories := aBoolean
]

{ #category : 'updating' }
Iceberg class >> update [
	#(Iceberg LGitRepository MCFileTreeGitRepository) do: [:className | 
		Smalltalk 
			at: className 
			ifPresent: [ :class | ( self class repositoryForPackage:class package) pull ] ]
]
