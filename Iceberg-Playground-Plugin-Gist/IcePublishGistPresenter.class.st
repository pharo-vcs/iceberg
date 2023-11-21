"
A presenter to request aditional data and publish the content of a playground as a github gist.

The method `StPlaygroundPublishGistPresenter>>#publishThen:` will use the `IceGitHubAPI` to publish the data.
"
Class {
	#name : 'IcePublishGistPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'descriptionTextInput',
		'contentCode',
		'publishedAction',
		'publicCheckbox'
	],
	#classVars : [
		'GistPublic'
	],
	#category : 'Iceberg-Playground-Plugin-Gist-View',
	#package : 'Iceberg-Playground-Plugin-Gist',
	#tag : 'View'
}

{ #category : 'accessing' }
IcePublishGistPresenter class >> initialExtent [

	^ 600@400
]

{ #category : 'accessing' }
IcePublishGistPresenter class >> windowTitle [

	^ 'Publish Gist'
]

{ #category : 'accessing' }
IcePublishGistPresenter >> content: aString [

	contentCode text: aString
]

{ #category : 'initialization' }
IcePublishGistPresenter >> defaultPublic [
		
	^ GistPublic ifNil: [ GistPublic := true ]
]

{ #category : 'private' }
IcePublishGistPresenter >> fileNameFrom: aString [
	| normalized |
	
	normalized := aString select: [ :each | each isAlphaNumeric or: [ each = Character space ] ].
	normalized := normalized asCamelCase.
	normalized size > 40 ifTrue: [ 
		normalized := (normalized first: 35), 'Etc' ].
	
	^ normalized, '.st'
]

{ #category : 'initialization' }
IcePublishGistPresenter >> initializeDialogWindow: aDialogWindowPresenter [

	aDialogWindowPresenter
		addButton: 'Cancel' do: [ :presenter | 
			presenter triggerCancelAction; close ];
		addButton: 'Publish' do: [ :presenter | 
			presenter triggerOkAction.
			self publishThen: [ presenter close ] ]
]

{ #category : 'initialization' }
IcePublishGistPresenter >> initializePresenters [

	self layout: (SpBoxLayout newTopToBottom
		spacing: 5;
		add: 'Description' expand: false;
		add: (descriptionTextInput := self newTextInput) expand: false;
		add: 'Content' expand: false;
		add: (contentCode := self newCode);
		add: (publicCheckbox := self newCheckBox) expand: false;
		yourself).
		
	publicCheckbox 
		label: 'Make Gist public';
		state: self defaultPublic.
	
	contentCode 
		beNotEditable;
		beForScripting
]

{ #category : 'initialization' }
IcePublishGistPresenter >> initializeWindow: aWindowPresenter [

	aWindowPresenter 
		title: self class windowTitle;
		initialExtent: self class initialExtent.
]

{ #category : 'actions' }
IcePublishGistPresenter >> publishThen: aBlock [
	| description public jsonResult |

	self validate ifFalse: [ ^ self ].

	description := descriptionTextInput text trimmed.
	public := publicCheckbox state.
	
	jsonResult := IceGitHubAPI new 
		postGist: description
		public: public
		name: (self fileNameFrom: description) 
		contents: contentCode text.

	"Save last public status"
	GistPublic := public.

	publishedAction ifNotNil: [ publishedAction value: jsonResult ].
	aBlock value.
]

{ #category : 'private' }
IcePublishGistPresenter >> showError: aString [

	self application newInform
		title: 'Error';
		label: aString;
		openModalWithSpecParent: self window
]

{ #category : 'private' }
IcePublishGistPresenter >> validate [
	
	descriptionTextInput text trimmed ifEmpty: [ 
		self showError: 'Please enter a description'.
		^ false ].
	
	^ true
		
]

{ #category : 'events' }
IcePublishGistPresenter >> whenPublishedDo: aBlock [

	publishedAction := aBlock
]
