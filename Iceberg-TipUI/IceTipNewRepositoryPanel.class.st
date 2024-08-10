"
I'm a presenter to create a new repository from scratch.
Usually, I'm part of an IceTipRegisterProjectPresenter.

I will define location, name and source subdirectory and I will use that to create a #newRepository.
"
Class {
	#name : 'IceTipNewRepositoryPanel',
	#superclass : 'IceTipRepositoryTypePanel',
	#instVars : [
		'projectNameLabel',
		'projectNameInputText',
		'subdirectoryLabel',
		'subdirectoryInputText'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'accessing' }
IceTipNewRepositoryPanel class >> order [

	^ 10
]

{ #category : 'layout' }
IceTipNewRepositoryPanel >> defaultLayout [

	^ SpGridLayout new 
		beColumnNotHomogeneous;
		column: 2 expand: true;
		build: [ :builder | builder
			add: projectNameLabel; add: projectNameInputText; nextRow;
			add: projectLocationLabel; add: projectLocation; nextRow;
			add: subdirectoryLabel; add: subdirectoryInputText; nextRow ];
		yourself
]

{ #category : 'initialization' }
IceTipNewRepositoryPanel >> iconForWindow [

	^ self iconNamed: #smallNew
]

{ #category : 'initialization' }
IceTipNewRepositoryPanel >> initializePresenters [

	super initializePresenters.
	self initializeSourceDirectory.

	projectNameLabel := self newLabel
		label: 'Project name';
		yourself.
	projectNameInputText := self newTextInput
		placeholder: 'e.g., MyProject';
		autoAccept: true;
		whenTextChangedDo: [ :text | projectLocation appendPath: text ];
		yourself.

]

{ #category : 'initialization' }
IceTipNewRepositoryPanel >> initializeSourceDirectory [

	subdirectoryLabel := self newLabel
		label: 'Source directory';
		yourself.
	subdirectoryInputText := self newTextInput
		placeholder: 'e.g., src';
		autoAccept: true;
		text: self defaultSubdirectory;
		yourself.

]

{ #category : 'testing' }
IceTipNewRepositoryPanel >> isNewRepository [

	^ true
]

{ #category : 'accessing' }
IceTipNewRepositoryPanel >> newRepository [

	| repositoryName location subdirectory |
	repositoryName := self projectNameInputText text trimmed.
	location := self projectLocation location.
	subdirectory := self subdirectoryInputText text asString trimmed.

	^ self application
		informUser: ('Cloning repository {1} at {2}' format: {
					 repositoryName.
					 location fullName })
		during: [
			IceRepositoryCreator new
				  repository: repository;
				  location: location;
				  subdirectory: subdirectory;
				  createNewRepositoryNamed: repositoryName ]
]

{ #category : 'accessing - ui' }
IceTipNewRepositoryPanel >> projectNameInputText [

	^ projectNameInputText
]

{ #category : 'accessing - ui' }
IceTipNewRepositoryPanel >> projectNameLabel [

	^ projectNameLabel
]

{ #category : 'accessing - ui' }
IceTipNewRepositoryPanel >> subdirectoryInputText [

	^ subdirectoryInputText
]

{ #category : 'accessing - ui' }
IceTipNewRepositoryPanel >> subdirectoryLabel [

	^ subdirectoryLabel
]

{ #category : 'initialization' }
IceTipNewRepositoryPanel >> titleForWindow [

	^ 'New repository'
]

{ #category : 'accessing' }
IceTipNewRepositoryPanel >> validate [

	self 
		assert: self projectNameInputText text isNotEmpty  
		description: 'You must enter a project name (it will be used also as part of the path).'.
	self
		assert: self projectLocation location isNotNil  
		description: 'Project location must be defined (if it does not exists, it will be created).'
]
