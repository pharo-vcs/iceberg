"
I'm a generic panel to checkout panels. 
My children will define different strategies to checkout (select an existing branch -local or remote-, or enter a new branch name)
"
Class {
	#name : #IceTipBranchPanel,
	#superclass : #IceTipSpPresenter,
	#instVars : [
		'model',
		'acceptBlock'
	],
	#category : #'Iceberg-TipUI-View-Branch'
}

{ #category : #'instance creation' }
IceTipBranchPanel class >> onRepository: aRepository [

	^ self on: (IceTipRepositoryModel on: aRepository) beCached
]

{ #category : #actions }
IceTipBranchPanel >> accept [

	self validate.
	self doAccept.
	acceptBlock ifNotNil: [ acceptBlock cull: self ]
]

{ #category : #actions }
IceTipBranchPanel >> doAccept [

	self subclassResponsibility
]

{ #category : #accessing }
IceTipBranchPanel >> icon [

	^ self subclassResponsibility
]

{ #category : #testing }
IceTipBranchPanel >> isNewBranch [

	^ false
]

{ #category : #accessing }
IceTipBranchPanel >> model [

	^ model
]

{ #category : #accessing }
IceTipBranchPanel >> model: anObject [

	model := anObject
]

{ #category : #events }
IceTipBranchPanel >> onAccept: aBlock [

	acceptBlock := aBlock
]

{ #category : #initialization }
IceTipBranchPanel >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #accessing }
IceTipBranchPanel >> validate [
	^ self subclassResponsibility
]
