"
I am an small dialog to ask the user to select new packages to load. New packages are packages in the commit but not in the image.
"
Class {
	#name : 'IceTipAddNewPackagesDialogPresenter',
	#superclass : 'IceTipDialogPresenter',
	#instVars : [
		'packagesList',
		'selectedPackages',
		'packages',
		'problemDescription',
		'checkoutModel',
		'checkoutPreviewWindow'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'commands' }
IceTipAddNewPackagesDialogPresenter class >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [

	rootCommandGroup register:
		((CmCommandGroup named: 'package list commands') asSpecGroup
			 register: (IceTipSelectAllPackagesCommand forSpecContext: presenterInstance);
			 register: (IceTipUnselectAllPackagesCommand forSpecContext: presenterInstance);
			 yourself)
]

{ #category : 'actions' }
IceTipAddNewPackagesDialogPresenter >> accept [

	| selectedPackageNames |
	selectedPackageNames := selectedPackages collect: [ :e | e name ].

	checkoutModel checkoutStrategy: (IceCheckoutSelectedPackages new 
		packages: selectedPackageNames;
		yourself).
		
	checkoutModel newCheckoutAction
		onSuccess: [ 
			self closeWindow.
			checkoutPreviewWindow closeWindow ];
		executeWithContext: self
]

{ #category : 'accessing' }
IceTipAddNewPackagesDialogPresenter >> checkoutModel: anIceTipCheckoutModel [ 
	
	checkoutModel := anIceTipCheckoutModel
]

{ #category : 'accessing' }
IceTipAddNewPackagesDialogPresenter >> checkoutPreviewWindow: anIceTipCheckoutPreviewBrowser [ 
	
	checkoutPreviewWindow := anIceTipCheckoutPreviewBrowser 
]

{ #category : 'layout' }
IceTipAddNewPackagesDialogPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
			add: problemDescription expand: false;
			add: packagesList;
			yourself
]

{ #category : 'initialization' }
IceTipAddNewPackagesDialogPresenter >> iconForWindow [

	^ self iconNamed: #branch
]

{ #category : 'initialization' }
IceTipAddNewPackagesDialogPresenter >> initializePackagesList [

	packagesList
		addColumn: (SpCompositeTableColumn new
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
				evaluated: [:e | e name];
				yourself));
		contextMenu: [ (self rootCommandsGroup / 'package list commands') beRoot asMenuPresenter ]
]

{ #category : 'initialization' }
IceTipAddNewPackagesDialogPresenter >> initializePresenters [

	selectedPackages := OrderedCollection new.
	packagesList := self newTable.
	problemDescription := self newText
		beNotEditable;
		addStyle: 'iceTipReadonly';
		addStyle: 'iceTipText4Lines';
		beWrapWord;
		yourself.

	problemDescription text: 'One or more packages unloaded packages (they are in the repository, but not in the image) has been changed.
Please select the packages if you wish to load them in the image'.

	self initializePackagesList
]

{ #category : 'accessing - ui' }
IceTipAddNewPackagesDialogPresenter >> packagesList [

	^ packagesList
]

{ #category : 'accessing' }
IceTipAddNewPackagesDialogPresenter >> selectedPackage [

	^ packagesList selectedItem
]

{ #category : 'accessing' }
IceTipAddNewPackagesDialogPresenter >> selectedPackages [

	^ selectedPackages
]

{ #category : 'accessing' }
IceTipAddNewPackagesDialogPresenter >> selectedPackages: anObject [

	selectedPackages := anObject
]

{ #category : 'accessing - model' }
IceTipAddNewPackagesDialogPresenter >> setModelBeforeInitialization: somePackages [

	packages := somePackages
]

{ #category : 'initialization' }
IceTipAddNewPackagesDialogPresenter >> titleForWindow [ 

	^ 'Select New Packages to Load'.
]

{ #category : 'initialization' }
IceTipAddNewPackagesDialogPresenter >> updatePresenter [

	packagesList items: packages
]

{ #category : 'validation' }
IceTipAddNewPackagesDialogPresenter >> validate [

	self
		assert: self selectedPackage isNotNil
		description: 'Please select a branch to checkout.'
]
