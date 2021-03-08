Class {
	#name : #IceTipDiscardAllChangesPreviewBrowser,
	#superclass : #IceTipPreviewBrowser,
	#category : #'Iceberg-TipUI-View-Branch'
}

{ #category : #'instance creation' }
IceTipDiscardAllChangesPreviewBrowser class >> onRepository: anIceModelRepository [

	^ self on: (IceTipDiscardAllModel new
			   workingCopy: anIceModelRepository entity workingCopy;
				repository: anIceModelRepository entity;
			   yourself)
]

{ #category : #operations }
IceTipDiscardAllChangesPreviewBrowser >> doDiscardAll [
	
	self model executeDiscardAndThen: [ self closeWindow ]
]

{ #category : #initialization }
IceTipDiscardAllChangesPreviewBrowser >> initialExtentForWindow [

	^ (1100 @ 400) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipDiscardAllChangesPreviewBrowser >> initializePresenters [ 

	super initializePresenters.
	
	diffPanel
		leftLabel: 'Working Copy (Image)';
		rightLabel: 'Commit to load: ' , model workingCopy referenceCommit id.

]

{ #category : #initialization }
IceTipDiscardAllChangesPreviewBrowser >> titleForWindow [
	
	^ 'Discards all changes in the Image, and sync it with the current commit'
]
