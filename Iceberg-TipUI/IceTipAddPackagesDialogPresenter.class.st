"
I'm a dialog to add packages to a repository.
"
Class {
	#name : 'IceTipAddPackagesDialogPresenter',
	#superclass : 'IceTipDialogPresenter',
	#instVars : [
		'model',
		'packagesList',
		'packageNameText',
		'selectedPackages'
	],
	#category : 'Iceberg-TipUI-View-WorkingCopy',
	#package : 'Iceberg-TipUI',
	#tag : 'View-WorkingCopy'
}

{ #category : 'actions' }
IceTipAddPackagesDialogPresenter >> accept [

	"ensure window goes away (in case accept comes from a keybinding and not the ok button)"
	self closeWindow.
	selectedPackages ifEmpty: [ 
		self window inform: 'No packages selected.'.
		^ self ].
	(self model newAddPackagesAction: selectedPackages)
		executeWithContext: self
]

{ #category : 'accessing' }
IceTipAddPackagesDialogPresenter >> allPackages [

	^ self packageOrganizer packages asOrderedCollection sort: [ :a :b | a name < b name ]
]

{ #category : 'accessing' }
IceTipAddPackagesDialogPresenter >> allPackagesNotRegistered [

	| currentPackagesNames |
	currentPackagesNames := self model packages collect: #packageName.
	^ self allPackages reject: [ :rPackage | 
		  currentPackagesNames includes: rPackage name ]
]

{ #category : 'layout' }
IceTipAddPackagesDialogPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: packagesList;
		add: packageNameText expand: false;
		yourself
]

{ #category : 'initialization' }
IceTipAddPackagesDialogPresenter >> iconForWindow [

	^ self iconNamed: #branch
]

{ #category : 'initialization' }
IceTipAddPackagesDialogPresenter >> initializePackageNameText [

	packageNameText
		placeholder: 'Enter a package name';
		autoAccept: true;
		whenTextChangedDo: [ :text | self refresh ]
]

{ #category : 'initialization' }
IceTipAddPackagesDialogPresenter >> initializePackagesList [

	packagesList addColumn: (SpCompositeTableColumn new
		addColumn: (SpCheckBoxTableColumn new
			evaluated: [ :item | selectedPackages includes: item ];
			onActivation: [ :item | selectedPackages add: item ];
			onDeactivation: [ :item | selectedPackages remove: item ifAbsent: [  ] ];
			beNotExpandable;
			yourself);
		addColumn: (SpImageTableColumn new
			evaluated: [ :each | self iconNamed: #package ];
			beNotExpandable;
			yourself);
		addColumn: (SpStringTableColumn new
			evaluated: #name;
			yourself);
		yourself)
]

{ #category : 'initialization' }
IceTipAddPackagesDialogPresenter >> initializePresenters [

	selectedPackages := OrderedCollection new.
	packagesList := self newTable.
	packageNameText := self newTextInput.

	self initializePackagesList.
	self initializePackageNameText
]

{ #category : 'accessing' }
IceTipAddPackagesDialogPresenter >> model [

	^ model
]

{ #category : 'accessing' }
IceTipAddPackagesDialogPresenter >> model: anObject [

	model := anObject.
	self refresh
]

{ #category : 'accessing - ui' }
IceTipAddPackagesDialogPresenter >> packageNameText [

	^ packageNameText
]

{ #category : 'accessing - ui' }
IceTipAddPackagesDialogPresenter >> packagesList [

	^ packagesList
]

{ #category : 'accessing' }
IceTipAddPackagesDialogPresenter >> refresh [

	packagesList items: (packageNameText text
		ifEmpty: [
			self allPackagesNotRegistered ]
		ifNotEmpty: [ :text |
			self allPackagesNotRegistered select: [ :currPackage | 
				 currPackage name asLowercase includesSubstring:
					 text asString asLowercase ] ])

]

{ #category : 'accessing' }
IceTipAddPackagesDialogPresenter >> selectedPackage [

	^ packagesList selectedItem
]

{ #category : 'initialization' }
IceTipAddPackagesDialogPresenter >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'initialization' }
IceTipAddPackagesDialogPresenter >> titleForWindow [

	^ 'Add packages'
]

{ #category : 'initialization' }
IceTipAddPackagesDialogPresenter >> updatePresenter [

	self refresh
]

{ #category : 'accessing' }
IceTipAddPackagesDialogPresenter >> validate [

	self
		assert: self selectedPackage isNotNil
		description: 'Please select a branch to checkout.'
]
