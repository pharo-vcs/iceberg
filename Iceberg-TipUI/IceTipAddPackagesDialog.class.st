"
I'm a dialog to add packages to a repository.
"
Class {
	#name : #IceTipAddPackagesDialog,
	#superclass : #IceTipDialog,
	#instVars : [
		'model',
		'packagesList',
		'packageNameText',
		'selectedPackages'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #specs }
IceTipAddPackagesDialog class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical 
				add: #packagesList;
				add: #packageNameText height: self inputTextHeight
]

{ #category : #accessing }
IceTipAddPackagesDialog class >> icon [
	^ self iconNamed: #branch
]

{ #category : #accessing }
IceTipAddPackagesDialog class >> order [
	^ 20
]

{ #category : #specs }
IceTipAddPackagesDialog class >> title [
	^ 'Add packages'
]

{ #category : #actions }
IceTipAddPackagesDialog >> accept [
	"ensure window goes away (in case accept comes from a keybinding and not the ok button)"
	self window delete.
	selectedPackages
		ifEmpty: [ UIManager default inform: 'No packages selected.'.
			^ self ].
	self model addPackages: selectedPackages
]

{ #category : #initialization }
IceTipAddPackagesDialog >> addShortcutsTo: aWidget [
	super addShortcutsTo: aWidget.
	aWidget 
		bindKeyCombination: Character cr asKeyCombination 
		toAction: [ self accept ].
	
]

{ #category : #accessing }
IceTipAddPackagesDialog >> allPackages [
	^ RPackageOrganizer default packages
		asOrderedCollection 
		sort: [ :a :b | a name < b name ]
]

{ #category : #accessing }
IceTipAddPackagesDialog >> allPackagesNotRegistered [
	| currentPackagesNames |
	currentPackagesNames := self model packages collect: #packageName.
	^ self allPackages reject: [ :rPackage | currentPackagesNames includes: rPackage name ]
]

{ #category : #accessing }
IceTipAddPackagesDialog >> contextSelection [ 
	^ self selectedPackage
]

{ #category : #initialization }
IceTipAddPackagesDialog >> initializePackageNameText [
	self packageNameText
		whenBuiltDo: [ :ann | 
			ann widget
				bindKeyCombination: Character enter asKeyCombination
					toAction: [ self accept ];
				bindKeyCombination: Character arrowUp asKeyCombination
					toAction: [ self packagesList takeKeyboardFocus.
					self packagesList adapter selectLastVisibleRow ];
				bindKeyCombination: Character arrowDown asKeyCombination
					toAction: [ self packagesList takeKeyboardFocus.
					self packagesList widget selectFirstVisibleRow ] ]
]

{ #category : #initialization }
IceTipAddPackagesDialog >> initializePackagesList [
	packagesList
		addColumn:
			(SpCompositeTableColumn new
				addColumn:
					(SpCheckBoxTableColumn new
						evaluated: [ :item | selectedPackages includes: item ];
						onActivation: [ :item | selectedPackages add: item ];
						onDeactivation: [ :item | selectedPackages remove: item ifAbsent: [  ] ];
						width: 20 * self currentWorld displayScaleFactor;
						yourself);
				addColumn:
					(SpImageTableColumn new
						width: 20;
						evaluated: [ :each | self iconNamed: #package ];
						yourself);
				addColumn:
					(SpStringTableColumn new
						evaluated: #name;
						yourself);
				yourself);
		items: self allPackagesNotRegistered
]

{ #category : #initialization }
IceTipAddPackagesDialog >> initializeWidgets [
	selectedPackages := OrderedCollection new.
	packagesList := self newTable.
	packageNameText := self newTextInput
		placeholder: 'Enter a package name';
		autoAccept: true;
		whenTextChangedDo: [ :text | 
			packagesList
				items:  (self allPackagesNotRegistered
						select:
							[ :currPackage | currPackage name asLowercase includesSubstring: text asString asLowercase ] )
						] .
	self initializePackagesList.
	self initializePackageNameText.
	self focusOrder
		add: self packagesList;
		add: self packageNameText
]

{ #category : #accessing }
IceTipAddPackagesDialog >> model [
	^ model
]

{ #category : #accessing }
IceTipAddPackagesDialog >> model: anObject [
	model := anObject.
	self refresh
]

{ #category : #accessing }
IceTipAddPackagesDialog >> packageNameText [
	^ packageNameText
]

{ #category : #accessing }
IceTipAddPackagesDialog >> packageNameText: anObject [
	packageNameText := anObject
]

{ #category : #accessing }
IceTipAddPackagesDialog >> packagesList [
	^ packagesList
]

{ #category : #accessing }
IceTipAddPackagesDialog >> packagesList: anObject [
	packagesList := anObject
]

{ #category : #accessing }
IceTipAddPackagesDialog >> refresh [
	packagesList widget 
		in: [ :this | 
			this selectRowIndexes: #(). 
			this dataSource 
				rootForItems: self model repositoryModelsByGroup;
				expandAll ];
		refresh.
]

{ #category : #accessing }
IceTipAddPackagesDialog >> selectedPackage [
	| index |
	self flag: #pharoTodo. "This should -maybe- be modeled better on a SpecTablePresenter ;)"
	index := packagesList widget selectedRowIndex.
	index = 0 ifTrue: [ ^ nil ].
	^ packagesList widget dataSource elementAt: index
]

{ #category : #initialization }
IceTipAddPackagesDialog >> setModelBeforeInitialization: anObject [ 
	model := anObject
]

{ #category : #accessing }
IceTipAddPackagesDialog >> validate [
self flag: #Todo .
	self
		assert: self selectedPackage isNotNil
		description: 'Please select a branch to checkout.'
]
