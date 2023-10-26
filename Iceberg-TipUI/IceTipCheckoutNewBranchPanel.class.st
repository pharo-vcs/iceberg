"
I'm a panel to create a new local branch 
"
Class {
	#name : 'IceTipCheckoutNewBranchPanel',
	#superclass : 'IceTipBranchPanel',
	#instVars : [
		'currentBranchLabel',
		'branchLabel',
		'branchInputText',
		'branchCommitish',
		'callback'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'accessing - ui' }
IceTipCheckoutNewBranchPanel >> branchInputText [

	^ branchInputText
]

{ #category : 'accessing - ui' }
IceTipCheckoutNewBranchPanel >> branchLabel [

	^ branchLabel
]

{ #category : 'accessing' }
IceTipCheckoutNewBranchPanel >> branchName [

	^ self branchInputText text asString trimBoth
]

{ #category : 'accessing' }
IceTipCheckoutNewBranchPanel >> commitish: anIceTipModel [
	
	branchCommitish := anIceTipModel
]

{ #category : 'accessing - ui' }
IceTipCheckoutNewBranchPanel >> currentBranchLabel [

	^ currentBranchLabel
]

{ #category : 'layout' }
IceTipCheckoutNewBranchPanel >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 5;
		add: currentBranchLabel expand: false;
		add: (SpBoxLayout newLeftToRight
				vAlignCenter;
				spacing: 5;
				add: branchLabel expand: false;
				add: branchInputText;
				yourself)
		 	expand: false;
		yourself
]

{ #category : 'actions' }
IceTipCheckoutNewBranchPanel >> doAccept [

	(self model
		newCheckoutNewBranchNamed: self branchName
		inCommit: (branchCommitish ifNil: [ self model entity workingCopy referenceCommit ]))
		onSuccess: [ 
			callback ifNotNil: [ 
				callback value: (self model branchNamed: self branchName) ] ];
		executeWithContext: self
]

{ #category : 'accessing' }
IceTipCheckoutNewBranchPanel >> icon [

	^ self iconNamed: #smallNew
]

{ #category : 'initialization' }
IceTipCheckoutNewBranchPanel >> iconForWindow [

	^ self icon
]

{ #category : 'initialization' }
IceTipCheckoutNewBranchPanel >> initializeCurrentBranchLabel [

	currentBranchLabel := self newLabel
		label: 'Current branch: ', self model branchName
]

{ #category : 'initialization' }
IceTipCheckoutNewBranchPanel >> initializePresenters [

	self initializeCurrentBranchLabel.
	branchLabel := self newLabel
		label: 'New branch';
		yourself.
	branchInputText := self newTextInput
		placeholder: 'e.g., feature/what';
		yourself
]

{ #category : 'testing' }
IceTipCheckoutNewBranchPanel >> isNewBranch [

	^ true
]

{ #category : 'accessing' }
IceTipCheckoutNewBranchPanel >> openDialog [

	^ self asDialogWindow
		  okAction: [ self accept ];
		  open
]

{ #category : 'initialization' }
IceTipCheckoutNewBranchPanel >> titleForWindow [

	^ 'New branch'
]

{ #category : 'accessing' }
IceTipCheckoutNewBranchPanel >> validate [

	self 
		assert: self branchName isNotEmpty
		description: 'Please enter your new branch name.'.
	self 
		assert: (self branchName noneSatisfy: #isSeparator)
		description: 'You can''t have spaces in your branch name.'
]

{ #category : 'callbacks' }
IceTipCheckoutNewBranchPanel >> withResultDo: aBlockClosure [ 
	
	callback := aBlockClosure
]
