Class {
	#name : #IceTipRepairRepositoryDialog,
	#superclass : #IceTipDialog,
	#instVars : [
		'optionsList',
		'detailPanel',
		'model',
		'selectedOption',
		'reasonPanel'
	],
	#category : #'Iceberg-TipUI-View-Repository'
}

{ #category : #'instance creation' }
IceTipRepairRepositoryDialog class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository) beCached
]

{ #category : #actions }
IceTipRepairRepositoryDialog >> accept [

	self closeWindow.
	selectedOption 
		executeWithContext: self
		model: self model
]

{ #category : #'api - focus' }
IceTipRepairRepositoryDialog >> defaultKeyboardFocus [

	^ optionsList
]

{ #category : #layout }
IceTipRepairRepositoryDialog >> defaultLayout [

	self flag: #TODO. "Replace the fixed height with a correct style"
	^ SpBoxLayout newTopToBottom
		spacing: 2;
		add: reasonPanel height: 70 * self currentWorld displayScaleFactor;
		add: optionsList height: 100 * self currentWorld displayScaleFactor;
		add: detailPanel;
		yourself
]

{ #category : #'accessing - ui' }
IceTipRepairRepositoryDialog >> detailPanel [

	^ detailPanel
]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> initialExtentForWindow [

	^ (700 @ 500) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> initializeDialogWindow: aWindow [

	super initializeDialogWindow: aWindow.

	self refreshDialogButtons.	
	
	aWindow 
		bindKeyCombination: Character cr asShortcut toAction: [ 
			selectedOption ifNotNil: [self accept] ]


]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> initializeOptionsList [

	optionsList
		hideColumnHeaders;
		addColumn: (SpCompositeTableColumn new
			addColumn: (SpImageTableColumn new
				evaluated: #icon;
				beNotExpandable;
				yourself);
			addColumn: (SpStringTableColumn new
				evaluated: #title;
				yourself);
			yourself);
		items: self model availableRepairOptions;
		whenSelectionChangedDo: [ :selection | self selectionChanged: selection selectedItem ];
		whenActivatedDo: [ :selection | selection ifNotNil: [ self accept ] ]
]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> initializePresenters [

	reasonPanel := self newText
		beNotEditable;
		addStyle: 'iceTipReadonly';
		beWrapWord;
		yourself.
	optionsList := self newTable.
	detailPanel := self newText
		beNotEditable;
		beWrapWord;
		addStyle: 'iceTipReadonly';
		yourself.

	self initializeReasonPanel.
	self initializeOptionsList
]

{ #category : #private }
IceTipRepairRepositoryDialog >> initializeReasonPanel [

	reasonPanel text: self model longStatus
]

{ #category : #accessing }
IceTipRepairRepositoryDialog >> model [

	^ model
]

{ #category : #'accessing - ui' }
IceTipRepairRepositoryDialog >> optionsList [

	^ optionsList
]

{ #category : #'accessing - ui' }
IceTipRepairRepositoryDialog >> reasonPanel [

	^ reasonPanel
]

{ #category : #private }
IceTipRepairRepositoryDialog >> refreshDetailPanel [

	selectedOption ifNotNil: [ 
		detailPanel
			text: selectedOption help;
			yourself ]
]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> refreshDialogButtons [

	self window ifNotNil: [ :aWindow |
		aWindow buttons first enabled: (selectedOption isNotNil) ]
]

{ #category : #private }
IceTipRepairRepositoryDialog >> selectionChanged: selectedItem [

	selectedOption := selectedItem.
	self refreshDetailPanel.
	self refreshDialogButtons.	

]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> titleForWindow [

	^ 'Repair repository'
]
