"
I preview the changes that will be introduced in the image when a checkout occurs.

(self onBranch: IceRepository registry anyOne branch) openWithSpec.
"
Class {
	#name : 'IceTipCheckoutPreviewBrowser',
	#superclass : 'IceTipPreviewBrowser',
	#instVars : [
		'checkoutStrategyLabel',
		'checkoutStrategyList',
		'selectedCheckoutStrategy'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'private' }
IceTipCheckoutPreviewBrowser class >> maxBranchNameLength [

	^ 32
]

{ #category : 'instance creation' }
IceTipCheckoutPreviewBrowser class >> onBranch: aBranch [

	^ self on: (IceTipCheckoutModel new
		commitish: aBranch;
		yourself)
]

{ #category : 'accessing - ui' }
IceTipCheckoutPreviewBrowser >> checkoutStrategyLabel [

	^ checkoutStrategyLabel
]

{ #category : 'accessing - ui' }
IceTipCheckoutPreviewBrowser >> checkoutStrategyList [

	^ checkoutStrategyList
]

{ #category : 'layout' }
IceTipCheckoutPreviewBrowser >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		spacing: 5;
		add: (SpBoxLayout newLeftToRight
				vAlignCenter;
				spacing: 5;
				add: #checkoutStrategyLabel expand: false;
				add: #checkoutStrategyList;
				yourself)
		  	expand: false;
		add: #diffPanel;
		add: #actionPanel expand: false;
		yourself
]

{ #category : 'actions' }
IceTipCheckoutPreviewBrowser >> doCheckout [

	(self model hasNewPackages and: [ self model checkoutStrategy isLoadAlreadyLoadedStrategy ])
		ifTrue: [ 
			self openAddNewPackagesDialog ]
		ifFalse:	[
			self model newCheckoutAction 
				onSuccess: [ self closeWindow ];
				executeWithContext: self ]
]

{ #category : 'initialization' }
IceTipCheckoutPreviewBrowser >> initializeCheckoutStrategyList [

	| checkoutStrategies |
	checkoutStrategies := self model checkoutStrategies.
	checkoutStrategyList
		items: checkoutStrategies;
		display: [ :each | each description ].
	checkoutStrategyList whenSelectedItemChangedDo: [ :aStrategy | 
		self model checkoutStrategy: aStrategy ]
]

{ #category : 'initialization' }
IceTipCheckoutPreviewBrowser >> initializePresenters [

	super initializePresenters.
	diffPanel
		leftLabel: 'Working Copy';
		rightLabel: 'Checkout ' , (model targetName contractTo: self class maxBranchNameLength).

	checkoutStrategyLabel := self newLabel
		label: 'How to checkout:';
		yourself.
	checkoutStrategyList := self newDropList.
	self initializeCheckoutStrategyList
]

{ #category : 'private - factory' }
IceTipCheckoutPreviewBrowser >> newActionButton [

	^ self newButton
		label: 'Checkout';
		icon: (self iconNamed: #branch);
		help: ('Checks out {1} into your image.' format: { self model targetName });
		action: [ self doCheckout ];
		yourself
]

{ #category : 'operations' }
IceTipCheckoutPreviewBrowser >> openAddNewPackagesDialog [

	((IceTipAddNewPackagesDialogPresenter 
		newApplication: self application 
		model: self model newPackages) 
		checkoutModel: self model;
		checkoutPreviewWindow: self)
		asModalWindow 
			centeredRelativeTo: self window;
			open
]

{ #category : 'accessing' }
IceTipCheckoutPreviewBrowser >> selectedCheckoutStrategy [

	^ selectedCheckoutStrategy
]

{ #category : 'initialization' }
IceTipCheckoutPreviewBrowser >> titleForWindow [

	^ 'Preview checkout of {1}/{2}' format: { 
		self model repositoryName.
		self model targetName }
]
