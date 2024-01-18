"
I'm the superclass of all commands of the IceTip UI.
"
Class {
	#name : 'IceTipCommand',
	#superclass : 'CmCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'accessing - defaults' }
IceTipCommand class >> defaultToolbarItemName [

	^ self defaultName

]

{ #category : 'testing' }
IceTipCommand class >> isAbstract [

	^ self == IceTipCommand
]

{ #category : 'accessing' }
IceTipCommand >> application [
	
	^ context application
]

{ #category : 'converting' }
IceTipCommand >> asSpecCommand [ 

	| spCommand |
	spCommand := self decorateWith: IceTipSpCommand.
	
	spCommand
		iconProvider: self application;
		iconName: self iconName.

	self shouldBeDisplayedOnRightSideInToolbar ifTrue: [
		spCommand beDisplayedOnRightSide ].
	
	self shortcutKey ifNotNil: [ :keyCombination |
		spCommand shortcutKey: keyCombination ].

	^ spCommand
]

{ #category : 'accessing' }
IceTipCommand >> badge [
	"Answer a number as extra information in the button. An answer of nil means no information."

	^ nil
]

{ #category : 'testing' }
IceTipCommand >> hasRepository [

	^ self repositoryModel isNotNil
]

{ #category : 'testing' }
IceTipCommand >> hasSelectedItem [

	^ self context selectedItem isNotNil
]

{ #category : 'testing' }
IceTipCommand >> hasUnbornProject [
	^ self repositoryModel hasUnbornProject
]

{ #category : 'accessing' }
IceTipCommand >> iconName [
	"Answer the icon name (a Symbol) for this command."
	
	^ #blank

]

{ #category : 'testing' }
IceTipCommand >> isRepositoryDetached [
	^ self repositoryModel isNil 
		or: [ self  repositoryModel isDetached ]
]

{ #category : 'testing' }
IceTipCommand >> isRepositoryMissing [

	^ self hasRepository and: [
		self repositoryModel isMissing or: [
			self repositoryModel isCodeMissing ] ]
]

{ #category : 'testing' }
IceTipCommand >> isRepositoryOperational [
	^ self isRepositoryMissing not 
		and: [ self isRepositoryDetached not
			and: [ self hasUnbornProject not ] ]
]

{ #category : 'executing' }
IceTipCommand >> item [

	^ self context selectedItem
]

{ #category : 'accessing' }
IceTipCommand >> repository [

	^ self repositoryModel entity
]

{ #category : 'accessing' }
IceTipCommand >> repositoryModel [

	^ self context repositoryModel
]

{ #category : 'accessing' }
IceTipCommand >> shortcutKey [
	"Answer the key combination to execute this command. Answer nil if there isn't a key combination."
	
	^ nil

]

{ #category : 'testing' }
IceTipCommand >> shouldBeDisplayedOnRightSideInToolbar [

	^ false
]

{ #category : 'accessing' }
IceTipCommand >> tool [

	^ self context
]

{ #category : 'accessing' }
IceTipCommand >> toolAnnouncer [

	^ self tool announcer
]

{ #category : 'accessing' }
IceTipCommand >> toolbarItemName [
	
	^ self class defaultToolbarItemName
]

{ #category : 'accessing' }
IceTipCommand >> withErrorHandlingDo: aBlock [

	aBlock
		on: IceError
		do: [ :e |
			e acceptError:
				(IceTipInteractiveErrorVisitor on: self repository) ]
]
