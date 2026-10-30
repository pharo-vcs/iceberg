"
I'm a dialog to register new repositories.
I can create new repositories, add existing ones and clone for different places (including a generic url clone).

self new 
	onAccept: [ :newRepository | newRepository register ];
	openDialogWithSpec
"
Class {
	#name : 'IceTipRegisterRepositoryDialogPresenter',
	#superclass : 'IceTipOptionDialogPresenter',
	#instVars : [
		'types',
		'repository',
		'acceptBlock',
		'cloneTask'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

{ #category : 'actions' }
IceTipRegisterRepositoryDialogPresenter >> acceptAndClose [
	"The dialog stays open until the repository exists, so a failed clone can be corrected and retried"

	self selectedType validate.
	self isEditing ifTrue: [ self selectedType repository: repository ].
	self okButtonEnabled: false.
	cloneTask := self selectedType
		             newRepositoryDo: [ :newRepository |
				             cloneTask := nil.
				             self isEditing ifFalse: [ newRepository register ].
				             acceptBlock ifNotNil: [ acceptBlock cull: self ].
				             self closeWindow ]
		             onFailure: [ :anError | self repositoryFailed: anError ]
]

{ #category : 'accessing' }
IceTipRegisterRepositoryDialogPresenter >> allTypes [

	^ types ifNil: [ types := IceTipRepositoryTypePanel allTypes ]
]

{ #category : 'accessing' }
IceTipRegisterRepositoryDialogPresenter >> beForCloneOfRepository: aRepository [

	self withoutNewRepository.
	self withoutLocalRepository.
	repository := aRepository
]

{ #category : 'actions' }
IceTipRegisterRepositoryDialogPresenter >> cancelClone [

	cloneTask ifNotNil: [ IceTaskList default cancel: cloneTask ]
]

{ #category : 'actions' }
IceTipRegisterRepositoryDialogPresenter >> doEdit: aRepository [

	repository
		location: aRepository location;
		subdirectory: aRepository subdirectory
]

{ #category : 'initialization' }
IceTipRegisterRepositoryDialogPresenter >> initializeDialogWindow: aWindowPresenter [

	super initializeDialogWindow: aWindowPresenter.
	aWindowPresenter whenClosedDo: [ self cancelClone ]
]

{ #category : 'testing' }
IceTipRegisterRepositoryDialogPresenter >> isEditing [

	^ repository isNotNil
]

{ #category : 'actions' }
IceTipRegisterRepositoryDialogPresenter >> okButtonEnabled: aBoolean [

	self withWindowDo: [ :window |
		window buttons detect: [ :each | each label = 'Ok' ] ifFound: [ :button | button enabled: aBoolean ] ]
]

{ #category : 'events' }
IceTipRegisterRepositoryDialogPresenter >> onAccept: aBlock [

	acceptBlock := aBlock
]

{ #category : 'actions' }
IceTipRegisterRepositoryDialogPresenter >> repositoryFailed: anErrorOrNil [

	cloneTask := nil.
	self okButtonEnabled: true.
	anErrorOrNil ifNil: [ ^ self ].
	[ anErrorOrNil signal ]
		on: IceError , IceWarning
		do: [ :e | e acceptError: (IceTipInteractiveErrorVisitor newContext: self) ]
]

{ #category : 'initialization' }
IceTipRegisterRepositoryDialogPresenter >> windowTitle [

	^ 'Register project'
]

{ #category : 'accessing' }
IceTipRegisterRepositoryDialogPresenter >> withoutLocalRepository [

	types := self allTypes reject: #isLocalRepository.
	typeList items: types
]

{ #category : 'accessing' }
IceTipRegisterRepositoryDialogPresenter >> withoutNewRepository [

	types := self allTypes reject: #isNewRepository.
	typeList items: types
]
