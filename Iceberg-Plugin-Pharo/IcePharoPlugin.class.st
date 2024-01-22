Class {
	#name : 'IcePharoPlugin',
	#superclass : 'IcePlugin',
	#category : 'Iceberg-Plugin-Pharo-Core',
	#package : 'Iceberg-Plugin-Pharo',
	#tag : 'Core'
}

{ #category : 'adding' }
IcePharoPlugin class >> addIcebergProjectToIceberg [

	self
		addProjectNamed: 'iceberg'
		commit: self icebergCommitHash
		baselines: #( BaselineOfIceberg ).

	self
		addProjectNamed: 'libgit2-pharo-bindings'
		commit: self libgitCommitHash
		baselines: #( BaselineOfLibGit ).		
	
	self
		addProjectNamed: 'tonel'
		commit: self tonelCommitHash
		baselines: #( BaselineOfTonel ).		

]

{ #category : 'adding' }
IcePharoPlugin class >> addPharoProjectToIceberg [
	"It will take all packages corresponding to Pharo project and it will create an iceberg 
	 project with it"

	self 
		addProjectNamed: 'pharo' 
		commit: self pharoCommitHash 
		baselines: #(
			BaselineOfAthens
			BaselineOfBasicTools
			BaselineOfDisplay
			BaselineOfFlashback
			BaselineOfIDE
			BaselineOfMonticello
			BaselineOfMenuRegistration
			BaselineOfMetacello
			BaselineOfMorphic
			BaselineOfMorphicCore 
			BaselineOfPharo
			BaselineOfPharoBootstrap
			BaselineOfSUnit
			BaselineOfShift 
			BaselineOfSpec2
			BaselineOfNewTools
			BaselineOfTraits
			BaselineOfUI    
			BaselineOfUnifiedFFI).
]

{ #category : 'adding' }
IcePharoPlugin class >> addProjectNamed: aName commit: aCommitId baselines: aCollection [

	self
		addProjectNamed: aName
		commit: aCommitId
		baselines: aCollection
		tags: #(#system)
]

{ #category : 'adding' }
IcePharoPlugin class >> addProjectNamed: aName commit: aCommitId baselines: aCollection tags: tagArray [

	| repository commit workingCopy |
	repository := IceLibgitRepository new
		              name: aName;
		              yourself.

	commit := IceUnknownCommit new
		          repository: repository;
		          id: aCommitId;
		          yourself.

	workingCopy := IceWorkingCopy basicNew
		               repository: repository;
		               initialize;
		               referenceCommit: commit;
		               project: ((IceBasicProject onRepository: repository)
				                sourceDirectory: 'src';
				                tags: tagArray;
				                yourself);
		               yourself.

	repository workingCopy: workingCopy.

	(aCollection
		 flatCollect: [ :each |
		 (Smalltalk globals at: each) allPackageNames copyWith: each ]
		 as: Set) do: [ :each |
		workingCopy basicAddPackage:
			(IcePackage named: each workingCopy: workingCopy) ].

	repository register
]

{ #category : 'accessing - commits' }
IcePharoPlugin class >> commitOfExternalProject: aName [
	| externalProject tags branch |
	
	externalProject := (Smalltalk classNamed: #BaselineOfPharo) externalProjectNamed: aName.
	
	"First try to get a tah with the version (this should be the regular case)"
	tags := IceGitHubAPI new 
		getTagsOwner: externalProject owner 
		project: externalProject project.
	tags do: [ :each | 
		((each at: #name) = externalProject version) 
			ifTrue: [ ^ each at: #commit at: #sha ] ].
	
	"If that fails, it has to be a branch so get the branch last commit"
	branch := IceGitHubAPI new 
		getBranch: externalProject owner 
		project: externalProject project
		name: externalProject version.
		
	^ branch at: #commit at: #sha
]

{ #category : 'accessing - commits' }
IcePharoPlugin class >> getCommitishOfProject: projectName owner: owner repository: repository [

	| shortHash |

	"We need to get the short hash from Metacello"
	shortHash := (MetacelloProjectRegistration registry registrations 
		              detect: [ :e | e projectName = projectName ])
		             versionInfo versionString.

	"We need to get the full hash from github api"

	^ (IceGitHubAPI new
		   getCommit: shortHash
		   owner: owner
		   project: repository) at: #sha
]

{ #category : 'accessing - commits' }
IcePharoPlugin class >> icebergCommitHash [

	^ self
		  getCommitishOfProject: 'Iceberg'
		  owner: 'pharo-vcs'
		  repository: 'iceberg'
]

{ #category : 'testing' }
IcePharoPlugin class >> isAvailableFor: aRepository [

	^ aRepository remotes anySatisfy: [ :each | each projectName = 'pharo' ]
]

{ #category : 'accessing - commits' }
IcePharoPlugin class >> libgitCommitHash [

	^ self
		  getCommitishOfProject: 'LibGit'
		  owner: 'pharo-vcs'
		  repository: 'libgit2-pharo-bindings'
]

{ #category : 'accessing - commits' }
IcePharoPlugin class >> pharoCommitHash [

	^ SystemVersion current commitHash
]

{ #category : 'accessing - commits' }
IcePharoPlugin class >> tonelCommitHash [

	^ self
		  getCommitishOfProject: 'Tonel'
		  owner: 'pharo-vcs'
		  repository: 'tonel'
]

{ #category : 'events' }
IcePharoPlugin >> fetchIfNeeded: aRepository [

	(aRepository lookupCommit: SystemVersion current commitHash) isUnknownCommit
		ifFalse: [ ^ self ].

	UIManager default
		informUser: 'Fetching incoming commits'
		during: [ aRepository remotes
				detect: [ :each | each projectName = 'pharo-project' ]
				ifFound: [ :each | each fetch ] ]
]

{ #category : 'events' }
IcePharoPlugin >> repositoryWillBeCreated: aRepository [
	
	"this is just supported on Pharo 8+"
	SystemVersion current major < 7 ifTrue: [ ^ self ].
	
	self fetchIfNeeded: aRepository.
	(aRepository lookupCommit: SystemVersion current commitHash) adopt.
]
