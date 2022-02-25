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

{ #category : #layout }
IceTipAddNewPackagesDialog class >> defaultLayout [

	^ SpBoxLayout newTopToBottom
			add: #problemDescription height: (self labelHeight * 4);
			add: #packagesList;
			yourself
]

{ #category : #actions }
IceTipAddNewPackagesDialog >> accept [

	| selectedPackageNames |
	selectedPackageNames := selectedPackages collect: [ :e | e name ].

	checkoutModel checkoutStrategy: (IceCheckoutSelectedPackages new 
		packages: selectedPackageNames;
		yourself).
		
	checkoutModel executeCheckoutActionAndThen: [ 
		self closeWindow.
		checkoutPreviewWindow closeWindow ]
]

{ #category : #accessing }
IceTipAddNewPackagesDialog >> checkoutModel: anIceTipCheckoutModel [ 
	
	checkoutModel := anIceTipCheckoutModel
]

{ #category : #accessing }
IceTipAddNewPackagesDialog >> checkoutPreviewWindow: anIceTipCheckoutPreviewBrowser [ 
	
	checkoutPreviewWindow := anIceTipCheckoutPreviewBrowser 
]

{ #category : #initialization }
IceTipAddNewPackagesDialog >> iconForWindow [

	^ self iconNamed: #branch
]

{ #category : #initialization }
IceTipAddNewPackagesDialog >> initializePackagesList [

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
						evaluated: [:e | e name];
						yourself);
				yourself)
]

{ #category : #initialization }
IceTipAddNewPackagesDialog >> initializePresenters [

	super initializePresenters.
	selectedPackages := OrderedCollection new.
	packagesList := self newTable.
	problemDescription := self newText
		beNotEditable;
		addStyle: 'iceTipReadonly';
		beWrapWord;
		yourself.

	problemDescription text: 'One or more packages unloaded packages (they are in the repository, but not in the image) has been changed.
Please select the packages if you wish to load them in the image'.

	self initializePackagesList.

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
