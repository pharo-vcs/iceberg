"
I'm a direct merge.
I will perform a simple merge: 
	
	Current branch <- Merging branch

This is the default merge mechanism (what users do most of the time)
"
Class {
	#name : 'IceTipDirectMergeType',
	#superclass : 'IceTipMergeType',
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'executing' }
IceTipDirectMergeType >> newMergeAction: aModel [

	^ aModel newDirectMergeAction
]
