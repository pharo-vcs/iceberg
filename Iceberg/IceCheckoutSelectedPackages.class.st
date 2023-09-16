"
This is an alternative checkout strategy that includes a list of new packages to be loaded. It works like the load existing package strategy and including new packages in list.
"
Class {
	#name : 'IceCheckoutSelectedPackages',
	#superclass : 'IceCheckoutStrategy',
	#instVars : [
		'packageNames'
	],
	#category : 'Iceberg-Core',
	#package : 'Iceberg',
	#tag : 'Core'
}

{ #category : 'accessing' }
IceCheckoutSelectedPackages class >> canBeUsedFromUI [

	^ false
]

{ #category : 'accessing' }
IceCheckoutSelectedPackages class >> order [
	
	^ 30
]

{ #category : 'checkout' }
IceCheckoutSelectedPackages >> checkoutOn: anIceWorkingCopy [
		
	anIceWorkingCopy loadChangesInWorkingCopy: self diff.
	self repository setHead: committish.
	anIceWorkingCopy referenceCommit: committish commit.

	anIceWorkingCopy loadPackagesNamed: packageNames.

	anIceWorkingCopy markAllPackagesAsClean.
	

]

{ #category : 'accessing' }
IceCheckoutSelectedPackages >> packages: aCollection [ 
	
	packageNames := aCollection 
]
