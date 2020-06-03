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
	<spec: #default>
	^ SpBoxLayout newVertical
		add: #reasonPanel height: 70 * self currentWorld displayScaleFactor;
		add: #optionsList height: 100 * self currentWorld displayScaleFactor;
		add: #detailPanel;
		yourself
]

{ #category : #'instance creation' }
IceTipRepairRepositoryDialog class >> onRepository: aRepository [
	^ self on: (IceTipRepositoryModel on: aRepository) beCached
]

{ #category : #specs }
IceTipRepairRepositoryDialog class >> title [
	^ 'Repair repository'
]

{ #category : #actions }
IceTipRepairRepositoryDialog >> accept [
	self window delete.
	selectedOption executeWith: self model
]

{ #category : #'accessing ui' }
IceTipRepairRepositoryDialog >> detailPanel [
	^ detailPanel
]

{ #category : #'accessing ui' }
IceTipRepairRepositoryDialog >> detailPanel: anObject [
	detailPanel := anObject
]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> initialExtent [
	^ (700@500) scaledByDisplayScaleFactor 
]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> initializeOptionsList [
	optionsList
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

{ #category : #private }
IceTipRepairRepositoryDialog >> initializeReasonPanel [
	reasonPanel text: self model longStatus.
]

{ #category : #initialization }
IceTipRepairRepositoryDialog >> initializeWidgets [
self flag: 'To-do' "Make these spTextPresenter non editable.".
	reasonPanel := self newText disable.
	optionsList := self newTable disable.
	detailPanel := self newText disable.
	self initializeReasonPanel.
	self initializeOptionsList.
	self focusOrder add: self optionsList
]

{ #category : #accessing }
IceTipRepairRepositoryDialog >> model [
	^ model
]

{ #category : #'private factory' }
IceTipRepairRepositoryDialog >> newOptionsListDataSource [
	^ IceTipDataSource new 
		tool: self;
		elements: self model availableRepairOptions;
		yourself
]

{ #category : #'accessing ui' }
IceTipRepairRepositoryDialog >> optionsList [
	^ optionsList
]

{ #category : #'accessing ui' }
IceTipRepairRepositoryDialog >> optionsList: anObject [
	optionsList := anObject
]

{ #category : #accessing }
IceTipRepairRepositoryDialog >> reasonPanel [
	^ reasonPanel
]

{ #category : #accessing }
IceTipRepairRepositoryDialog >> reasonPanel: anObject [
	reasonPanel := anObject
]

{ #category : #private }
IceTipRepairRepositoryDialog >> refreshDetailPanel [
	selectedOption
		ifNotNil: [detailPanel text: selectedOption help;
						yourself]
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
