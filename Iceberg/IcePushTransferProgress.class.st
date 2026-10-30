Class {
	#name : 'IcePushTransferProgress',
	#superclass : 'LGitPushTransferProgressCallback',
	#instVars : [
		'progress'
	],
	#category : 'Iceberg-Progress',
	#package : 'Iceberg',
	#tag : 'Progress'
}

{ #category : 'private' }
IcePushTransferProgress >> block [

	^ [ :current :total :bytes :payload |
		  progress
			  reportTitle: [
					  self title , ' ({1}/{2})' format: {
							  current.
							  total } ]
			  current: current
			  max: total ]
]

{ #category : 'initialization' }
IcePushTransferProgress >> initialize [

	super initialize.
	progress := IceProgress new.
	self initializeBlock
]

{ #category : 'initialization' }
IcePushTransferProgress >> initializeBlock [

	self 
		signature: self class fnSpec 
		block: self block.
]

{ #category : 'accessing' }
IcePushTransferProgress >> title [
	^ 'Pushing...'
]
