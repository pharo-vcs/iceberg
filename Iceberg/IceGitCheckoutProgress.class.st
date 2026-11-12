Class {
	#name : 'IceGitCheckoutProgress',
	#superclass : 'LGitCheckoutProgressCallback',
	#instVars : [
		'progress'
	],
	#category : 'Iceberg-Progress',
	#package : 'Iceberg',
	#tag : 'Progress'
}

{ #category : 'private' }
IceGitCheckoutProgress >> block [

	^ [ :path :completed :total :payload |
		  progress
			  reportTitle: [
					  'Checking out... ({1}/{2})' format: {
							  completed.
							  total } ]
			  current: completed
			  max: total ]
]

{ #category : 'initialization' }
IceGitCheckoutProgress >> initialize [

	super initialize.
	progress := IceProgress new.
	self initializeBlock
]

{ #category : 'initialization' }
IceGitCheckoutProgress >> initializeBlock [
	self signature: self class fnSpec block: self block.
]
