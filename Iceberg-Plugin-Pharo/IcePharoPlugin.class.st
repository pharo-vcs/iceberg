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
		commit: SystemVersion current commitHash 
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
		baselines: #(BaselineOfSpec2).
		
	self 
		addProjectNamed: 'pharo-newtools' 
		baselines: #(BaselineOfNewTools)	
]

{ #category : #adding }
IcePharoPlugin class >> addProjectNamed: aName baselines: aCollection [

	^ self 
		addProjectNamed: aName 
		commit: nil
		baselines: aCollection
]

{ #category : #adding }
IcePharoPlugin class >> addProjectNamed: aName commit: aCommitId baselines: aCollection [
	| repository commit workingCopy |

	repository := IceLibgitRepository new 
		name: aName;
		yourself.
	
	commit := aCommitId 
		ifNotNil: [ 
			IceUnknownCommit new 
				id: aCommitId;
	 			yourself ]
		ifNil: [ 
			IceNoCommit new ].
		
	workingCopy := IceWorkingCopy basicNew
		repository: repository;
		initialize;
		referenceCommit: commit;
		project: ((IceBasicProject onRepository: repository)
			sourceDirectory: 'src';
			yourself);
		yourself.

	repository workingCopy: workingCopy.
	commit repository: repository.
	
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
