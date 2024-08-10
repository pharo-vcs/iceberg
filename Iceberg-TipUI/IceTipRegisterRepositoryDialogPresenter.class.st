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
		'acceptBlock'
	],
	#category : 'Iceberg-TipUI-View-Repository',
	#package : 'Iceberg-TipUI',
	#tag : 'View-Repository'
}

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
IceTipRegisterRepositoryDialogPresenter >> doAccept [

	| newRepository |
	self selectedType validate.
	self isEditing ifTrue: [ self selectedType repository: repository ].
	newRepository := self selectedType newRepository.
	self isEditing ifFalse: [ newRepository register ].
	acceptBlock ifNotNil: [ acceptBlock cull: self ]
]

{ #category : 'actions' }
IceTipRegisterRepositoryDialogPresenter >> doEdit: aRepository [

	repository
		location: aRepository location;
		subdirectory: aRepository subdirectory
]

{ #category : 'testing' }
IceTipRegisterRepositoryDialogPresenter >> isEditing [

	^ repository isNotNil
]

{ #category : 'events' }
IceTipRegisterRepositoryDialogPresenter >> onAccept: aBlock [

	acceptBlock := aBlock
]

{ #category : 'initialization' }
IceTipRegisterRepositoryDialogPresenter >> titleForWindow [

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
