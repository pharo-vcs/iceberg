"
A strategy to checkout but not load packages into the image
"
Class {
	#name : #IceCheckoutDoNotLoadPackages,
	#superclass : #IceCheckoutStrategy,
	#category : #'Iceberg-Core'
}

{ #category : #accessing }
IceCheckoutDoNotLoadPackages class >> order [
	^ 1000
]

{ #category : #checkout }
IceCheckoutDoNotLoadPackages >> checkoutOn: anIceWorkingCopy [ 
	committish commit adopt.
	self repository setHead: committish
]
