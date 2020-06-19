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

{ #category : #specs }
IceTipPreviewBrowser class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
				add: #diffPanel;
				add: #actionPanel height: 25;
			yourself
]

{ #category : #'accessing ui' }
IceTipPreviewBrowser >> actionPanel [
	^ actionPanel
]

{ #category : #'accessing ui' }
IceTipPreviewBrowser >> actionPanel: anObject [
	actionPanel := anObject
]

{ #category : #accessing }
IceTipPreviewBrowser >> contextClass [
	^ IceTipBranchContext
]

{ #category : #'accessing ui' }
IceTipPreviewBrowser >> diffPanel [
	^ diffPanel
]

{ #category : #'accessing ui' }
IceTipPreviewBrowser >> diffPanel: anObject [
	diffPanel := anObject
]

{ #category : #accessing }
IceTipPreviewBrowser >> initialExtent [
	^ (800 @ 400) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipPreviewBrowser >> initializeWidgets [
	super initializeWidgets.
	
	diffPanel := self instantiate: IceTipDiffPanel on: self model diff.
	actionPanel := self instantiate: IceTipActionPanel.
	actionPanel addAction: (button := self newActionButton).
	
	self addShortcutsTo: self.
	
	self focusOrder 
		add: self actionPanel;
		add: self diffPanel
]

{ #category : #initialization }
IceTipPreviewBrowser >> initializeWindow: aWindowPresenter [
	aWindowPresenter
		title: self title;
		initialExtent: self initialExtent;
		windowIcon: self windowIcon;
		askOkToClose: self askOkToClose;
		aboutText: self aboutText
]

{ #category : #'private factory' }
IceTipPreviewBrowser >> newActionButton [
	self subclassResponsibility
]
