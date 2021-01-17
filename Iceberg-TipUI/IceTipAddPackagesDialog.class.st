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

	^ SpBoxLayout newVertical
		  add: #packagesList;
		  add: #packageNameText height: self inputTextHeight
]

{ #category : #actions }
IceTipAddPackagesDialog >> accept [

	"ensure window goes away (in case accept comes from a keybinding and not the ok button)"
	self closeWindow.
	selectedPackages ifEmpty: [ 
		UIManager default inform: 'No packages selected.'.
		^ self ].
	self model addPackages: selectedPackages
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
	^ self allPackages reject: [ :rPackage | 
		  currentPackagesNames includes: rPackage name ]
]

{ #category : #initialization }
IceTipAddPackagesDialog >> iconForWindow [

	^ self iconNamed: #branch
]

{ #category : #initialization }
IceTipAddPackagesDialog >> initializePackageNameText [

	packageNameText
		placeholder: 'Enter a package name';
		autoAccept: true;
		whenTextChangedDo: [ :text | self refresh ]
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
				yourself)
]

{ #category : #initialization }
IceTipAddPackagesDialog >> initializePresenters [

	super initializePresenters.
	selectedPackages := OrderedCollection new.
	packagesList := self newTable.
	packageNameText := self newTextInput.

	self initializePackagesList.
	self initializePackageNameText.

	self refresh.
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

{ #category : #'accessing ui' }
IceTipAddPackagesDialog >> packageNameText [

	^ packageNameText
]

{ #category : #'accessing ui' }
IceTipAddPackagesDialog >> packagesList [

	^ packagesList
]

{ #category : #accessing }
IceTipAddPackagesDialog >> refresh [

	packagesList items: (packageNameText text
		ifEmpty: [
			self allPackagesNotRegistered ]
		ifNotEmpty: [ :text |
			self allPackagesNotRegistered select: [ :currPackage | 
				 currPackage name asLowercase includesSubstring:
					 text asString asLowercase ] ])

]

{ #category : #accessing }
IceTipAddPackagesDialog >> selectedPackage [

	^ packagesList selectedItem
]

{ #category : #initialization }
IceTipAddPackagesDialog >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #initialization }
IceTipAddPackagesDialog >> titleForWindow [

	^ 'Add packages'
]

{ #category : #accessing }
IceTipAddPackagesDialog >> validate [

	self
		assert: self selectedPackage isNotNil
		description: 'Please select a branch to checkout.'
]
