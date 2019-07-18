"
I'm a status bar to be added at the bottom of a window. 
I have items inside, but the items itself can be anything you want (text, icons, buttons, etc).
"
Class {
	#name : #IceTipStatusBar,
	#superclass : #IceTipItemBar,
	#instVars : [
		'leftItems',
		'rightItems'
	],
	#category : #'Iceberg-TipUI-Spec-ItemBar'
}

{ #category : #specs }
IceTipStatusBar class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newHorizontal
		add: #leftPanel withConstraints: [ :constraints |
			constraints 
				expand: true;
				fill: true ];
		add: #rightPanel withConstraints: [ :constraints |
			constraints 
				expand: true;
				fill: true ];
		yourself
]

{ #category : #adding }
IceTipStatusBar >> addItemRight: aButtonPresenter [
	
	rightItems add: aButtonPresenter
]

{ #category : #initialization }
IceTipStatusBar >> initialize [
	super initialize.

	rightItems := OrderedCollection new.
	leftItems := OrderedCollection new.	
]

{ #category : #initialization }
IceTipStatusBar >> initializeWidgets [

	leftPanel := self newNullPresenter.
	rightPanel := self newNullPresenter


]

{ #category : #accessing }
IceTipStatusBar >> items [
	^ items
]

{ #category : #refreshing }
IceTipStatusBar >> rebuildDynamicPresenters [
	
	| leftBuilder rightBuilder |
	
	leftBuilder := SpDynamicPresentersListBuilder new
		modelObjects: leftItems;
		presenterProvidedBy: [ :item  | item presenterClass ]
		configuredAs: [ :button :item | self ];
		layoutBuilder: (SpDynamicLeftToRightColumnsLayout columns: (leftItems size max: 1));
		yourself.	
	
	self newDynamicPresentersListIn: #leftPanel usingBuilder: leftBuilder.
		
	rightBuilder := SpDynamicPresentersListBuilder new
		modelObjects: rightItems;
		presenterProvidedBy: [ :item  | item presenterClass ]
		configuredAs: [ :presenter :item | item configurePresenter: presenter ];
		layoutBuilder: (IceTipStatusBarLayoutBuilder new beRightSide; yourself);
		yourself.	
	
	self newDynamicPresentersListIn: #rightPanel usingBuilder: rightBuilder
]

{ #category : #adding }
IceTipStatusBar >> refresh [

	rightItems removeAll.
	leftItems removeAll.

	items do: [ :each | each position addItem: each into: self ].
	
	self rebuildDynamicPresenters
]
