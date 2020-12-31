"
Command that checks out the selected tag
"
Class {
	#name : #IceTipCheckoutSelectedTagCommand,
	#superclass : #IceTipRemotesTreeCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipCheckoutSelectedTagCommand class >> defaultDescription [

	^ 'Checkout this tag for this repository. Repository will then be in Detached Head state!'
]

{ #category : #accessing }
IceTipCheckoutSelectedTagCommand class >> defaultName [

	^ 'Checkout tag'
]

{ #category : #testing }
IceTipCheckoutSelectedTagCommand >> actsOnTag: aRemoteModel [

	^ true
]

{ #category : #execution }
IceTipCheckoutSelectedTagCommand >> execute [
	self item previewCheckout
]

{ #category : #accessing }
IceTipCheckoutSelectedTagCommand >> iconName [
	^ #checkout
]
