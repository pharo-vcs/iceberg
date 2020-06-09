"
I'm a presenter to create a new repository from scratch.
Usually, I'm part of an IceTipRegisterProjectPresenter.

I will define location, name and source subdirectory and I will use that to create a #newRepository.
"
Class {
	#name : #IceTipNewRepositoryPanel,
	#superclass : #IceTipRepositoryTypePanel,
	#instVars : [
		'projectNameLabel',
		'projectNameInputText',
		'subdirectoryLabel',
		'subdirectoryInputText'
	],
	#category : #'Iceberg-TipUI-View-RepositoryType'
}

{ #category : #specs }
IceTipNewRepositoryPanel class >> defaultSpec [
	<spec: #default>
	^ SpBoxLayout newVertical
		add:
			(SpBoxLayout newHorizontal
				add: #projectNameLabel width: self labelWidth;
				add: #projectNameInputText;
				yourself)
			height: 30;
		add: #projectLocation height: 30;
		add:
			(SpBoxLayout newHorizontal
				add: #subdirectoryLabel width: self labelWidth;
				add: #subdirectoryInputText;
				yourself)
			height: 30;
		yourself
]

{ #category : #accessing }
IceTipNewRepositoryPanel class >> icon [
	^ self iconNamed: #smallNew
]

{ #category : #accessing }
IceTipNewRepositoryPanel class >> order [
	^ 10
]

{ #category : #specs }
IceTipNewRepositoryPanel class >> title [
	^ 'New repository'
]

{ #category : #initialization }
IceTipNewRepositoryPanel >> initializeSourceDirectory [
	subdirectoryLabel := self newLabel label: 'Source directory'.
	subdirectoryInputText := self newTextInput
		placeholder: 'e.g., src';
		autoAccept: true.
	subdirectoryInputText text: self defaultSubdirectory
]

{ #category : #initialization }
IceTipNewRepositoryPanel >> initializeWidgets [
	super initializeWidgets.
	self initializeSourceDirectory.
	projectNameLabel := self newLabel label: 'Project name'.
	projectNameInputText := self newTextInput
		placeholder: 'e.g., MyProject';
		autoAccept: true.
	projectNameInputText
		whenTextChangedDo: [ :text | projectLocation appendPath: text ].
	self focusOrder
		add: self projectNameInputText;
		add: self projectLocation;
		add: self subdirectoryInputText;
		add: self remoteInputText
]

{ #category : #testing }
IceTipNewRepositoryPanel >> isNewRepository [
	^ true
]

{ #category : #accessing }
IceTipNewRepositoryPanel >> newRepository [
	| repositoryName location subdirectory |

	repositoryName := self projectNameInputText text trimmed.
	location := self projectLocation location.
	subdirectory := self subdirectoryInputText text asString trimmed.
	
	UIManager default 
		informUser: ('Cloning repository {1} at {2}' format: { repositoryName. location fullName })
		during: [ 
			^ IceRepositoryCreator new
				repository: repository;
				location: location;
				subdirectory: subdirectory;
				createNewRepositoryNamed: repositoryName ]
]

{ #category : #'accessing ui' }
IceTipNewRepositoryPanel >> projectNameInputText [
	^ projectNameInputText
]

{ #category : #'accessing ui' }
IceTipNewRepositoryPanel >> projectNameInputText: anObject [
	projectNameInputText := anObject
]

{ #category : #'accessing ui' }
IceTipNewRepositoryPanel >> projectNameLabel [
	^ projectNameLabel
]

{ #category : #'accessing ui' }
IceTipNewRepositoryPanel >> projectNameLabel: anObject [
	projectNameLabel := anObject
]

{ #category : #'accessing ui' }
IceTipNewRepositoryPanel >> subdirectoryInputText [
	^ subdirectoryInputText
]

{ #category : #accessing }
IceTipNewRepositoryPanel >> subdirectoryInputText: anObject [
	subdirectoryInputText := anObject
]

{ #category : #accessing }
IceTipNewRepositoryPanel >> subdirectoryLabel [
	^ subdirectoryLabel
]

{ #category : #accessing }
IceTipNewRepositoryPanel >> subdirectoryLabel: anObject [
	subdirectoryLabel := anObject
]

{ #category : #accessing }
IceTipNewRepositoryPanel >> validate [ 
	self 
		assert: self projectNameInputText text isNotEmpty  
		description: 'You must enter a project name (it will be used also as part of the path).'.
	self
		assert: self projectLocation location notNil  
		description: 'Project location must be defined (if it does not exists, it will be created).'
]
