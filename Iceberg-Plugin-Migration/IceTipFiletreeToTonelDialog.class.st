"
I'm a dialog validate and perform a migration of sources from filetree to tonel.

"
Class {
	#name : #IceTipFiletreeToTonelDialog,
	#superclass : #IceTipDialog,
	#instVars : [
		'iconPanel',
		'confirmLabel',
		'mergeWithMasterCheckbox',
		'branchName',
		'repository'
	],
	#category : #'Iceberg-Plugin-Migration'
}

{ #category : #specs }
IceTipFiletreeToTonelDialog class >> defaultSpec [

	^ SpBoxLayout newHorizontal
		  add: #iconPanel width: 40 * self currentWorld displayScaleFactor;
		  add: (SpBoxLayout newVertical
				   add: #confirmLabel;
				   add: #mergeWithMasterCheckbox height: self inputTextHeight;
				   yourself);
		  yourself
]

{ #category : #actions }
IceTipFiletreeToTonelDialog >> accept [
	
	IceTipStandardAction new 
		repository: self repository; 
		message: ('Migrating {1} sources to tonel' format: { self repository name });
		onSuccessRepositoryModified;
		onSuccess: [ UIManager default inform: 'Sources migrated!' ];
		execute: [ self doAccept ]
]

{ #category : #accessing }
IceTipFiletreeToTonelDialog >> branchBaseName [

	^ 'migrate-sources-to-tonel'
]

{ #category : #accessing }
IceTipFiletreeToTonelDialog >> branchName [

	^ branchName ifNil: [ branchName := self obtainBranchName ]
]

{ #category : #'accessing ui' }
IceTipFiletreeToTonelDialog >> confirmLabel [

	^ confirmLabel
]

{ #category : #accessing }
IceTipFiletreeToTonelDialog >> confirmMessage [

	^ 'Convert repository {1} sources from filetree format to tonel. 
This process will use a new branch named {2}. 
You can choose to not merge immediately your migration.

ARE YOU SURE?'
]

{ #category : #actions }
IceTipFiletreeToTonelDialog >> doAccept [
	
	IceConvertFormatAction new 
		repository: self repository;
		branchName: self branchName;
		format: #tonel;
		mergeWithCurrentBranch: self mergeWithMasterCheckbox state;
		execute
]

{ #category : #'accessing ui' }
IceTipFiletreeToTonelDialog >> iconPanel [

	^ iconPanel
]

{ #category : #initialization }
IceTipFiletreeToTonelDialog >> initialExtentForWindow [

	^ (500
	   @ (self class inputTextHeight * 5 + self class buttonHeight + 50))
		  scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipFiletreeToTonelDialog >> initializePresenters [

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

{ #category : #'accessing ui' }
IceTipFiletreeToTonelDialog >> mergeWithMasterCheckbox [

	^ mergeWithMasterCheckbox
]

{ #category : #private }
IceTipFiletreeToTonelDialog >> obtainBranchName [

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

{ #category : #accessing }
IceTipFiletreeToTonelDialog >> repository [

	^ repository
]

{ #category : #initialization }
IceTipFiletreeToTonelDialog >> setModelBeforeInitialization: anObject [

	repository := anObject
]

{ #category : #initialization }
IceTipFiletreeToTonelDialog >> titleForWindow [

	^ 'Convert sources to tonel'
]
