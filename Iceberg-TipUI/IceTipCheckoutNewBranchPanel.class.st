"
I'm a panel to create a new local branch 
"
Class {
	#name : #IceTipCheckoutNewBranchPanel,
	#superclass : #IceTipBranchPanel,
	#instVars : [
		'currentBranchLabel',
		'branchLabel',
		'branchInputText',
		'branchCommitish',
		'callback'
	],
	#category : #'Iceberg-TipUI-View-Branch'
}

{ #category : #specs }
IceTipCheckoutNewBranchPanel class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: #currentBranchLabel height: self inputTextHeight;
		  add: (SpBoxLayout newHorizontal
				   add: #branchLabel width: self labelWidth;
				   add: #branchInputText;
				   yourself)
		  height: self inputTextHeight
]

{ #category : #'accessing ui' }
IceTipCheckoutNewBranchPanel >> branchInputText [

	^ branchInputText
]

{ #category : #'accessing ui' }
IceTipCheckoutNewBranchPanel >> branchLabel [

	^ branchLabel
]

{ #category : #accessing }
IceTipCheckoutNewBranchPanel >> branchName [

	^ self branchInputText text asString trimBoth
]

{ #category : #accessing }
IceTipCheckoutNewBranchPanel >> commitish: anIceTipModel [
	
	branchCommitish := anIceTipModel
]

{ #category : #'accessing ui' }
IceTipCheckoutNewBranchPanel >> currentBranchLabel [

	^ currentBranchLabel
]

{ #category : #actions }
IceTipCheckoutNewBranchPanel >> doAccept [

	self model
		checkoutNewBranchNamed: self branchName
		inCommit: (branchCommitish ifNil: [ self model entity workingCopy referenceCommit ])
		thenDo: [ :newBranch | callback ifNotNil: [ callback value: newBranch ] ]
]

{ #category : #accessing }
IceTipCheckoutNewBranchPanel >> icon [

	^ self iconNamed: #smallNew
]

{ #category : #initialization }
IceTipCheckoutNewBranchPanel >> initializeCurrentBranchLabel [

	currentBranchLabel := self newLabel
		label: 'Current branch: ', self model branchName
]

{ #category : #initialization }
IceTipCheckoutNewBranchPanel >> initializePresenters [

	self initializeCurrentBranchLabel.
	branchLabel := self newLabel
		               label: 'New branch';
		               yourself.
	branchInputText := self newTextInput
		                   autoAccept: true;
		                   placeholder: 'e.g., feature/what';
		                   yourself.
]

{ #category : #testing }
IceTipCheckoutNewBranchPanel >> isNewBranch [

	^ true
]

{ #category : #accessing }
IceTipCheckoutNewBranchPanel >> openDialogWithSpec [

	^ super openDialogWithSpec
		  okAction: [ self accept ];
		  yourself
]

{ #category : #initialization }
IceTipCheckoutNewBranchPanel >> titleForWindow [

	^ 'New branch'
]

{ #category : #accessing }
IceTipCheckoutNewBranchPanel >> validate [

	self 
		assert: self branchName isNotEmpty
		description: 'Please enter your new branch name.'.
	self 
		assert: (self branchName noneSatisfy: #isSeparator)
		description: 'You can''t have spaces in your branch name.'
]

{ #category : #callbacks }
IceTipCheckoutNewBranchPanel >> withResultDo: aBlockClosure [ 
	
	callback := aBlockClosure
]
