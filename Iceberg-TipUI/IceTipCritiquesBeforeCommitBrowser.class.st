"
I am a dialog to be used before commit so we can check if the code to commit has critiques on it
"
Class {
	#name : #IceTipCritiquesBeforeCommitBrowser,
	#superclass : #IceTipDialog,
	#instVars : [
		'commitModel',
		'onAcceptAction',
		'critiques',
		'critiquesList',
		'model',
		'reasonPanel',
		'detailPanel',
		'browseButton',
		'autofixButton'
	],
	#category : #'Iceberg-TipUI-View-Commit'
}

{ #category : #commands }
IceTipCritiquesBeforeCommitBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	
]

{ #category : #commands }
IceTipCritiquesBeforeCommitBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	
]

{ #category : #specs }
IceTipCritiquesBeforeCommitBrowser class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
			add: #reasonPanel withConstraints: [ :constraints |
				constraints 
					height: 70;
					padding: 2 ];	
			add: #critiquesList withConstraints: [ :constraints | 
				constraints
					height: 100;
					padding: 2 ];
			add: #detailPanel withConstraints: [ :constraints | 
				constraints
					height: 100; 
					padding: 2 ];
			add: ( SpBoxLayout newLeftToRight 
				add: #browseButton;
				add: #autofixButton;
				yourself) withConstraints: [:constraints | 
					constraints 
						height: self buttonHeight;
						padding: 2];
			yourself
]

