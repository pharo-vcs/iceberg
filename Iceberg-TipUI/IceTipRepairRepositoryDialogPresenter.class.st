Class {
	#name : 'IceTipRepairRepositoryDialogPresenter',
	#superclass : 'IceTipDialogPresenter',
	#instVars : [
		'optionsList',
		'detailPanel',
		'model',
		'selectedOption',
		'reasonPanel'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'instance creation' }
IceTipRepairRepositoryDialogPresenter class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : 'actions' }
IceTipRepairRepositoryDialogPresenter >> accept [

	self closeWindow.
	selectedOption 
		executeWithContext: self
		model: self model
]

{ #category : 'api - focus' }
IceTipRepairRepositoryDialogPresenter >> defaultKeyboardFocus [

	^ optionsList
]

{ #category : 'layout' }
IceTipRepairRepositoryDialogPresenter >> defaultLayout [

	self flag: #TODO. "Replace the fixed height with a correct style"
	^ SpBoxLayout newTopToBottom
		spacing: 2;
		add: reasonPanel height: 70 * self currentWorld displayScaleFactor;
		add: optionsList height: 100 * self currentWorld displayScaleFactor;
		add: detailPanel;
		yourself
]

{ #category : 'accessing - ui' }
IceTipRepairRepositoryDialogPresenter >> detailPanel [

	^ detailPanel
]

{ #category : 'initialization' }
IceTipRepairRepositoryDialogPresenter >> initialExtentForWindow [

	^ (700 @ 500) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipRepairRepositoryDialogPresenter >> initializeDialogWindow: aWindow [

	super initializeDialogWindow: aWindow.

	self refreshDialogButtons.	
	
	aWindow 
		bindKeyCombination: Character cr asShortcut toAction: [ 
			selectedOption ifNotNil: [self accept] ]


]

{ #category : 'initialization' }
IceTipRepairRepositoryDialogPresenter >> initializeOptionsList [

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

{ #category : 'initialization' }
IceTipRepairRepositoryDialogPresenter >> initializePresenters [

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

{ #category : 'private' }
IceTipRepairRepositoryDialogPresenter >> initializeReasonPanel [

	reasonPanel text: self model longStatus
]

{ #category : 'accessing' }
IceTipRepairRepositoryDialogPresenter >> model [

	^ model
]

{ #category : 'accessing - ui' }
IceTipRepairRepositoryDialogPresenter >> optionsList [

	^ optionsList
]

{ #category : 'accessing - ui' }
IceTipRepairRepositoryDialogPresenter >> reasonPanel [

	^ reasonPanel
]

{ #category : 'private' }
IceTipRepairRepositoryDialogPresenter >> refreshDetailPanel [

	selectedOption ifNotNil: [ 
		detailPanel
			text: selectedOption help;
			yourself ]
]

{ #category : 'initialization' }
IceTipRepairRepositoryDialogPresenter >> refreshDialogButtons [

	self window ifNotNil: [ :aWindow |
		aWindow buttons first enabled: (selectedOption isNotNil) ]
]

{ #category : 'private' }
IceTipRepairRepositoryDialogPresenter >> selectionChanged: selectedItem [

	selectedOption := selectedItem.
	self refreshDetailPanel.
	self refreshDialogButtons.	

]

{ #category : 'initialization' }
IceTipRepairRepositoryDialogPresenter >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'initialization' }
IceTipRepairRepositoryDialogPresenter >> titleForWindow [

	^ 'Repair repository'
]
