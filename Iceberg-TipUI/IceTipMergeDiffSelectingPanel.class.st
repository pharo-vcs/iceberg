Class {
	#name : #IceTipMergeDiffSelectingPanel,
	#superclass : #IceTipDiffPanel,
	#instVars : [
		'selectedItems',
		'codePanel'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipMergeDiffSelectingPanel class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newHorizontal
		add: #changeList width: 200;
		add:
			(SpBoxLayout newVertical
				add: #diffPanel;
				add: #codePanel;
				yourself );
		yourself
]

{ #category : #initialization }
IceTipMergeDiffSelectingPanel >> changeListColumn [
	^ SpCompositeTableColumn new
		addColumn:
			(SpCheckBoxTableColumn new
				width: 20;
				evaluated: [ :item | selectedItems includes: item ];
				onActivation: [ :item | 
					selectedItems add: item.
					item value selectLeft.
					item children isEmptyOrNil
						ifFalse: [ item allChildrenDo: [ :child | selectedItems add: child ].
							self basicRefresh ].
					self
						refreshCodePanel: item value chosenOperation definition contents ];
				onDesactivation: [ :item | 
					selectedItems remove: item.
					item value selectRight.
					item children isEmptyOrNil
						ifFalse: [ item
								allChildrenDo: [ :child | selectedItems remove: child ifAbsent: [  ] ].
							self basicRefresh ].
					self refreshCodePanel: item value chosenOperation definition contents ]);
		addColumn:
			(SpImageTableColumn new
				width: 20;
				evaluated: [ :each | each value chosenOperation icon ];
				yourself);
		addColumn:
			(SpStringTableColumn new
				evaluated: [ :each | each definition name ];
				yourself);
		yourself
]

{ #category : #accessing }
IceTipMergeDiffSelectingPanel >> codePanel [
	^codePanel 
]

{ #category : #accessing }
IceTipMergeDiffSelectingPanel >> codePanel: aCodePresenter [
codePanel := aCodePresenter 
]

{ #category : #private }
IceTipMergeDiffSelectingPanel >> entryRemoved: ann [
	self refresh
]

{ #category : #initialization }
IceTipMergeDiffSelectingPanel >> initialize [
	super initialize.
	self subscribeToAnnouncements.
	selectedItems := Set new.
	self model treeRoots
		do: [ :root | 
			root selfAndAllChildrenDo: [ :child | selectedItems add: child. child value isConflict ifTrue: child value selectLeft ]]
]

{ #category : #initialization }
IceTipMergeDiffSelectingPanel >> initializeCodePanel [
codePanel text: ''.
]

{ #category : #initialization }
IceTipMergeDiffSelectingPanel >> initializeWidgets [ 
super initializeWidgets.
codePanel := self newCode.
self initializeCodePanel.
]

{ #category : #'private factory' }
IceTipMergeDiffSelectingPanel >> newChangeTreeDataSource [

	^ IceTipTreeSelectingDataSource new
		tool: self;
		rootForItems: self model treeRoots;
		childrenBlock: [ :data | data children ];
		icon: [ :each | each value icon ];
		format: #description;
		selectAll;
		yourself
]

{ #category : #accessing }
IceTipMergeDiffSelectingPanel >> refresh [
	super refresh. self model treeRoots
		do: [ :root | 
			selectedItems add: root.
			root allChildrenDo: [ :child | selectedItems add: child ] ]
]

{ #category : #'as yet unclassified' }
IceTipMergeDiffSelectingPanel >> refreshCodePanel: text [
	codePanel text: text
]

{ #category : #private }
IceTipMergeDiffSelectingPanel >> resetDataSource: aDataSource [
	super resetDataSource: aDataSource.
	aDataSource selectAll
]

{ #category : #accessing }
IceTipMergeDiffSelectingPanel >> selectedItems [
	^selectedItems
]

{ #category : #'event handling' }
IceTipMergeDiffSelectingPanel >> selectionChanged [
	| itemValue definition |
	super selectionChanged.
	itemValue := changeList selectedItem value.
	itemValue
		ifNotNil: [ definition := itemValue chosenOperation definition.
						definition isMethodDefinition ifTrue: [	codePanel text: definition sourceCode ]
						ifFalse: [ codePanel text: definition contents ]
]
]

{ #category : #initialize }
IceTipMergeDiffSelectingPanel >> subscribeToAnnouncements [
	self announcer
		when: IceTipDiffEntryRemoved 
		send: #entryRemoved:
		to: self	
]
