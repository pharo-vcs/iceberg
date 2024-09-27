Class {
	#name : 'IceMergeResolutionRequest',
	#superclass : 'Notification',
	#instVars : [
		'merge'
	],
	#category : 'Iceberg-Errors',
	#package : 'Iceberg',
	#tag : 'Errors'
}

{ #category : 'accessing' }
IceMergeResolutionRequest >> merge [
	^ merge
]

{ #category : 'accessing' }
IceMergeResolutionRequest >> merger: anIceMerge [ 
	
	merge := anIceMerge
]
