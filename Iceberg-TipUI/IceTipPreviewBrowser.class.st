"
I'm a browser to show a preview of an operation that can be made right after.
Tipically, I'm using through my chldren, to do a checkout or merge.
"
Class {
	#name : #IceTipPreviewBrowser,
	#superclass : #IceTipBrowser,
	#instVars : [
		'diffPanel',
		'actionPanel',
		'button'
	],
	#category : #'Iceberg-TipUI-View-Branch'
}

{ #category : #commands }
IceTipPreviewBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	"Nothing to add"
]

{ #category : #commands }
IceTipPreviewBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	"Nothing to add"
]

{ #category : #specs }
IceTipPreviewBrowser class >> defaultSpec [

	^ SpBoxLayout newTopToBottom
		  add: #diffPanel;
		  add: #actionPanel expand: false;
		  yourself
]

{ #category : #'accessing - ui' }
IceTipPreviewBrowser >> actionPanel [

	^ actionPanel
]

{ #category : #'accessing - ui' }
IceTipPreviewBrowser >> diffPanel [

	^ diffPanel
]

{ #category : #initialization }
IceTipPreviewBrowser >> initialExtentForWindow [

	^ (800 @ 400) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipPreviewBrowser >> initializePresenters [

	super initializePresenters.
	
	diffPanel := self instantiate: IceTipDiffPanel on: self model diff.
	actionPanel := self newButtonBar.
	actionPanel add: (button := self newActionButton).

]

{ #category : #'accessing - ui' }
IceTipPreviewBrowser >> mainList [
	"Answer the presenter that is the main list of items of this browser."

	^ diffPanel iceNodesTree
]

{ #category : #'private - factory' }
IceTipPreviewBrowser >> newActionButton [
	self subclassResponsibility
]
