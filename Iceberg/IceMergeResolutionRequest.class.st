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

{ #category : 'exception description' }
IceMergeResolutionRequest >> defaultAction [

	| window mergeMorph |
	mergeMorph := (IceTipMergeMorph forMerger: merge).

	mergeMorph
		fromDescription: merge sourceDescription;
		toDescription: merge targetDescription.

	window := mergeMorph newWindow
		title: 'Merge';
		yourself.

	window openModal.
	^ mergeMorph merged
]

{ #category : 'accessing' }
IceMergeResolutionRequest >> merge [
	^ merge
]

{ #category : 'accessing' }
IceMergeResolutionRequest >> merger: anIceMerge [ 
	
	merge := anIceMerge
]
