"
I'm a model for IceRepository entries.
"
Class {
	#name : 'IceTipRepositoryModel',
	#superclass : 'IceTipEntityModel',
	#traits : 'TIceCopyCommitId + TWithBranchModel',
	#classTraits : 'TIceCopyCommitId classTrait + TWithBranchModel classTrait',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipRepositoryModel class >> unknownBranchLabel [
	^ 'Unknown'
]

{ #category : 'comparing' }
IceTipRepositoryModel >> = other [

	^ self species = other species
		and: [ self entity = other entity ]
]

{ #category : 'accessing' }
IceTipRepositoryModel >> allBranchModels [

	^ self entity allBranches collect: [ :each |
		  IceTipBranchModel repositoryModel: self on: each ]
]

{ #category : 'accessing' }
IceTipRepositoryModel >> availableRepairOptions [
	
	^ IceTipRepairAction allAvailableFor: self entity
]

{ #category : 'accessing' }
IceTipRepositoryModel >> branchModel [

	^ IceTipBranchModel repositoryModel: self on: self entity branch
]

{ #category : 'accessing' }
IceTipRepositoryModel >> branchModelFor: aBranch [

	^ IceTipBranchModel repositoryModel: self on: aBranch
]

{ #category : 'accessing' }
IceTipRepositoryModel >> branchName [
	
	(self isLibGitAvailable not or: [ self entity isMissing ]) 
		ifTrue: [ ^ self class unknownBranchLabel ].
	
	^ self entity head description
]

{ #category : 'accessing' }
IceTipRepositoryModel >> branchNamed: aString [

	^ self entity branchNamed: aString
]

{ #category : 'accessing' }
IceTipRepositoryModel >> branches [
	^ self entity localBranches
]

{ #category : 'checking' }
IceTipRepositoryModel >> checkMissing [
	
	self isMissing ifTrue: [ 
		IceError signal: ('You have no repository attached to project "{1}"' format: { self name }) ]
]

{ #category : 'accessing' }
IceTipRepositoryModel >> commit [
	
	^ self entity workingCopy referenceCommit
]

{ #category : 'accessing' }
IceTipRepositoryModel >> commitId [
	^ [ self entity headCommit id ] on: Error do: [ nil ].
]

{ #category : 'accessing' }
IceTipRepositoryModel >> commitModelFor: aCommit [

	^ IceTipCommitModel repositoryModel: self on: aCommit
]

{ #category : 'operations' }
IceTipRepositoryModel >> createSourceDirectory [

	entity createSourceDirectory
]

{ #category : 'accessing' }
IceTipRepositoryModel >> description [
	| text |
	
	text := self displayString.
	(self isLibGitAvailable and: [ self entity isModified ]) 
		ifTrue: [ text := '*', text ].
	^ text
]

{ #category : 'accessing' }
IceTipRepositoryModel >> descriptionDecorator [

	(self isLibGitAvailable and: [ self entity isModified ]) 
		ifTrue: [ ^ IceTipDescriptionDecorator modified ].
	^ super descriptionDecorator
]

{ #category : 'testing' }
IceTipRepositoryModel >> hasRemotes [
	^ self entity remotes isNotEmpty
]

{ #category : 'testing' }
IceTipRepositoryModel >> hasUnbornProject [
	^ self entity workingCopy project isUnborn
]

{ #category : 'comparing' }
IceTipRepositoryModel >> hash [

	^ self species hash
		bitXor: self entity hash
]

{ #category : 'accessing' }
IceTipRepositoryModel >> headModel [
	
	| head |
	head := self entity head.
	^ head isBranch
		ifTrue: [ self branchModelFor: head ]
		ifFalse: [ self commitModelFor: head ]
]

{ #category : 'accessing' }
IceTipRepositoryModel >> incomingCommits [
	^ self entity incomingCommits
]

{ #category : 'accessing' }
IceTipRepositoryModel >> info [ 
	^ { 
		'Branch' -> self entity branch name.
		'Location' -> self entity location pathString.
		'Upstream' -> self entity upstream asString.
	  }
]

{ #category : 'testing' }
IceTipRepositoryModel >> isCodeMissing [
	^ entity isCodeMissing
]

{ #category : 'testing' }
IceTipRepositoryModel >> isDetached [
	^ self entity workingCopy isDetached 
		or: [ self entity head isDetached ]
]

{ #category : 'private - testing' }
IceTipRepositoryModel >> isLibGitAvailable [

	^ LGitLibrary uniqueInstance isAvailable
]

{ #category : 'private - testing' }
IceTipRepositoryModel >> isLoaded [
	^ self entity loadedPackages isNotEmpty 
]

{ #category : 'testing' }
IceTipRepositoryModel >> isMissing [
	^ self entity isMissing
]

{ #category : 'private' }
IceTipRepositoryModel >> localRepositoryMissing [

	^ 'Local repository missing'
]

{ #category : 'accessing' }
IceTipRepositoryModel >> location [
	
	^ entity location
]

{ #category : 'accessing' }
IceTipRepositoryModel >> longStatus [

	(entity isMissing and: [ entity location isNil ])
		ifTrue: [ ^ 'Iceberg does not find a git repository. Please clone the repository or change the repository location to an existing Git repository' ].

	entity isMissing 
		ifTrue: [ ^ 'Iceberg does not find a git repository at {1}. Please clone the repository again or change the repository location to an existing Git repository' format: { entity location } ].
				
	entity workingCopy workingCopyState isUnknownCommitState 
		ifTrue: [ ^ 'This image has a loaded version of the code from commit {1}, but Iceberg does not find the commit in your local Git repository. You may fetch the correct commit from a remote repository or discard the code of your image and load the version that is in the repository.' format: { entity workingCopy referenceCommit shortId } ].
			
	entity workingCopy isDetached 
		ifTrue: [ ^ 'The loaded code in the image starts from commit {1}. This commit does not correspond with the commit in the head of the current branch of the repository (Commit {2}). You need to synchronize them to continue. You need to discard your image changes or change the HEAD of the repository to point to the commit.' format: { entity workingCopy referenceCommit shortId. entity headCommit shortId } ].

	entity head isDetached 
		ifTrue: [ ^ 'The repository and the image are in the same commit {1}. However, the commit is not in an active branch. It is not possible to commit in a Git detached HEAD state. Create a new branch (by checkouting) or checkout an existing one.' format: { entity headCommit shortId } ].

	entity workingCopy project isUnborn
		ifTrue: [ ^ 'Cannot find a project (meta-data and source directory) in your repository. Please edit your repository meta-data to indicate the source code directory or change the location to a valid iceberg repository' ].

	^ 'Your repository seems ok. Please report a ticket in Iceberg''s issue tracker. If you can, please send us a backup of your image in this state for debugging.'
]

{ #category : 'testing' }
IceTipRepositoryModel >> matches: aString [
	^ self entity name matchesRegexIgnoringCase: aString
]

{ #category : 'actions' }
IceTipRepositoryModel >> newAddPackagesAction: aCollection [

	^ IceTipStandardAction new 
		repository: self entity;
		message: 'Adding packages';
		onSuccessRepositoryModified;
		action: [ 
			aCollection do: [ :each | 
				self entity workingCopy addPackageNamed: each name ] ];
		yourself
]

{ #category : 'actions' }
IceTipRepositoryModel >> newAddRemoteActionName: aName url: anUrl [
	
	^ IceTipStandardAction new 
		repository: self entity;
		message: 'Adding remote';
		onSuccessRepositoryModified;
		action: [ | remote |
			remote := IceGitRemote name: aName url: anUrl.
			self entity addRemote: remote.
			remote fetch ];
		yourself
]

{ #category : 'actions' }
IceTipRepositoryModel >> newCheckoutNewBranchNamed: aString inCommit: aCommit [

	<noCache>
	^ IceTipStandardAction new
		  repository: self entity;
		  message: ('Checking out new branch {1}' format: { aString });
		  onSuccessRepositoryModified;
		  action: [ self entity createBranch: aString inCommit: aCommit ];
		  yourself
]

{ #category : 'tagging' }
IceTipRepositoryModel >> newCreateTagAction: aString [

	^ IceTipStandardAction new 
		repository: self entity;
		message: ('Creating tag {1} on commit {2}' format: { aString. self commit shortId });
		onSuccessRepositoryModified;
		action: [ self commit createTag: aString ]
		yourself
]

{ #category : 'actions' }
IceTipRepositoryModel >> newDeleteAction [
	
	^ IceTipStandardAction new
		repository: self entity;
		message: ('Deleting {1}' format: {self name});
		action: [ self entity delete ];
		yourself
]

{ #category : 'actions' }
IceTipRepositoryModel >> newDiscardChangesAction [
	
	^ IceTipStandardAction new 
		repository: self entity;
		message: 'Discarding changes';
		onSuccessRepositoryModified;
		action: [ 
			Iceberg announcer suspendAllWhile: [ 
				self entity discardChanges ] ];
		yourself
]

{ #category : 'actions' }
IceTipRepositoryModel >> newFetchAction [
	<noCache>
	
	^ IceTipStandardAction new 
		repository: self entity;
		message: ('Fetching incoming commits of {1}' format: { self name });
		onSuccessRepositoryModified;
		action: [ :aContext :aJob |
			| remotes |
			remotes := self entity remotes.
			aJob max: remotes size.
			remotes withIndexDo: [ :each :index |
				aJob title: 'Remote: ' , each name asString.
				each fetch.
				aJob value: index ] ];
		yourself
]

{ #category : 'actions' }
IceTipRepositoryModel >> newForgetAction [
	
	^ IceTipStandardAction new
		repository: self entity;
		message: ('Forgeting {1}' format: {self name});
		action: [ self entity forget ];
		yourself
]

{ #category : 'accessing' }
IceTipRepositoryModel >> numberOfIncomingCommits [
	^ self incomingCommits size
]

{ #category : 'accessing' }
IceTipRepositoryModel >> numberOfOutgoingCommits [
	^ [ | size |
		self entity branch hasUpstream ifFalse: [ ^ '*' ].
		size := self outgoingCommits size.
		size > 100
			ifTrue: [ '99+' ]
			ifFalse: [ size asString ] ]
		on: IceNotInBranch do: [ :e | '0' ]
]

{ #category : 'accessing' }
IceTipRepositoryModel >> outgoingCommits [
	^ self entity outgoingCommits
]

{ #category : 'accessing' }
IceTipRepositoryModel >> packages [
	^ self entity workingCopy packages
]

{ #category : 'accessing' }
IceTipRepositoryModel >> pushRemoteName [

	^ self entity branch upstream name
]

{ #category : 'accessing' }
IceTipRepositoryModel >> remoteModels [

	^ self entity remotes collect: [ :each |
		  IceTipRemoteModel repositoryModel: self on: each ]
]

{ #category : 'accessing' }
IceTipRepositoryModel >> remotes [
	
	^ entity remotes
]

{ #category : 'accessing' }
IceTipRepositoryModel >> repository [
	
	^ entity
]

{ #category : 'accessing' }
IceTipRepositoryModel >> repositoryModel [
	^ self
]

{ #category : 'accessing' }
IceTipRepositoryModel >> repositoryModelsByGroup [

	| branches tags |
	branches := self allBranchModels.
	tags := self tagModels.
	^ {
		  ((IceTipTreeRepositoryGroup on: self)
			   name: 'Branches';
			   iconFormSet: (self iconFormSetNamed: #branch);
			   children: (branches
					    select: [ :each | each entity isLocal ]
					    thenCollect: [ :each | IceTipTreeBranch on: each ]);
			   yourself).
		  "Remotes group"
		  ((IceTipTreeRepositoryGroup on: self)
			   name: 'Remotes';
			   iconFormSet: (self iconFormSetNamed: #remote);
			   children: (self entity remotes collect: [ :eachRemote |
						    | remoteModel |
						    remoteModel := IceTipRemoteModel
							                   repositoryModel: self
							                   on: eachRemote.
						    (IceTipTreeRemote on: remoteModel)
							    name: remoteModel name;
							    children: (branches
									     select: [ :each |
										     each entity isRemote and: [
												     each entity remoteName = eachRemote name ] ]
									     thenCollect: [ :each | IceTipTreeBranch on: each ]);
							    yourself ]);
			   yourself).
		  "Tags group"
		  ((IceTipTreeRepositoryGroup on: self)
			   name: 'Tags';
			   iconFormSet: (self iconFormSetNamed: #glamorousBookmark);
			   children: (tags collect: [ :each | IceTipTreeTag on: each ]);
			   yourself) }
	"Branches group"
]

{ #category : 'accessing' }
IceTipRepositoryModel >> shortCommitId [
	^ [self entity headCommit shortId] on: Error do: [ nil ].
]

{ #category : 'accessing' }
IceTipRepositoryModel >> status [
	[
		| status incoming outgoing | 

		self verifyDirectoryStructureIfMissing: [ :message | ^ message asString ].
		self isLibGitAvailable ifFalse: [ ^ 'Unknown (No libgit2)' ].
		
		entity workingCopy workingCopyState isUnknownCommitState 
			ifTrue: [ ^ entity workingCopy workingCopyState description ].	
		entity workingCopy isDetached 
			ifTrue: [  ^ 'Detached Working Copy' ].
		(entity head isDetached and: [ entity head tags isNotEmpty ])
			ifTrue: [ ^ 'Detached HEAD' ].
		entity head isDetached 
			ifTrue: [ ^ 'Detached HEAD' ].

		entity workingCopy project isUnborn
			ifTrue: [ ^ 'No Project Found' ].

		self isLoaded ifFalse: [ ^ 'Not loaded' ].

		status := OrderedCollection new.
		entity isModified ifTrue: [ status add: 'Uncommitted changes' ].
		
		incoming := self incomingCommits size.
		incoming > 0 ifTrue: [ status add: ('{1} incoming' format: { incoming })].
		
		outgoing := self outgoingCommits size.
		outgoing > 0 ifTrue: [ status add: ('{1} not published' format: { outgoing })].

		status ifEmpty: [ status add: 'Up to date' ].
		
		^ ', ' join: status ] 
	on: Error 
	do: [ :e | ^ e description ]
]

{ #category : 'accessing' }
IceTipRepositoryModel >> statusDecorator [

	[
		self entity isMissing 
			ifTrue: [ ^ IceTipStatusDecorator error ].
		entity workingCopy workingCopyState isUnknownCommitState 
			ifTrue: [ ^ IceTipStatusDecorator error ].	
		entity workingCopy isDetached 
			ifTrue: [  ^ IceTipStatusDecorator error ].
		(entity head isDetached and: [ entity head tags isNotEmpty ])
			ifTrue: [ ^ IceTipStatusDecorator warning ].
		entity head isDetached 
			ifTrue: [ ^ IceTipStatusDecorator error ].
		entity workingCopy project isUnborn
			ifTrue: [ ^ IceTipStatusDecorator error ] 
	] 
	on: Error 
	do: [ :e | ^ IceTipStatusDecorator error ].
	
	^ IceTipStatusDecorator none
]

{ #category : 'accessing' }
IceTipRepositoryModel >> statusString [
	[
		| status incoming outgoing | 

		self verifyDirectoryStructureIfMissing: [ :message | ^ message asString ].
		
		entity workingCopy workingCopyState isUnknownCommitState 
			ifTrue: [ ^ entity workingCopy workingCopyState description ].	
		entity workingCopy isDetached 
			ifTrue: [  ^ 'Detached Working Copy' ].
		(entity head isDetached and: [ entity head tags isNotEmpty ])
			ifTrue: [ ^ 'Detached HEAD' ].
		entity head isDetached 
			ifTrue: [ ^ 'Detached HEAD' ].

		entity workingCopy project isUnborn
			ifTrue: [ ^ 'No Project Found' ].

		self isLoaded ifFalse: [ ^ 'Not loaded' ].

		status := OrderedCollection new.
		entity isModified ifTrue: [ status add: 'Uncommitted changes' ].
		
		incoming := self incomingCommits size.
		incoming > 0 ifTrue: [ status add: ('{1} incoming' format: { incoming })].
		
		outgoing := self outgoingCommits size.
		outgoing > 0 ifTrue: [ status add: ('{1} not published' format: { outgoing })].

		status ifEmpty: [ status add: 'Up to date' ].
		
		^ ', ' join: status ] 
	on: Error 
	do: [ :e | ^ e description ]
]

{ #category : 'accessing' }
IceTipRepositoryModel >> subdirectory [

	^ self entity subdirectory
]

{ #category : 'accessing' }
IceTipRepositoryModel >> tagModels [

	^ self entity tags collect: [ :each |
		  IceTipTagModel repositoryModel: self on: each ]
]

{ #category : 'operations' }
IceTipRepositoryModel >> updateLocation: aReference [
	
	"change location"
	self entity location: aReference.
	self entity postFetch.

	Iceberg announcer announce: (IceRepositoryModified for: self entity)
]

{ #category : 'private' }
IceTipRepositoryModel >> verifyDirectoryStructureIfMissing: aBlock [
	self entity isMissing ifTrue: [ ^ aBlock value: self localRepositoryMissing ]
]

{ #category : 'accessing' }
IceTipRepositoryModel >> workingCopy [
	
	^ self repository workingCopy
]

{ #category : 'accessing' }
IceTipRepositoryModel >> workingCopyDiff [

	^ IceTipWorkingCopyDiffModel
		  repositoryModel: self
		  on: self workingCopy
]

{ #category : 'accessing' }
IceTipRepositoryModel >> workingCopyModel [

	^ IceTipWorkingCopyModel on: self
]
