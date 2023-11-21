"
I'm an abstract model to provide locations (directories or files). 
I need to be included in other components (search references to my children for examples)
"
Class {
	#name : 'IceTipLocationPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'locationInput',
		'chooseButton',
		'chooseTitle',
		'chooseBlock',
		'keptLocation'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'testing' }
IceTipLocationPresenter class >> isAbstract [

	^ self == IceTipLocationPresenter
]

{ #category : 'accessing' }
IceTipLocationPresenter >> appendPath: aString [

	keptLocation ifNil: [ keptLocation := self location ].
	
	self basicLocation: (aString 
		ifNotEmpty: [ (keptLocation ifNil: [ '.' asFileReference ]) / aString ]
		ifEmpty: [ keptLocation ]).
]

{ #category : 'private' }
IceTipLocationPresenter >> basicLocation: aReference [

	locationInput text: aReference pathString
]

{ #category : 'actions' }
IceTipLocationPresenter >> choose [

	self chooseReference ifNotNil: [ :reference | 
		self location: reference.
		self onChoose ifNotNil: #value ]
]

{ #category : 'accessing - ui' }
IceTipLocationPresenter >> chooseButton [

	^ chooseButton
]

{ #category : 'actions' }
IceTipLocationPresenter >> chooseReference [

	self subclassResponsibility
]

{ #category : 'accessing' }
IceTipLocationPresenter >> chooseTitle [

	^ chooseTitle ifNil: [ self defaultChooseDialogTitle ]
]

{ #category : 'accessing' }
IceTipLocationPresenter >> chooseTitle: aString [

	chooseTitle := aString
]

{ #category : 'accessing' }
IceTipLocationPresenter >> defaultChooseDialogTitle [

	^ 'Choose directory'
]

{ #category : 'accessing' }
IceTipLocationPresenter >> defaultLabel [

	^ 'Directory'
]

{ #category : 'layout' }
IceTipLocationPresenter >> defaultLayout [

	^ SpBoxLayout newLeftToRight
		borderWidth: 0;
		vAlignCenter;
		spacing: 5;
		add: #locationInput;
		add: #chooseButton expand: false;
		yourself
]

{ #category : 'accessing' }
IceTipLocationPresenter >> icon [

	^ self iconNamed: #open
]

{ #category : 'initialization' }
IceTipLocationPresenter >> initializePresenters [

	locationInput := self newTextInput
		autoAccept: true;
		yourself.
	chooseButton := self newButton
		addStyle: 'small';
		icon: self icon;
		yourself.
	
	chooseButton action: [ self choose ]
]

{ #category : 'accessing' }
IceTipLocationPresenter >> location [
	"This method return the location to use in the repository
	If the location is relative to IceLibgitRepository >> #localRepositoriesLocation
	It returns a FileLocator so the image can be moved or the directory renamed.
	If the location is outside of the local repositories location it returns a file reference"

	| fileReferenceLocation relativePath|

	fileReferenceLocation := locationInput text trim
		ifNotEmpty: [ :value | value asFileReference ]
		ifEmpty: [ ^ nil ].

	(fileReferenceLocation
		isContainedBy: IceLibgitRepository localRepositoriesLocation)
		ifFalse: [ ^ fileReferenceLocation ].

	relativePath := IceLibgitRepository localRepositoriesLocation makeRelative: locationInput text trim asFileReference.
	
	^ IceLibgitRepository localRepositoriesLocation resolvePath: relativePath 
]

{ #category : 'accessing' }
IceTipLocationPresenter >> location: aReferenceOrString [

	| ref |
	ref := aReferenceOrString asFileReference.
	keptLocation ifNotNil: [ 
		| newRef |
		newRef := (self location pathString 
			copyReplaceAll: keptLocation pathString 
			with: ref pathString) 
			asFileReference.
		keptLocation := ref.
		ref := newRef ].
	
	self basicLocation: ref
]

{ #category : 'accessing - ui' }
IceTipLocationPresenter >> locationInput [

	^ locationInput
]

{ #category : 'hook' }
IceTipLocationPresenter >> onChoose [

	^ chooseBlock
]

{ #category : 'hook' }
IceTipLocationPresenter >> onChoose: aBlockClosure [
	"I allow to set a hook to execute when the user select a location."

	chooseBlock := aBlockClosure
]

{ #category : 'events' }
IceTipLocationPresenter >> whenTextChanged: aBlockClosure [

	self locationInput whenTextChangedDo: aBlockClosure
]
