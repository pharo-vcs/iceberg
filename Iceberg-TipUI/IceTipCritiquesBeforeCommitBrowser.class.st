"
I am a dialog to be used before commit so we can check if the code to commit has critiques on it
"
Class {
	#name : 'IceTipCritiquesBeforeCommitBrowser',
	#superclass : 'IceTipDialogPresenter',
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
	#category : 'Iceberg-TipUI-View-Commit',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Commit'
}

{ #category : 'commands' }
IceTipCritiquesBeforeCommitBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	
]

{ #category : 'commands' }
IceTipCritiquesBeforeCommitBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	
]

{ #category : 'actions' }
IceTipCritiquesBeforeCommitBrowser >> accept [

	self closeWindow.
	onAcceptAction value
]

{ #category : 'private' }
IceTipCritiquesBeforeCommitBrowser >> calculateCritics [
	| visitor calculatedCritics |	
	
	calculatedCritics := #().
	self application 
		informUser: 'Calculating Critiques...'
		during: [ :aJob | 
			visitor := IceCritiquesVisitor new.
			aJob max: self model size.
			self model withIndexDo: [ :each :index | 
				each accept: visitor.
				aJob currentValue: index ].
			calculatedCritics := visitor critiques asOrderedCollection ].
	
	^ calculatedCritics
]

{ #category : 'accessing' }
IceTipCritiquesBeforeCommitBrowser >> commitModel [

	^ commitModel
]

{ #category : 'accessing' }
IceTipCritiquesBeforeCommitBrowser >> commitModel: anObject [

	commitModel := anObject
]

{ #category : 'layout' }
IceTipCritiquesBeforeCommitBrowser >> defaultLayout [

	^ SpBoxLayout newTopToBottom
			borderWidth: 5;
			spacing: 5;
			add: reasonPanel height: 70 * self currentWorld displayScaleFactor;	
			add: critiquesList;
			add: detailPanel;
			add: (SpBoxLayout newLeftToRight 
					spacing: 5;
					add: browseButton;
					add: autofixButton;
					yourself)
				expand: false;
			yourself
]

{ #category : 'updating' }
IceTipCritiquesBeforeCommitBrowser >> disableCommitAfterChanges [

	self withWindowDo: [ :window | 
		window buttons second 
			label: 'Commit';
			enabled: false.
		window buttons third label: 'Close' ]
]

{ #category : 'actions' }
IceTipCritiquesBeforeCommitBrowser >> doAutofix [
	| critique |

	(critique := critiquesList selectedItem) ifNil: [ ^ self ].
	 
	(RePropertyAction new
		icon: (critique iconNamed: #repair);
		description: 'Automatically resolve the issue';
		action: [ :crit | 
			| changesBrowser |

			changesBrowser := (StChangesBrowserPresenter changes: { crit change })
				extent: 500 @ 400;
				yourself.

		 changesBrowser openModal
			 okAction: [ 
				 changesBrowser accept.
				 self disableCommitAfterChanges.
				 self updatePresenter ];
			 centered ]) 
		actOnCritic: critique ofEntity: critique entity
]

{ #category : 'actions' }
IceTipCritiquesBeforeCommitBrowser >> doBrowse [
	
	critiquesList selectedItem ifNotNil: [ :aCritique | aCritique entity browse ]
]

{ #category : 'initialization' }
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

{ #category : 'initialization' }
IceTipCritiquesBeforeCommitBrowser >> initializeDetailPanel [

	detailPanel := self newText
		beNotEditable;
		beWrapWord;
		addStyle: 'iceTipReadonly';
		yourself.

]

{ #category : 'initialization' }
IceTipCritiquesBeforeCommitBrowser >> initializeDialogWindow: aWindow [

	super initializeDialogWindow: aWindow.

	aWindow initialExtent: 600@400.

	aWindow buttons addFirst: (SpButtonPresenter new 
		owner: aWindow;
		label: 'Update';
		icon: (self iconNamed: #refresh);
		action: (MessageSend receiver: self selector: #updatePresenter);
		yourself).

	aWindow buttons second label: 'Cancel'.
	aWindow buttons third label: 'Commit'.
	
	aWindow 
		bindKeyCombination: Character cr asShortcut toAction: [ self accept].

]

{ #category : 'initialization' }
IceTipCritiquesBeforeCommitBrowser >> initializePresenters [

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

{ #category : 'initialization' }
IceTipCritiquesBeforeCommitBrowser >> initializeReasonPanel [

	reasonPanel := self newText
		beNotEditable;
		addStyle: 'iceTipReadonly';
		beWrapWord;
		yourself.

	reasonPanel text: 'Selected changes in the commit have critiques detected.
Select each critique to see a detailed message of each critique.'.

]

{ #category : 'accessing' }
IceTipCritiquesBeforeCommitBrowser >> model [
	^ model
]

{ #category : 'accessing' }
IceTipCritiquesBeforeCommitBrowser >> onAccept: aFullBlockClosure [ 
	
	onAcceptAction := aFullBlockClosure 
]

{ #category : 'actions' }
IceTipCritiquesBeforeCommitBrowser >> openIfCritiques [

	"If the setting is disabled we just commit"
	IceTipCommitSettings critiquesOnCommit ifFalse: [ ^ onAcceptAction value ].
	critiques ifEmpty: [ ^ onAcceptAction value ].
		
	self asDialogWindow
		centeredRelativeTo: self window;
		open
	
]

{ #category : 'accessing - model' }
IceTipCritiquesBeforeCommitBrowser >> setModelBeforeInitialization: someNodes [

	model := someNodes
]

{ #category : 'initialization' }
IceTipCritiquesBeforeCommitBrowser >> titleForWindow [

	^ 'Critiques for Commit on {1} branch {2}' format: { 
			  commitModel repositoryModel name.
			  commitModel repositoryModel branchName }
]

{ #category : 'initialization' }
IceTipCritiquesBeforeCommitBrowser >> updatePresenter [ 

	super updatePresenter.
	
	critiques := IceTipCommitSettings critiquesOnCommit
		ifTrue: [ self calculateCritics ]
		ifFalse: [ #() ].
	
	critiquesList items: critiques.

	critiques ifNotEmpty: [ critiquesList selectIndex: 1].

]

{ #category : 'updating' }
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
