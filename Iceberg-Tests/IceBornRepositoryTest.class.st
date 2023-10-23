Class {
	#name : 'IceBornRepositoryTest',
	#superclass : 'IceAbstractTestCase',
	#category : 'Iceberg-Tests-Common',
	#package : 'Iceberg-Tests',
	#tag : 'Common'
}

{ #category : 'testing' }
IceBornRepositoryTest class >> isAbstract [

	^ self == IceBornRepositoryTest
]

{ #category : 'accessing' }
IceBornRepositoryTest >> expectedCommitsInNewBranch [
	
	"A git repository has just the initial commit"
	^ 1
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testAccessingNonExistingTagRaisesException [

	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	self should: [self repository tagNamed: 'nonExisting'] raise: IceTagNotFound
]

{ #category : 'tests-remotes' }
IceBornRepositoryTest >> testAddNewRemoteListsRemote [

	| remote |
	remote := self newRemoteNamed: 'origin'.
	self repository addRemote: remote.
	
	self assert: (self repository remotes includes: remote).
]

{ #category : 'tests-remotes' }
IceBornRepositoryTest >> testAddTwoRemotesWithSameNameRaiseError [

	| remote |
	remote := self newRemoteNamed: 'origin'.
	self repository addRemote: remote.
	
	remote := self newRemoteNamed: 'origin'.
	self should: [ self repository addRemote: remote ] raise: IceRemoteAlreadyExistsError
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testBranchAlreadyExistsErrorInformsExistingBranchName [
	
	| branchName |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	branchName := 'master'.
	[ self repository createBranch: branchName.
	  self fail ]
		on: IceBranchAlreadyExists
	 	do: [ :error | self assert: error branchName equals: branchName ]
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testBranchNotFoundErrorInformsNotFoundBranchName [

	| branchName |
	branchName := 'nonexisting'.
	[ self repository switchToBranchNamed: branchName.
	  self fail ]
		on: IceBranchNotFound
	 	do: [ :error | self assert: error branchName equals: branchName ]
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testBranchWithSlashesNotFoundErrorInformsNotFoundBranchName [

	| branchName |
	branchName := 'feature/nonexisting'.
	[ self repository switchToBranchNamed: branchName.
	  self fail ]
		on: IceBranchNotFound
	 	do: [ :error | self assert: error branchName equals: branchName ]
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testCreateExistingBranchRaisesError [

	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	self should: [self repository createBranch: 'master'] raise: IceBranchAlreadyExists
]

{ #category : 'tests-tags' }
IceBornRepositoryTest >> testCreateExistingTagRaisesError [

	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	self repository createTag: 'v1.0'.
	self should: [self repository createTag: 'v1.0'] raise: IceTagAlreadyExists
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testCreateNewBranchSwitchesToBranch [

	| createdBranch |
	createdBranch := self repository createBranch: 'new'.
	self assert: self repository head equals: createdBranch
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testCreateNewBranchWithSlashesSwitchesToBranch [

	| createdBranch |
	createdBranch := self repository createBranch: 'feature/new'.
	self assert: self repository head equals: createdBranch
]

{ #category : 'tests-remotes' }
IceBornRepositoryTest >> testDeleteRepositoryDeletesLocation [

	"Test valid only for git backend. Other backends may not have location"
	fixture isGit ifFalse: [ ^ self skip ].
	
	self assert: self repository location exists.

	self repository delete.
	self deny: self repository location exists.
]

{ #category : 'tests-tags' }
IceBornRepositoryTest >> testDeleteTagDoesNotListListsDeletedTag [

	| tagName |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	tagName := 'new'.
	self repository createTag: tagName.
	
	(self repository tagNamed: tagName) delete.
	self assert: self repository tags isEmpty
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testListBranchesListsExistingBranches [

	| branches |
	branches := self repository allBranches.
	self assert: branches size equals: 1.
	self assert: branches first name equals: 'master'
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testListBranchesListsNewBranch [

	| branches branchName |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	branchName := 'new'.
	self repository createBranch: branchName.
	branches := self repository allBranches.
	
	self assert: branches size equals: 2.
	branches
		detect: [ :branch | branch name = branchName ]
		ifNone: [ self fail ]
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testListBranchesListsNewBranchWithSlashes [

	| branches branchName |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	branchName := 'feature/new'.
	self repository createBranch: branchName.
	branches := self repository allBranches.
	
	self assert: branches size equals: 2.
	branches
		detect: [ :branch | branch name = branchName ]
		ifNone: [ self fail ]
]

{ #category : 'tests-tags' }
IceBornRepositoryTest >> testListTagsListsNewTag [

	| tags tagName |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	tagName := 'new'.
	self repository createTag: tagName.
	tags := self repository tags.
	
	self assert: tags size equals: 1.
	tags
		detect: [ :branch | branch name = tagName ]
		ifNone: [ self fail ]
]

{ #category : 'tests-tags' }
IceBornRepositoryTest >> testListTagsOfACommitWithNoTagsReturnsEmptyCollection [

	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	self assert: self repository headCommit tags isEmpty
]

{ #category : 'tests-tags' }
IceBornRepositoryTest >> testListTagsOfACommitWithTagsReturnsTagCollection [

	self repository head isUnbornBranch ifTrue: [ ^ self skip ].

	self repository headCommit createTag: 'test'.
	self assert: self repository headCommit tags first name equals: 'test'
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testNewBranchReferencesCurrentCommitAtBranchTime [

	| commitAtBranchTime createdBranch |
	commitAtBranchTime := self repository head commit.
	createdBranch := self repository createBranch: 'new'.
	self assert: createdBranch commit equals: commitAtBranchTime
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testNewBranchWithSlashReferencesCurrentCommitAtBranchTime [

	| commitAtBranchTime createdBranch |
	commitAtBranchTime := self repository head commit.
	createdBranch := self repository createBranch: 'feature/new'.
	self assert: createdBranch commit equals: commitAtBranchTime
]

{ #category : 'tests-remotes' }
IceBornRepositoryTest >> testNewRepositoryHasNoRemotes [

	self assert: self repository remotes isEmpty
]

{ #category : 'tests-remotes' }
IceBornRepositoryTest >> testRemoteAlreadyExistsErrorReferencesExistingRemote [

	| remote remoteName |
	remoteName := 'origin'.
	remote := self newRemoteNamed: remoteName.
	self repository addRemote: remote.
	
	remote := self newRemoteNamed: remoteName.
	[ self repository addRemote: remote.
	self fail ]
		on: IceRemoteAlreadyExistsError
		do: [ :error | self assert: error remoteName equals: remoteName ]
]

{ #category : 'tests-project' }
IceBornRepositoryTest >> testRepositoryHasProjectFile [

	fixture factory isGit ifFalse: [ ^ self skip ].
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	self assert: (self repository location / '.project') exists
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testSwitchToExistingBranchNameChangesRepositoryHead [

	| branchName newBranch masterBranch |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	branchName := 'new'.
	newBranch := self repository createBranch: branchName.
	self assert: newBranch equals: self repository head.
	
	masterBranch := self repository switchToBranchNamed: 'master'.
	self assert: masterBranch equals: self repository head.
	
	newBranch switch.
	self assert: newBranch equals: self repository head.
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testSwitchToExistingBranchNameWithSlashesChangesRepositoryHead [

	| branchName newBranch masterBranch |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	branchName := 'feature/new'.
	newBranch := self repository createBranch: branchName.
	self assert: newBranch equals: self repository head.
	
	masterBranch := self repository switchToBranchNamed: 'master'.
	self assert: masterBranch equals: self repository head.
	
	newBranch switch.
	self assert: newBranch equals: self repository head.
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testSwitchToUnexistingBranchRaisesError [

	self should: [self repository switchToBranchNamed: 'nonexisting'] raise: IceBranchNotFound
]

{ #category : 'tests-branch' }
IceBornRepositoryTest >> testSwitchToUnexistingBranchWithSlashesRaisesError [

	self should: [self repository switchToBranchNamed: 'feature/nonexisting'] raise: IceBranchNotFound
]

{ #category : 'tests-tags' }
IceBornRepositoryTest >> testTagAlreadyExistsErrorInformsExistingTagName [
	
	| tagName |
	self repository head isUnbornBranch ifTrue: [ ^ self skip ].
	
	tagName := 'someTag'.
	self repository createTag: tagName.
	[ self repository createTag: tagName.
	  self fail ]
		on: IceTagAlreadyExists
	 	do: [ :error | self assert: error tagName equals: tagName ]
]
