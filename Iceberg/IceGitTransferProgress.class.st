Class {
	#name : 'IceGitTransferProgress',
	#superclass : 'LGitTransferProgressCallback',
	#instVars : [
		'progress'
	],
	#category : 'Iceberg-Progress',
	#package : 'Iceberg',
	#tag : 'Progress'
}

{ #category : 'private' }
IceGitTransferProgress >> block [

	^ [ :stats :payload |
		  | gitStats received total |
		  gitStats := LGitTransferProgress fromHandle: stats.
		  received := gitStats prim_received_objects.
		  total := gitStats prim_total_objects.
		  progress
			  reportTitle: [
					  'Fetching Git objects... ({1}/{2})' format: {
							  received.
							  total } ]
			  current: received
			  max: total ]
]

{ #category : 'initialization' }
IceGitTransferProgress >> initialize [

	super initialize.
	progress := IceProgress new.
	self initializeBlock
]

{ #category : 'initialization' }
IceGitTransferProgress >> initializeBlock [
	self signature: self class fnSpec block: self block.
]
