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
IceTipBrowser2 class >> buildCommandsGroupWith: presenter forRoot: aCommandGroup [

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
IceTipBrowser2 class >> buildGeneralCommandGroupWith: presenter for: aCommandGroup [

	self subclassResponsibility
]

{ #category : #commands }
IceTipBrowser2 class >> buildSelectionCommandGroupWith: presenter for: aCommandGroup [

	self subclassResponsibility
]

{ #category : #commands }
IceTipBrowser2 class >> buildSelectionExtraCommandGroupWith: presenter for: aCommandGroup [

	aCommandGroup register: IceTipInspectCommand forSpec
]

{ #category : #commands }
IceTipBrowser2 class >> generalCommandGroupName [

	^ 'General'
]

{ #category : #commands }
IceTipBrowser2 class >> selectionCommandGroupName [

	^ 'Selection'
]

{ #category : #commands }
IceTipBrowser2 class >> selectionExtraCommandGroupName [

	^ 'Extra'
]

{ #category : #initialization }
IceTipBrowser2 >> addToolbarIfNotEmptyIn: aSpWindowPresenter [

	toolbar := self newToolbarForWindow.

	toolbar isEmpty ifFalse: [ aSpWindowPresenter toolbar: toolbar ]
]

{ #category : #commands }
IceTipBrowser2 >> connectPresenters [

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
IceTipBrowser2 >> defaultKeyboardFocus [

	^ self mainList
]

{ #category : #testing }
IceTipBrowser2 >> hasSelectedItem [
	
	^ self mainList selection isEmpty not
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

	self addToolbarIfNotEmptyIn: aSpWindowPresenter.

	aSpWindowPresenter
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
IceTipBrowser2 >> newToolbarForWindow [

	^ (self rootCommandsGroup / self class generalCommandGroupName)
		  beRoot;
		  asToolbarPresenterWith: [ :presenter | 
			  presenter
				  displayMode: SpToolbarDisplayMode modeIconAndLabel;
				  addStyle: 'stToolbar' ]
]

{ #category : #accessing }
IceTipBrowser2 >> refresh [
	"Update the UI elements given a possible update in the model."
]

{ #category : #accessing }
IceTipBrowser2 >> repositoryModel [
	"Answer the IceTipRepositoryModel associated to this presenter."

	^ self model repositoryModel
]

{ #category : #commands }
IceTipBrowser2 >> selectedItem [
	"Answer the object selected in the main list of this browser. The answer is nil when there isn't a selection."

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
	
	^ self subclassResponsibility

]

{ #category : #'accessing ui' }
IceTipBrowser2 >> toolbar [

	^ toolbar
]