{ #category : #actions }
IceTipCritiquesBeforeCommitBrowser >> accept [

	self closeWindow.
	onAcceptAction value
]

{ #category : #accessing }
IceTipCritiquesBeforeCommitBrowser >> commitModel [

	^ commitModel
]

{ #category : #accessing }
IceTipCritiquesBeforeCommitBrowser >> commitModel: anObject [

	commitModel := anObject
]

{ #category : #updating }
IceTipCritiquesBeforeCommitBrowser >> disableCommitAfterChanges [

	self withWindowDo: [ :window | 
		window buttons second 
			label: 'Commit';
			enabled: false.
		window buttons third label: 'Close' ]
]

{ #category : #actions }
IceTipCritiquesBeforeCommitBrowser >> doAutofix [

	critiquesList selectedItem ifNotNil: [ :aCritique | 
		(RePropertyAction new
			 icon: (aCritique iconNamed: #repairIcon);
			 description: 'Automatically resolve the issue';
			 action: [ :crit | 
				 | changesBrowser |
				 changesBrowser := (ChangesBrowser changes: { crit change })
					                   extent: 500 @ 400;
					                   setModal: SystemWindow topWindow;
					                   yourself.

				 changesBrowser openDialogWithSpec
					 okAction: [ 
						 changesBrowser accept.
						 self disableCommitAfterChanges.
						 self updatePresenter ];
					 centered ]) actOnCritic: aCritique ofEntity: aCritique entity ]
]

{ #category : #actions }
IceTipCritiquesBeforeCommitBrowser >> doBrowse [
	
	critiquesList selectedItem ifNotNil: [ :aCritique | aCritique entity browse ]
]

{ #category : #initialization }
IceTipCritiquesBeforeCommitBrowser >> initializeCritiquesList [

	critiquesList := self newTable.
	critiquesList
		addColumn: (SpImageTableColumn new 
			width: 20;
			evaluated: [ :aCritique | aCritique icon ];
			yourself);
		addColumn: (SpImageTableColumn new 
			width: 20;
			evaluated: [ :aCritique | self iconNamed: aCritique entity systemIconName  ];
			yourself);
		addColumn: (SpStringTableColumn new 
			title: 'Entity';
			evaluated: [ :aCritique | aCritique entity printString ];
			yourself);
		addColumn: (SpStringTableColumn new 
			title: 'Critique';
			evaluated: [ :aCritique | aCritique title ];
			yourself);
		whenSelectionChangedDo: (MessageSend receiver: self selector: #updateSelectedCritique) 
]

{ #category : #initialization }
IceTipCritiquesBeforeCommitBrowser >> initializeDetailPanel [

	detailPanel := self newText
		beNotEditable;
		beWrapWord;
		addStyle: 'iceTipReadonly';
		yourself.

]

{ #category : #initialization }
IceTipCritiquesBeforeCommitBrowser >> initializeDialogWindow: aWindow [

	super initializeDialogWindow: aWindow.

	aWindow initialExtent: 600@400.

	aWindow buttons addFirst: (SpButtonPresenter new 
		owner: aWindow;
		label: 'Update';
		icon: (self iconNamed: #refresh);
		action: (MessageSend receiver: self selector: #updatePresenter);
		yourself).

	aWindow buttons second label: 'Force Commit'.
	aWindow buttons third label: 'Cancel Commit'.
	
	aWindow 
		bindKeyCombination: Character cr asShortcut toAction: [ self accept].

]

{ #category : #initialization }
IceTipCritiquesBeforeCommitBrowser >> initializePresenters [

	super initializePresenters.

	browseButton := self newButton.
	browseButton label: 'Browse Entity'.
	browseButton action: (MessageSend receiver: self selector: #doBrowse).
	browseButton icon: (self iconNamed: #glamorousBrowse).

	autofixButton := self newButton.
	autofixButton label: 'Autofix'.
	autofixButton action: (MessageSend receiver: self selector: #doAutofix).
	autofixButton icon: (self iconNamed: #repair).

	self initializeCritiquesList.
	self initializeReasonPanel.
	self initializeDetailPanel
]

{ #category : #initialization }
IceTipCritiquesBeforeCommitBrowser >> initializeReasonPanel [

	reasonPanel := self newText
		beNotEditable;
		addStyle: 'iceTipReadonly';
		beWrapWord;
		yourself.

	reasonPanel text: 'Selected changes in the commit have critiques detected.
Select each critique to see a detailed message of each critique.'.

]

{ #category : #accessing }
IceTipCritiquesBeforeCommitBrowser >> model [
	^ model
]

{ #category : #accessing }
IceTipCritiquesBeforeCommitBrowser >> onAccept: aFullBlockClosure [ 
	
	onAcceptAction := aFullBlockClosure 
]

{ #category : #actions }
IceTipCritiquesBeforeCommitBrowser >> openIfCritiques [

	"If the setting is disabled we just commit"
	IceTipCommitSettings critiquesOnCommit 
		ifFalse: [ ^ onAcceptAction value ].

	critiques 
		ifNotEmpty: [ self openNonModalWithSpec ] 
		ifEmpty: [ onAcceptAction value ] 
	
]

{ #category : #'accessing - model' }
IceTipCritiquesBeforeCommitBrowser >> setModelBeforeInitialization: someNodes [

	model := someNodes
]

{ #category : #initialization }
IceTipCritiquesBeforeCommitBrowser >> titleForWindow [

	^ 'Critiques for Commit on {1} branch {2}' format: { 
			  commitModel name.
			  commitModel branchName }
]

{ #category : #initialization }
IceTipCritiquesBeforeCommitBrowser >> updatePresenter [ 

	super updatePresenter.
	critiques := (IceCritiquesVisitor new visitAll: self model; critiques) asOrderedCollection.
	critiquesList items: critiques.

	critiques ifNotEmpty: [ critiquesList selectIndex: 1].

]

{ #category : #updating }
IceTipCritiquesBeforeCommitBrowser >> updateSelectedCritique [

	critiquesList selectedItem
		ifNil: [ 
			detailPanel text: ''.
			browseButton enabled: false.
			autofixButton enabled: false ]
		ifNotNil: [ :aCritique | 
			detailPanel text: aCritique description.
			autofixButton enabled: (aCritique providesChange).
			browseButton enabled: true ]
]
