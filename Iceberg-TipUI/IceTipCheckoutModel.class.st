Class {
	#name : 'IceTipCheckoutModel',
	#superclass : 'IceTipDiffPreviewModel',
	#instVars : [
		'checkoutStrategy',
		'checkoutStrategies'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipCheckoutModel >> calculateDiff [

	^ commitish entity diffTo: self repository workingCopy
]

{ #category : 'actions' }
IceTipCheckoutModel >> checkout [

	checkoutStrategy
		committish: self commitish;
		diff: self diff entity.

	self commitish checkout: checkoutStrategy
]

{ #category : 'accessing' }
IceTipCheckoutModel >> checkoutStrategies [
	
	^ checkoutStrategies
]

{ #category : 'accessing' }
IceTipCheckoutModel >> checkoutStrategy [
	
	^ checkoutStrategy
]

{ #category : 'accessing' }
IceTipCheckoutModel >> checkoutStrategy: aStrategy [
	checkoutStrategy := aStrategy
]

{ #category : 'testing' }
IceTipCheckoutModel >> hasNewPackages [
	
	^ diffModel tree anySatisfy:[ :aNode | aNode isAddition and: [ aNode definition isPackageDefinition]]
]

{ #category : 'initialization' }
IceTipCheckoutModel >> initialize [

	super initialize.
	checkoutStrategies := IceCheckoutStrategy allStrategies.
	checkoutStrategy := checkoutStrategies first.
]

{ #category : 'actions' }
IceTipCheckoutModel >> newCheckoutAction [ 

	^ IceTipStandardAction new 
		repository: self repository;
		message: ('Checking out {1} from {2}' format: { self targetName. self repositoryName });
		onSuccessRepositoryModified;
		action: [ self checkout ];
		yourself
]

{ #category : 'accessing' }
IceTipCheckoutModel >> newPackages [

	| packageNodes |
	packageNodes := diffModel tree allChildren select: [ :aNode | 
		  aNode value isAddition and: [ aNode definition value isPackageDefinition ] ].
	
	^ packageNodes collect: [ :aNode | aNode value definition ]
]
