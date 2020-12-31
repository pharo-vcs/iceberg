"
Command that checks out the selected branch
"
Class {
	#name : #IceTipCheckoutSelectedBranchCommand,
	#superclass : #IceTipRemotesTreeCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipCheckoutSelectedBranchCommand class >> defaultDescription [

	^ 'Checkout this branch'
]

{ #category : #accessing }
IceTipCheckoutSelectedBranchCommand class >> defaultName [

	^ 'Checkout branch'
]

{ #category : #testing }
IceTipCheckoutSelectedBranchCommand >> actsOnBranch: aBranchModel [

	^ true
]

{ #category : #execution }
IceTipCheckoutSelectedBranchCommand >> execute [

	self item previewCheckout
]

{ #category : #accessing }
IceTipCheckoutSelectedBranchCommand >> iconName [
	^ #branch
]
