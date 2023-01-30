"
I am an small dialog to ask the user to select new packages to load. New packages are packages in the commit but not in the image.
"
Class {
	#name : #IceTipAddNewPackagesDialog,
	#superclass : #IceTipDialog,
	#instVars : [
		'packagesList',
		'selectedPackages',
		'packages',
		'problemDescription',
		'checkoutModel',
		'checkoutPreviewWindow'
	],
	#category : #'Iceberg-TipUI-View-Branch'
}

{ #category : #actions }
IceTipAddNewPackagesDialog >> accept [

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

{ #category : #commands }
IceTipAddNewPackagesDialog >> buildCommandsGroupWith: presenterInstance forRoot: rootCommandGroup [

	rootCommandGroup
		register: ((CmCommandGroup named: 'package list commands') asSpecGroup
			register: IceTipSelectAllPackagesCommand forSpec;
			register: IceTipUnselectAllPackagesCommand forSpec;
			yourself)
]

{ #category : #accessing }
IceTipAddNewPackagesDialog >> checkoutModel: anIceTipCheckoutModel [ 
	
	checkoutModel := anIceTipCheckoutModel
]

{ #category : #accessing }
IceTipAddNewPackagesDialog >> checkoutPreviewWindow: anIceTipCheckoutPreviewBrowser [ 
	
	checkoutPreviewWindow := anIceTipCheckoutPreviewBrowser 
]

{ #category : #layout }
IceTipAddNewPackagesDialog >> defaultLayout [

	^ SpBoxLayout newTopToBottom
			add: problemDescription expand: false;
			add: packagesList;
			yourself
]

{ #category : #initialization }
IceTipAddNewPackagesDialog >> iconForWindow [

	^ self iconNamed: #branch
]

{ #category : #initialization }
IceTipAddNewPackagesDialog >> initializePackagesList [

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

{ #category : #initialization }
IceTipAddNewPackagesDialog >> initializePresenters [

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

{ #category : #'accessing - ui' }
IceTipAddNewPackagesDialog >> packagesList [

	^ packagesList
]

{ #category : #accessing }
IceTipAddNewPackagesDialog >> selectedPackage [

	^ packagesList selectedItem
]

{ #category : #'accessing - model' }
IceTipAddNewPackagesDialog >> setModelBeforeInitialization: somePackages [

	packages := somePackages
]

{ #category : #initialization }
IceTipAddNewPackagesDialog >> titleForWindow [ 

	^ 'Select New Packages to Load'.
]

{ #category : #initialization }
IceTipAddNewPackagesDialog >> updatePresenter [

	packagesList items: packages
]

{ #category : #validation }
IceTipAddNewPackagesDialog >> validate [

	self
		assert: self selectedPackage isNotNil
		description: 'Please select a branch to checkout.'
]
