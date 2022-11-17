"
I'm a comment panel.
I can obtain a comment text and certain ""commit specific"" options. 
"
Class {
	#name : #IceTipCommentPanel,
	#superclass : #IceTipPresenter,
	#instVars : [
		'repositoryModel',
		'commentText',
		'pushCheckbox',
		'commitButton',
		'actionButtonBar',
		'saveCheckbox',
		'critiquesCheckbox',
		'fixesField',
		'fixesLabel'
	],
	#category : #'Iceberg-TipUI-View-Commit'
}

{ #category : #accessing }
IceTipCommentPanel >> actionButtonBar [

	^ actionButtonBar
]

{ #category : #accessing }
IceTipCommentPanel >> clear [

	commentText text: ''
]

{ #category : #'accessing - ui' }
IceTipCommentPanel >> commentText [

	^ commentText
]

{ #category : #'accessing - ui' }
IceTipCommentPanel >> commitButton [

	^ commitButton
]

{ #category : #layout }
IceTipCommentPanel >> defaultLayout [

	self flag: #pharoTodo. "FIXES ISSUE NUMBER INPUT is disabled. See below.
	Reason: for the first stage of merging dev-1.9, we'll keep the diff as simple
	as possible, to reduce noise in users. (Right now this branch is only a
	migration from Spec1+Commander1 to Spec2+Commander2)."

	^ SpBoxLayout newTopToBottom
		spacing: 5;
		add: (SpBoxLayout newLeftToRight
				add: pushCheckbox;
				add: saveCheckbox;
				add: critiquesCheckbox;
				yourself)
		  	expand: false;
		add: commentText;
		add: actionButtonBar expand: false;
		yourself
]

{ #category : #accessing }
IceTipCommentPanel >> fixesField [

	^ fixesField
]

{ #category : #accessing }
IceTipCommentPanel >> fixesLabel [

	^ fixesLabel
]

{ #category : #initialization }
IceTipCommentPanel >> initializePresenters [
	| fixesHelpString |

	pushCheckbox := self newCheckBox.
	saveCheckbox := self newCheckBox.
	critiquesCheckbox := self newCheckBox.
	
	self repositoryModel branchModel hasUpstream
		ifTrue: [
			pushCheckbox
				label: ('Push changes to {1}' format: {self repositoryRemoteName});
				state: IceTipCommitSettings pushOnCommit;
				whenChangedDo: [ :state | IceTipCommitSettings pushOnCommit: state ] ]
		ifFalse: [
			pushCheckbox
				label: 'Cannot push new branch automatically. Use the `Push` option';
				enabled: false ].
	saveCheckbox
		label: 'Save the image when commiting';
		state: IceTipCommitSettings saveImageOnCommit;
		whenChangedDo: [ :state | IceTipCommitSettings saveImageOnCommit: state ].

	critiquesCheckbox
		label: 'Run Critiques when commiting';
		state: IceTipCommitSettings critiquesOnCommit;
		whenChangedDo: [ :state | IceTipCommitSettings critiquesOnCommit: state ].

	commentText := self newText
		autoAccept: true;
		placeholder: 'A comment for your commit';
		yourself.

	fixesHelpString := 'Enter the number of the issue that you fixed. Github will close it when it will be commited or merged in the default branch'.
	fixesLabel := self newLabel
		label: 'Fixes #';
		help: fixesHelpString;
		yourself.
	fixesField := self newNumberInput
		autoAccept: true;
		help: fixesHelpString;
		placeholder: 'issue number';
		beInteger;
		yourself.

	actionButtonBar := self newButtonBar.
	actionButtonBar placeAtStart; add: (commitButton := self newButton
		label: 'Commit';
		icon: (self iconNamed: #smallOk);
		help: ('Commit your changes to {1}' format: { self repositoryName });
		yourself)
]

{ #category : #testing }
IceTipCommentPanel >> isPushing [

	^ self pushCheckbox state
]

{ #category : #testing }
IceTipCommentPanel >> isSaving [

	^ self saveCheckbox state
]

{ #category : #accessing }
IceTipCommentPanel >> message [

	self fixesField text isAllDigits ifFalse: [ 
		^ self commentText text asString ].

	^ String streamContents: [ :stream | 
		  stream
			  nextPutAll: self commentText text asString; cr;
			  nextPutAll: 'Fixes #';
			  nextPutAll: self fixesField number asString ]
]

{ #category : #events }
IceTipCommentPanel >> onCommit: aBlock [

	commitButton action: [ 
		aBlock 
			cull: self message
			cull: self isPushing ]
]

{ #category : #'accessing - ui' }
IceTipCommentPanel >> pushCheckbox [

	^ pushCheckbox
]

{ #category : #accessing }
IceTipCommentPanel >> refresh [

	commitButton help: ('Commit your changes to {1}' format: { self repositoryName }).
	pushCheckbox label: ('Push changes to {1}' format: { self repositoryRemoteName })
]

{ #category : #accessing }
IceTipCommentPanel >> repositoryModel [

	^ repositoryModel
]

{ #category : #'private - accessing' }
IceTipCommentPanel >> repositoryName [

	^ self repositoryModel name
]

{ #category : #'private - accessing' }
IceTipCommentPanel >> repositoryRemoteName [

	^ self repositoryModel pushRemoteName
]

{ #category : #'accessing - ui' }
IceTipCommentPanel >> saveCheckbox [

	^ saveCheckbox
]

{ #category : #initialization }
IceTipCommentPanel >> setModelBeforeInitialization: aRepositoryModel [

	repositoryModel := aRepositoryModel
]

{ #category : #specs }
IceTipCommentPanel >> titleForWindow [

	^ 'Comment'
]
