"
Command that checks out the selected branch
"
Class {
	#name : 'IceTipCheckoutSelectedBranchCommand',
	#superclass : 'IceTipRemotesTreeCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipCheckoutSelectedBranchCommand class >> defaultDescription [

	^ 'Checkout this branch'
]

{ #category : 'accessing - defaults' }
IceTipCheckoutSelectedBranchCommand class >> defaultName [

	^ 'Checkout branch'
]

{ #category : 'testing' }
IceTipCheckoutSelectedBranchCommand >> actsOnBranch: aBranchModel [

	^ true
]

{ #category : 'executing' }
IceTipCheckoutSelectedBranchCommand >> execute [

	self item previewCheckout
]

{ #category : 'accessing' }
IceTipCheckoutSelectedBranchCommand >> iconName [
	^ #branch
]
