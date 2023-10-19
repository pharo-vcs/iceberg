"
I'm a panel to peform the checkout of an existing branch.
"
Class {
	#name : 'IceTipCheckoutBranchPanel',
	#superclass : 'IceTipExistingBranchPanel',
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'actions' }
IceTipCheckoutBranchPanel >> doAccept [

	self selectedBranch previewCheckout
]
