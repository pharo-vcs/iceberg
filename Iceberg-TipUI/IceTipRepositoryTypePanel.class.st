"
I'm a generic repository type panel. 
I'm used as part of the creation dialog and to edit repository properties.
"
Class {
	#name : #IceTipRepositoryTypePanel,
	#superclass : #IceTipSpPresenter,
	#instVars : [
		'projectLocation',
		'remoteLabel',
		'remoteInputText',
		'repository'
	],
	#category : #'Iceberg-TipUI-View-RepositoryType'
}

{ #category : #accessing }
IceTipRepositoryTypePanel class >> allTypes [
	^ ((self allSubclasses 
		reject: #isAbstract)
		sorted: [ :a :b | a order < b order ])
		collect: #new
]

{ #category : #testing }
IceTipRepositoryTypePanel class >> isAbstract [

	^ self = IceTipRepositoryTypePanel
]

{ #category : #accessing }
IceTipRepositoryTypePanel class >> order [

	^ 0
]

{ #category : #private }
IceTipRepositoryTypePanel >> defaultLocation [

	^ IceLibgitRepository repositoriesLocation pathString
]

{ #category : #initialization }
IceTipRepositoryTypePanel >> defaultSubdirectory [

	^ IceLibgitRepository defaultCodeSubdirectory
]

{ #category : #initialization }
IceTipRepositoryTypePanel >> initializePresenters [

	super initializePresenters.
	self initializeProjectLocation.

]

{ #category : #initialization }
IceTipRepositoryTypePanel >> initializeProjectLocation [

	projectLocation := self instantiate: IceTipDirectoryPresenter.
	projectLocation
		label: 'Local directory';
		chooseTitle: 'Choose local repository';
		location: self defaultLocation
]

{ #category : #initialization }
IceTipRepositoryTypePanel >> initializeRemoteURL [

	remoteLabel := self newLabel label: 'Remote URL'; yourself.
	remoteInputText := self newTextInput
		placeholder: 'e.g., git@github.com:user/MyProject.git';
		autoAccept: true;
		yourself.
]

{ #category : #testing }
IceTipRepositoryTypePanel >> isLocalRepository [

	^ false
]

{ #category : #testing }
IceTipRepositoryTypePanel >> isNewRepository [

	^ false
]

{ #category : #accessing }
IceTipRepositoryTypePanel >> newRepository [

	^ self subclassResponsibility
]

{ #category : #'accessing ui' }
IceTipRepositoryTypePanel >> projectLocation [

	^ projectLocation
]

{ #category : #'accessing ui' }
IceTipRepositoryTypePanel >> remoteInputText [

	^ remoteInputText
]

{ #category : #'accessing ui' }
IceTipRepositoryTypePanel >> remoteLabel [

	^ remoteLabel
]

{ #category : #accessing }
IceTipRepositoryTypePanel >> repository: aRepository [
	"Used if editing an existing repository"

	repository := aRepository
]

{ #category : #accessing }
IceTipRepositoryTypePanel >> validate [

	^ self subclassResponsibility
]
