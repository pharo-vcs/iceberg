Class {
	#name : 'IceTipDiscardAllChangesPreviewBrowser',
	#superclass : 'IceTipPreviewBrowser',
	#category : 'Iceberg-TipUI-View-Branch',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Branch'
}

{ #category : 'instance creation' }
IceTipDiscardAllChangesPreviewBrowser class >> onRepository: anIceModelRepository [

	^ self on: (IceTipDiscardAllModel new
			   workingCopy: anIceModelRepository entity workingCopy;
				repository: anIceModelRepository entity;
			   yourself)
]

{ #category : 'operations' }
IceTipDiscardAllChangesPreviewBrowser >> doDiscardAll [
	
	self model newDiscardAction 
		onSuccess: [ self closeWindow ];
		executeWithContext: self
]

{ #category : 'initialization' }
IceTipDiscardAllChangesPreviewBrowser >> initialExtentForWindow [

	^ (900 @ 400) scaledByDisplayScaleFactor
]

{ #category : 'initialization' }
IceTipDiscardAllChangesPreviewBrowser >> initializePresenters [ 

	super initializePresenters.
	
	diffPanel
		leftLabel: 'Working Copy (Image)';
		rightLabel: 'Commit to load: ', self loadCommitShortId
]

{ #category : 'private' }
IceTipDiscardAllChangesPreviewBrowser >> loadCommitShortId [
	| shortId |
	
	shortId := model workingCopy referenceCommit shortId.
	^ shortId size > 7
		ifTrue: [ shortId first: 7 ]
		ifFalse: [ shortId ]	
]

{ #category : 'private - factory' }
IceTipDiscardAllChangesPreviewBrowser >> newActionButton [

	^ self newButton
		label: 'Discard All';
		icon: (self iconNamed: #refresh);
		help: ('Discard all changes from the image and loads the current commit');
		action: [ self doDiscardAll ];
		yourself
]

{ #category : 'initialization' }
IceTipDiscardAllChangesPreviewBrowser >> titleForWindow [
	
	^ 'Preview Changes to Discard'
]
