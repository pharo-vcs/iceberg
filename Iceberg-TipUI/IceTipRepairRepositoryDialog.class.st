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
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipRepairRepositoryDialog class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: #reasonPanel 
		withConstraints: [ :constraints |
			constraints 
				height: 70 * self currentWorld displayScaleFactor;
				padding: 2 ];
		add: #optionsList
		withConstraints: [ :constraints |
			constraints 
				height: 100 * self currentWorld displayScaleFactor;
				padding: 2 ];
		add: #detailPanel
		withConstraints: [ :constraints |
			constraints padding: 2 ];
		yourself
]

{ #category : #'instance creation' }
IceTipRepairRepositoryDialog class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository) beCached
]

{ #category : #actions }
IceTipRepairRepositoryDialog >> accept [

	self closeWindow.
	selectedOption executeWith: self model
]

{ #category : #'accessing ui' }
IceTipRepairRepositoryDialog >> detailPanel [

	^ detailPanel
]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> initialExtent [

	^ (700 @ 500) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> initializeOptionsList [

	optionsList
		hideColumnHeaders;
		addColumn:
			(SpCompositeTableColumn new
				addColumn:
					(SpImageTableColumn new
						width: 20;
						evaluated: #icon;
						yourself);
				addColumn:
					(SpStringTableColumn new
						evaluated: #title;
						yourself);
				yourself);
		items: self model availableRepairOptions;
		whenSelectionChangedDo: [ :selection | self selectionChanged: selection selectedItem ] ;
		bindKeyCombination: Character cr toAction: [ self accept ]
]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> initializePresenters [

	super initializePresenters.
	
	reasonPanel := self newText
		beNotEditable;
		yourself.
	optionsList := self newTable
		disable;
		yourself.
	detailPanel := self newText
		beNotEditable;
		yourself.

	self initializeReasonPanel.
	self initializeOptionsList.

]

{ #category : #private }
IceTipRepairRepositoryDialog >> initializeReasonPanel [

	reasonPanel text: self model longStatus
]

{ #category : #accessing }
IceTipRepairRepositoryDialog >> model [

	^ model
]

{ #category : #'accessing ui' }
IceTipRepairRepositoryDialog >> optionsList [

	^ optionsList
]

{ #category : #'accessing ui' }
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

{ #category : #private }
IceTipRepairRepositoryDialog >> selectionChanged: selectedItem [

	selectedOption := selectedItem.
	self refreshDetailPanel
]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #specs }
IceTipRepairRepositoryDialog >> titleForWindow [

	^ 'Repair repository'
]
