"
I'm a dialog to perform a merge of a branch.

(self onRepository: IceRepository registry anyOne) openDialogWithSpec
"
Class {
	#name : 'IceTipMergeBranchDialogPresenter',
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
IceTipMergeBranchDialogPresenter class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository)
]

{ #category : 'accessing' }
IceTipMergeBranchDialogPresenter >> allTypes [

	^ types ifNil: [ types := self createMergeBranchTypes ]
]

{ #category : 'accessing' }
IceTipMergeBranchDialogPresenter >> beSwitchAndMerge [

	self allTypes do: #beSwitchAndMerge
]

{ #category : 'private - factory' }
IceTipMergeBranchDialogPresenter >> createMergeBranchTypes [

	| allTypes |
	"Collect types local+remotes"
	allTypes := { ((IceTipMergeBranchPanel on: self model)
		             titleForWindow: 'Local';
		             icon: (self iconNamed: #branch);
		             yourself) }
	            , (self model remoteModels collect: [ :each |
			             (IceTipMergeBranchPanel on: each)
				             titleForWindow: each name;
				             icon: (self iconNamed: #remote);
				             yourself ]).

	"Doing this because I can trigger the accept inside the panels."
	allTypes do: [ :each | each onAccept: [ self closeWindow ] ].

	^ allTypes
]

{ #category : 'actions' }
IceTipMergeBranchDialogPresenter >> doAccept [

	self selectedType doAccept
]

{ #category : 'initialization' }
IceTipMergeBranchDialogPresenter >> initialExtentForWindow [

	^ (600 @ 400) scaledByDisplayScaleFactor
]

{ #category : 'accessing' }
IceTipMergeBranchDialogPresenter >> model [

	^ model
]

{ #category : 'accessing' }
IceTipMergeBranchDialogPresenter >> model: anObject [

	model := anObject.
	self allTypes do: [ :each | each model: anObject ]
]

{ #category : 'accessing - model' }
IceTipMergeBranchDialogPresenter >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : 'initialization' }
IceTipMergeBranchDialogPresenter >> titleForWindow [

	^ 'Select branch to merge into ' , (self model branchName contractTo: 45)
]

{ #category : 'activation' }
IceTipMergeBranchDialogPresenter >> updateWindowTitle [

	self window title: self titleForWindow
]
