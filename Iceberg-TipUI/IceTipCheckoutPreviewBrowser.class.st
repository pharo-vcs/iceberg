"
I preview the changes that will be introduced in the image when a checkout occurs.

(self onBranch: IceRepository registry anyOne branch) openWithSpec.
"
Class {
	#name : #IceTipCheckoutPreviewBrowser,
	#superclass : #IceTipPreviewBrowser,
	#instVars : [
		'checkoutStrategyLabel',
		'checkoutStrategyList',
		'selectedCheckoutStrategy'
	],
	#category : #'Iceberg-TipUI-View-Branch'
}

{ #category : #specs }
IceTipCheckoutPreviewBrowser class >> defaultSpec [

	^ SpBoxLayout newVertical
		  add: (SpBoxLayout newHorizontal
				   add: #checkoutStrategyLabel
				   width: 100 * self currentWorld displayScaleFactor;
				   add: #checkoutStrategyList;
				   yourself)
		  height: self inputTextHeight;
		  add: #diffPanel height: 300;
		  add: #actionPanel;
		  yourself
]

{ #category : #'instance creation' }
IceTipCheckoutPreviewBrowser class >> onBranch: aBranch [

	^ self on: (IceTipCheckoutModel new
		commitish: aBranch;
		yourself)
]

{ #category : #'accessing ui' }
IceTipCheckoutPreviewBrowser >> checkoutStrategyLabel [

	^ checkoutStrategyLabel
]

{ #category : #'accessing ui' }
IceTipCheckoutPreviewBrowser >> checkoutStrategyList [

	^ checkoutStrategyList
]

{ #category : #actions }
IceTipCheckoutPreviewBrowser >> doCheckout [

	self model executeCheckoutActionAndThen: [ self closeWindow ]
]

{ #category : #initialization }
IceTipCheckoutPreviewBrowser >> initializeCheckoutStrategyList [

	| checkoutStrategies |
	checkoutStrategies := self model checkoutStrategies.
	checkoutStrategyList
		items: checkoutStrategies;
		display: [ :each | each description ].
	checkoutStrategyList whenSelectedItemChangedDo: [ :aStrategy | 
		self model checkoutStrategy: aStrategy ]
]

{ #category : #initialization }
IceTipCheckoutPreviewBrowser >> initializePresenters [

	super initializePresenters.
	diffPanel
		leftLabel: 'Working Copy';
		rightLabel: 'Checkout ' , model targetName.
	
	checkoutStrategyLabel := self newLabel label: 'How to checkout:'; yourself.
	checkoutStrategyList := self newDropList.
	self initializeCheckoutStrategyList.

]

{ #category : #'private factory' }
IceTipCheckoutPreviewBrowser >> newActionButton [

	^ self newButton
		label: 'Checkout';
		icon: (self iconNamed: #branch);
		help: ('Checks out {1} into your image.' format: { self model targetName });
		action: [ self doCheckout ];
		yourself
]

{ #category : #accessing }
IceTipCheckoutPreviewBrowser >> selectedCheckoutStrategy [

	^ selectedCheckoutStrategy
]

{ #category : #initialization }
IceTipCheckoutPreviewBrowser >> titleForWindow [

	^ 'Preview checkout of {1}/{2}' format: { 
		self model repositoryName.
		self model targetName }
]
