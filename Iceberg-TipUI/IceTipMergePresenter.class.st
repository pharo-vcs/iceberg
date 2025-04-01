Class {
	#name : 'IceTipMergePresenter',
	#superclass : 'StPresenter',
	#instVars : [
		'merger',
		'fromLabel',
		'toLabel'
	],
	#category : 'Iceberg-TipUI-View-Merge',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Merge'
}

{ #category : 'instance creation' }
IceTipMergePresenter class >> forMerger: anIceMerge [

	^ self on: anIceMerge
]

{ #category : 'layout' }
IceTipMergePresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight 
		  add: fromLabel expand: true;
		  add:  (SpBoxLayout newLeftToRight 
			hAlignEnd
			add: toLabel;  
			yourself);
		  yourself
]

{ #category : 'initialization' }
IceTipMergePresenter >> initializePresenters [

	super initializePresenters.

	fromLabel := self newLabel.
	toLabel := self newLabel.

	fromLabel label: merger sourceDescription.
	toLabel label: merger targetDescription
]

{ #category : 'accessing' }
IceTipMergePresenter >> merger: anIceMerger [

	merger := anIceMerger
]

{ #category : 'accessing' }
IceTipMergePresenter >> setModelBeforeInitialization: aMerger [

	super setModelBeforeInitialization: aMerger.
	self merger: aMerger
]
