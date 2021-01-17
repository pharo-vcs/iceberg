"
I'm the superclass of Spec2 browsers in Iceberg Tip-UI. Each concrete subclass has some kind
of list or table that contain the items that are being browsed.

Some design remarks: 

* Each browser has to have ONE model as entry point for data, and JUST ONE. See #model accessor.
* Browsers have a toolbar with commands that are applicable for the model.
* Browsers have a context menu on list or table items, that provide commands that are specific for the selection.
"
Class {
	#name : #IceTipBrowser,
	#superclass : #IceTipSpPresenter,
	#instVars : [
		'model',
		'toolbar'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #commands }
IceTipBrowser class >> buildCommandsGroupWith: presenter forRoot: aCommandGroup [

	| generalCommandGroup selectionCommandGroup selectionExtraCommandGroup |
	selectionCommandGroup :=
		(CmCommandGroup named: self selectionCommandGroupName) asSpecGroup.
	selectionExtraCommandGroup :=
		(CmCommandGroup named: self selectionExtraCommandGroupName) asSpecGroup.
	generalCommandGroup := 
		(CmCommandGroup named: self generalCommandGroupName) asSpecGroup.

	aCommandGroup
		register: selectionCommandGroup;
		register: generalCommandGroup.
		
	self
		buildSelectionCommandGroupWith: presenter for: selectionCommandGroup;
		buildSelectionExtraCommandGroupWith: presenter for: selectionExtraCommandGroup;
		buildGeneralCommandGroupWith: presenter for: generalCommandGroup.

	selectionCommandGroup register: selectionExtraCommandGroup.

]

{ #category : #commands }
IceTipBrowser class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	self subclassResponsibility
]

{ #category : #commands }
IceTipBrowser class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	self subclassResponsibility
]

{ #category : #commands }
IceTipBrowser class >> buildSelectionExtraCommandGroupWith: presenter for: aCommandGroup [

	aCommandGroup register: IceTipInspectCommand forSpec
]

{ #category : #commands }
IceTipBrowser class >> generalCommandGroupName [

	^ 'General'
]

{ #category : #commands }
IceTipBrowser class >> selectionCommandGroupName [

	^ 'Selection'
]

{ #category : #commands }
IceTipBrowser class >> selectionExtraCommandGroupName [

	^ 'Extra'
]

{ #category : #initialization }
IceTipBrowser >> addToolbarIfNotEmptyIn: aSpWindowPresenter [

	aSpWindowPresenter ifNil: [ ^ self ].
	toolbar := self newToolbarForWindow.

	toolbar isEmpty ifFalse: [ aSpWindowPresenter toolbar: toolbar ]
]

{ #category : #commands }
IceTipBrowser >> connectPresenters [

	self mainList whenSelectionChangedDo: [
		| rootGroup |
		rootGroup := self rootCommandsGroup.
		IceTipCleanCommandGroupVisitor new visit: rootGroup.

		rootGroup installShortcutsIn: self.
		
		rootGroup
			commandOrGroupNamed: self class selectionCommandGroupName
			ifFound: [ :subgroup |
				self mainList contextMenuFromCommandsGroup: subgroup ]
		].


]

{ #category : #initialization }
IceTipBrowser >> defaultKeyboardFocus [

	^ self mainList
]

{ #category : #testing }
IceTipBrowser >> hasSelectedItem [
	
	^ self mainList selection isEmpty not
]

{ #category : #initialization }
IceTipBrowser >> iconForWindow [

	^ self iconNamed: #komitterSmalltalkhubRemote
]

{ #category : #initialization }
IceTipBrowser >> initialExtentForWindow [

	^ (600 @ 400) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipBrowser >> initialize [

	super initialize.
	self subscribeToAnnouncements
]

{ #category : #initialization }
IceTipBrowser >> initializeWindow: aSpWindowPresenter [

	super initializeWindow: aSpWindowPresenter.

	self addToolbarIfNotEmptyIn: aSpWindowPresenter.

]

{ #category : #'accessing ui' }
IceTipBrowser >> mainList [
	"Answer the presenter that is the main list of items of this browser."

	^ self subclassResponsibility
]

{ #category : #accessing }
IceTipBrowser >> model [

	^ model
]

{ #category : #accessing }
IceTipBrowser >> model: anObject [

	model := anObject
]

{ #category : #commands }
IceTipBrowser >> newToolbarForWindow [

	^ (self rootCommandsGroup / self class generalCommandGroupName)
		  beRoot;
		  asToolbarPresenterWith: [ :presenter | 
			  presenter
				  displayMode: SpToolbarDisplayMode modeIconAndLabel;
				  addStyle: 'stToolbar' ]
]

{ #category : #initialization }
IceTipBrowser >> rebuildToolbar [

	self addToolbarIfNotEmptyIn: self window
]

{ #category : #accessing }
IceTipBrowser >> refresh [
	"Update the UI elements given a possible update in the model."
]

{ #category : #accessing }
IceTipBrowser >> repositoryModel [
	"Answer the IceTipRepositoryModel associated to this presenter."

	^ self model repositoryModel
]

{ #category : #commands }
IceTipBrowser >> selectedItem [
	"Answer the object selected in the main list of this browser. The answer is nil when there isn't a selection."

	^ self mainList selection selectedItem
]

{ #category : #initialization }
IceTipBrowser >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #initialization }
IceTipBrowser >> subscribeToAnnouncements [
]

{ #category : #'accessing ui' }
IceTipBrowser >> toolbar [

	^ toolbar
]
