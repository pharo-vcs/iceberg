Class {
	#name : #IcePharoPlugin,
	#superclass : #IcePlugin,
	#category : #'Iceberg-Plugin-Pharo-Core'
}

{ #category : #adding }
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
			BaselineOfSpec
			BaselineOfSpec2
			BaselineOfNewTools
			BaselineOfTraits
			BaselineOfUI    
			BaselineOfUnifiedFFI).

	self 
		addProjectNamed: 'pharo-spec2'
		commit: self spec2CommitHash
		baselines: #(BaselineOfSpec2).
		
	self 
		addProjectNamed: 'pharo-newtools'
		commit: self newtoolsCommitHash 
		baselines: #(BaselineOfNewTools)	
]

{ #category : #adding }
IcePharoPlugin class >> addProjectNamed: aName commit: aCommitId baselines: aCollection [
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
			yourself);
		yourself.

	repository workingCopy: workingCopy.
	
	(aCollection 
		flatCollect: [ :each | (Smalltalk globals at: each) allPackageNames copyWith: each ] 
		as: Set)
		do: [ :each | 
			repository workingCopy basicAddPackage: (IcePackage
				named: each
				repository: repository) ].

	repository register
]

{ #category : #testing }
IcePharoPlugin class >> isAvailableFor: aRepository [

	^ aRepository remotes anySatisfy: [ :each | each projectName = 'pharo' ]
]

{ #category : #'accessing commits' }
IcePharoPlugin class >> newtoolsCommitHash [

	^ 'bdda5b7923bb42d97c9733641cd50fa8f3507c9c'
]

{ #category : #'accessing commits' }
IcePharoPlugin class >> pharoCommitHash [

	^ SystemVersion current commitHash
]

{ #category : #'accessing commits' }
IcePharoPlugin class >> spec2CommitHash [

	^ '3afda41c3764bf7e05eaf990fef4ca87937cd113'
]

{ #category : #events }
IcePharoPlugin >> fetchIfNeeded: aRepository [

	(aRepository lookupCommit: SystemVersion current commitHash) isUnknownCommit
		ifFalse: [ ^ self ].

	UIManager default
		informUser: 'Fetching incoming commits'
		during: [ aRepository remotes
				detect: [ :each | each projectName = 'pharo-project' ]
				ifFound: [ :each | each fetch ] ]
]

{ #category : #events }
IcePharoPlugin >> repositoryWasCreated: aRepository [

]

{ #category : #events }
IcePharoPlugin >> repositoryWillBeCreated: aRepository [
	SystemVersion current major < 7 ifTrue: [ ^ self ].
	
	self fetchIfNeeded: aRepository.
	(aRepository lookupCommit: SystemVersion current commitHash) adopt.
]
