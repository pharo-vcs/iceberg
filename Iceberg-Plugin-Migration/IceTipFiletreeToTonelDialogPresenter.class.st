"
I'm a dialog validate and perform a migration of sources from filetree to tonel.

"
Class {
	#name : 'IceTipFiletreeToTonelDialogPresenter',
	#superclass : 'IceTipDialogPresenter',
	#instVars : [
		'iconPanel',
		'confirmLabel',
		'mergeWithMasterCheckbox',
		'branchName',
		'repository'
	],
	#category : 'Iceberg-Plugin-Migration-UI',
	#package : 'Iceberg-Plugin-Migration',
	#tag : 'UI'
}

{ #category : 'actions' }
IceTipFiletreeToTonelDialogPresenter >> accept [
	
	IceTipStandardAction new
		repository: self repository; 
		message: ('Migrating {1} sources to tonel' format: { self repository name });
		onSuccessRepositoryModified;
		onSuccess: [ self window inform: 'Sources migrated!' ];
		action: [ self doAccept ];
		executeWithContext: self
]

{ #category : 'accessing' }
IceTipFiletreeToTonelDialogPresenter >> branchBaseName [

	^ 'migrate-sources-to-tonel'
]

{ #category : 'accessing' }
IceTipFiletreeToTonelDialogPresenter >> branchName [

	^ branchName ifNil: [ branchName := self obtainBranchName ]
]

{ #category : 'accessing - ui' }
IceTipFiletreeToTonelDialogPresenter >> confirmLabel [

	^ confirmLabel
]

{ #category : 'accessing' }
IceTipFiletreeToTonelDialogPresenter >> confirmMessage [

	^ 'Convert repository {1} sources from filetree format to tonel. 
This process will use a new branch named {2}. 
You can choose to not merge immediately your migration.

ARE YOU SURE?'
]

{ #category : 'layout' }
IceTipFiletreeToTonelDialogPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		borderWidth: 5;
		spacing: 10;
		add: iconPanel expand: false;
		add: (SpBoxLayout newTopToBottom
			add: confirmLabel;
			add: mergeWithMasterCheckbox expand: false;
			yourself);
		yourself
]

{ #category : 'actions' }
IceTipFiletreeToTonelDialogPresenter >> doAccept [
	
	IceConvertFormatAction new 
		repository: self repository;
		branchName: self branchName;
		format: #tonel;
		mergeWithCurrentBranch: self mergeWithMasterCheckbox state;
		execute
]

{ #category : 'accessing - ui' }
IceTipFiletreeToTonelDialogPresenter >> iconPanel [

	^ iconPanel
]

{ #category : 'initialization' }
IceTipFiletreeToTonelDialogPresenter >> initialExtentForWindow [

	^ (500
	   @ (self class inputTextHeight * 5 + self class buttonHeight + 50))
		  scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipFiletreeToTonelDialogPresenter >> initializePresenters [

	super initializePresenters.
	iconPanel := self newImage
		image: (self iconNamed: #question);
		yourself.
	confirmLabel := self newText
		text: (self confirmMessage format: {
			self repository name.
			self branchName });
		yourself.
	mergeWithMasterCheckbox := self newCheckBox
		label: ('Merge with branch {1}' format: {self repository branchName});
		state: true;
		yourself.

]

{ #category : 'accessing - ui' }
IceTipFiletreeToTonelDialogPresenter >> mergeWithMasterCheckbox [

	^ mergeWithMasterCheckbox
]

{ #category : 'private' }
IceTipFiletreeToTonelDialogPresenter >> obtainBranchName [

	| baseName suffix count |
	count := 0.
	baseName := self branchBaseName.
	suffix := ''.
	[ true ] whileTrue: [ 
		self repository
			branchNamed: baseName , suffix
			ifAbsent: [ ^ baseName , suffix ].
		count := count + 1.
		suffix := '-' , count asString ]
]

{ #category : 'accessing' }
IceTipFiletreeToTonelDialogPresenter >> repository [

	^ repository
]

{ #category : 'initialization' }
IceTipFiletreeToTonelDialogPresenter >> setModelBeforeInitialization: anObject [

	repository := anObject
]

{ #category : 'initialization' }
IceTipFiletreeToTonelDialogPresenter >> titleForWindow [

	^ 'Convert sources to tonel'
]
