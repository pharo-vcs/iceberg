"
I expose data of a branch.
"
Class {
	#name : 'IceTipBranchModel',
	#superclass : 'IceTipCommitishModel',
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipBranchModel >> checkoutStrategies [
	^ IceCheckoutStrategy allStrategies
]

{ #category : 'accessing' }
IceTipBranchModel >> commitModels [
	| commits |
	commits := OrderedCollection new.
	self entity commitsDo: [ :each | 
		commits add: (IceTipCommitModel 
			repositoryModel: self repositoryModel 
			on: each) 
			beCached ].
	^ commits
]

{ #category : 'accessing' }
IceTipBranchModel >> commits [
	self shouldBeImplemented.
]

{ #category : 'accessing' }
IceTipBranchModel >> description [

	^ self entity isRemote 
		ifTrue: [ self entity shortName ]
		ifFalse: [ self name ]
]

{ #category : 'accessing' }
IceTipBranchModel >> descriptionDecorator [
		
	self entity isHead ifTrue: [ ^ IceTipDescriptionDecorator head ].
	^ super descriptionDecorator
]

{ #category : 'accessing' }
IceTipBranchModel >> diffFromHead [
	| commitModel |
	commitModel := IceTipCommitModel on: self entity commit.
	^ commitModel diffFromHead
]

{ #category : 'accessing' }
IceTipBranchModel >> diffToWorkingCopy [
	| commitModel |
	commitModel := IceTipCommitModel on: self entity commit.
	^ commitModel diffToWorkingCopy
]

{ #category : 'testing' }
IceTipBranchModel >> hasUpstream [
	
	^ entity hasUpstream
]

{ #category : 'testing' }
IceTipBranchModel >> isHead [
	^ self entity isHead
]

{ #category : 'testing' }
IceTipBranchModel >> isLocal [
	^ self entity isLocal
]

{ #category : 'accessing' }
IceTipBranchModel >> name [
	^ self entity name
]

{ #category : 'actions' }
IceTipBranchModel >> newCheckoutWithStrategyAction: aCheckoutStrategy [
	<noCache>
	
	^ IceTipStandardAction new 
		repository: self entity repository; 
		message: ('Checking out branch {1} from {2}' format: { self name. self repositoryName });
		onSuccessRepositoryModified;
		action: [ self entity checkoutWithStrategy: aCheckoutStrategy ];
		yourself
]

{ #category : 'actions' }
IceTipBranchModel >> newDeleteAction [
	<noCache>
	
	^ IceTipStandardAction new
		repository: self repositoryModel entity;
		message: ('Removing branch {1}' format: { self name });
		onSuccessRepositoryModified;
		action: [ self entity delete ];
		yourself
]

{ #category : 'actions' }
IceTipBranchModel >> newDirectMergeAction [
	<noCache>

	^ IceTipStandardAction new 
		repository: self repositoryModel entity;
		message: ('Merging branch {1} from {2}' format: { self name. self repositoryName });
		onSuccessRepositoryModified;
		action: [ self entity merge ];
		yourself
]

{ #category : 'actions' }
IceTipBranchModel >> newSwitchAndMergeAction [
	<noCache>

	^ IceTipStandardAction new
		repository: self entity repository; 
		message: ('Merging branch {1} from {2}' format: { self name. self repositoryName });
		onSuccessRepositoryModified;
		action: [ self entity switchAndMergeWorkingCopy ];
		yourself
]

{ #category : 'actions' }
IceTipBranchModel >> previewCheckout [

	"this will open a 'checkout browser' that will allow user to validate the changes before 
	 actually checking out (checkout operation will be called in my sibling method, #checkout)"

	<noCache>
	(IceTipCheckoutPreviewBrowser onBranch: self) open
]

{ #category : 'actions' }
IceTipBranchModel >> previewMerge: aMergeType [
	"this will open a 'checkout browser' that will allow user to validate the changes before 
	 actually checking out (checkout operation will be called in my sibling method, #checkout)"
	<noCache>
	(IceTipMergePreviewBrowser onBranch: self) 
		mergeType: aMergeType;
		open
]

{ #category : 'printing' }
IceTipBranchModel >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $[;
		nextPutAll: self name;
		nextPut: $]
]

{ #category : 'accessing' }
IceTipBranchModel >> repositoryName [
	^ self repositoryModel name
]

{ #category : 'API - commits' }
IceTipBranchModel >> resetToCommit: anIceTipCachedModel [ 
	
	entity resetToCommit: anIceTipCachedModel entity
]
