"
I'm the superclass of Spec2 browsers in Iceberg Tip-UI. Each concrete subclass has some kind
of list or table that contain the items that are being browsed.

Some design remarks: 

* Each browser has to have ONE model as entry point for data, and JUST ONE. See #model accessor.
* Browsers have a toolbar with commands that are applicable for the model.
* Browsers have a context menu on list or table items, that provide commands that are specific for the selection.
"
Class {
	#name : #IceTipBrowser2,
	#superclass : #SpPresenter,
	#instVars : [
		'model',
		'toolbar'
	],
	#category : #'Iceberg-TipUI-View'
}

{ #category : #commands }
IceTipBrowser2 >> contextClass [
	"Answer the context class to be instantiated and read from my model. See #newContext."

	^ self subclassResponsibility
]

{ #category : #initialization }
IceTipBrowser2 >> defaultKeyboardFocus [

	^ self mainList
]

{ #category : #initialization }
IceTipBrowser2 >> iconForWindow [

	^ self iconNamed: #komitterSmalltalkhubRemote
]

{ #category : #initialization }
IceTipBrowser2 >> initialExtentForWindow [

	^ (600 @ 400) scaledByDisplayScaleFactor
]

{ #category : #initialization }
IceTipBrowser2 >> initialize [

	super initialize.
	self subscribeToAnnouncements
]

{ #category : #initialization }
IceTipBrowser2 >> initializeWindow: aSpWindowPresenter [

	aSpWindowPresenter
		toolbar: (toolbar := self newToolbarForWindow);
		title: self titleForWindow;
		windowIcon: self iconForWindow;
		initialExtent: self initialExtentForWindow
]

{ #category : #'accessing ui' }
IceTipBrowser2 >> mainList [
	"Answer the presenter that is the main list of items of this browser."

	^ self subclassResponsibility
]

{ #category : #accessing }
IceTipBrowser2 >> model [

	^ model
]

{ #category : #accessing }
IceTipBrowser2 >> model: anObject [

	model := anObject
]

{ #category : #commands }
IceTipBrowser2 >> newCommandGroupForContext [

	| aContext aCommandGroup |
	aCommandGroup := CmCommandGroup forSpec.
	aContext := self newContext.

	self registerToolbarCommandsInto: aCommandGroup context: aContext.
	
	^ aCommandGroup

]

{ #category : #commands }
IceTipBrowser2 >> newCommandGroupForContextWithSelection [

	| aContext aCommandGroup |
	aCommandGroup := CmCommandGroup forSpec.
	aCommandGroup beRoot.
	aContext := self newContextWithSelection.

	self registerCommandsForSelectionInto: aCommandGroup context: aContext.
	aContext pluginManager registerBrowserCommandsOn: aCommandGroup context: aContext.
	self registerInspectInto: aCommandGroup context: aContext.

	aCommandGroup allCommands do: [ :each | each beHiddenWhenCantBeRun ].
	
	^ aCommandGroup

]

{ #category : #commands }
IceTipBrowser2 >> newContext [
	"Answer a context from my model."

	^ (self contextClass for: self)
		readContextParametersFromModel: self model;
		yourself
]

{ #category : #commands }
IceTipBrowser2 >> newContextWithSelection [

	^ self newContextWithSelection: self selectedItem
]

{ #category : #commands }
IceTipBrowser2 >> newContextWithSelection: anObject [
	"Answer a context that, if corresponds, indicated the current selection (e.g. the item selected in a list or table in this presenter)."

	^ self newContext
]

{ #category : #commands }
IceTipBrowser2 >> newKeyBindingsForList [

	^ self newCommandGroupForContextWithSelection asKMCategory
]

{ #category : #commands }
IceTipBrowser2 >> newMenuForList [

	^ self newCommandGroupForContextWithSelection asMenuPresenter
]

{ #category : #commands }
IceTipBrowser2 >> newToolbarForWindow [

	^ self newCommandGroupForContext asToolbarPresenterWith: [ :presenter | 
		  presenter
			  displayMode: SpToolbarDisplayMode modeIconAndLabel;
			  addStyle: 'stToolbar' ]
]

{ #category : #accessing }
IceTipBrowser2 >> refresh [
	"Update the UI elements given a possible update in the model."
]

{ #category : #commands }
IceTipBrowser2 >> registerCommandsForSelectionInto: aCommandGroup context: aContext [
	"Register list context menu commands into the received CmCommandGroup."

	^ self subclassResponsibility
]

{ #category : #commands }
IceTipBrowser2 >> registerInspectInto: aCommandGroup context: aContext [

	aCommandGroup
		register: ((CmCommandGroup named: 'Extra') asSpecGroup
				register: (IceTipInspectCommand forSpecContext: aContext);
				yourself)

]

{ #category : #commands }
IceTipBrowser2 >> registerToolbarCommandsInto: aCommandGroup context: aContext [
	"Register toolbar commands into the received CmCommandGroup."

	^ self subclassResponsibility
]

{ #category : #commands }
IceTipBrowser2 >> selectedItem [

	^ self mainList selection selectedItem
]

{ #category : #initialization }
IceTipBrowser2 >> setModelBeforeInitialization: anObject [

	model := anObject
]

{ #category : #initialization }
IceTipBrowser2 >> subscribeToAnnouncements [
]

{ #category : #initialization }
IceTipBrowser2 >> titleForWindow [
	"The title to use when the presenter is opened as a window."
	
	^ ''
]

{ #category : #'accessing ui' }
IceTipBrowser2 >> toolbar [

	^ toolbar
]
