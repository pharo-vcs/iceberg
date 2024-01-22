"
I'm a dialog to perform a checkout of a branch.

(self onRepository: IceRepository registry anyOne) openDialogWithSpec
"
Class {
	#name : 'IceTipCheckoutBranchDialog',
	#superclass : 'IceTipOptionDialogPresenter',
	#instVars : [
		'model',
		'types'
	],
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'instance creation' }
IceTipCheckoutBranchDialog class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : 'accessing' }
IceTipCheckoutBranchDialog >> allTypes [

	^ types ifNil: [ types := self createCheckoutBranchTypes ]
]

{ #category : 'private - factory' }
IceTipCheckoutBranchDialog >> createCheckoutBranchTypes [

	| allTypes |
	"Collect types new+local+remotes"	
	allTypes :=  { 
		IceTipCheckoutNewBranchPanel on: self model. "New branch"
	 	(IceTipCheckoutBranchPanel on: self model) 
			titleForWindow: 'Local';
			icon: (self iconNamed: #branch);
			yourself }, 
	(self model remoteModels collect: [ :each | 
		(IceTipCheckoutBranchPanel on: each)
			titleForWindow: each name;
			icon: (self iconNamed: #remote);
			yourself ]),
	(self model entity pluginManager checkoutBranchPanelsOnModel: self model).
	
	"Doing this because I can trigger the accept inside the panels."
	allTypes do: [ :each | each onAccept: [ self closeWindow ] ].
	
	^ allTypes
]

{ #category : 'actions' }
IceTipCheckoutBranchDialog >> doAccept [

	self selectedType doAccept
]

{ #category : 'initialization' }
IceTipCheckoutBranchDialog >> initialExtentForWindow [

	^ (600 @ 400) scaledByDisplayScaleFactor
]

{ #category : 'accessing' }
IceTipCheckoutBranchDialog >> model [

	^ model
]

{ #category : 'initialization' }
IceTipCheckoutBranchDialog >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'initialization' }
IceTipCheckoutBranchDialog >> titleForWindow [

	^ 'Checkout branch'
]

{ #category : 'accessing' }
IceTipCheckoutBranchDialog >> withOnlyNewBranch [

	types := self allTypes select: #isNewBranch.
	typeList items: types
]

{ #category : 'accessing' }
IceTipCheckoutBranchDialog >> withTypes: aCollection [
	types := aCollection.
	typeList items: types.
]

{ #category : 'accessing' }
IceTipCheckoutBranchDialog >> withoutNewBranch [
	types := self allTypes reject: #isNewBranch.
	typeList items: types.
]
