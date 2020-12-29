"
I'm the superclass of all commands of the IceTip UI.
"
Class {
	#name : #IceTipCommand2,
	#superclass : #CmCommand,
	#category : #'Iceberg-TipUI-Commands'
}

{ #category : #accessing }
IceTipCommand2 class >> defaultToolbarItemName [

	^ self defaultName

]

{ #category : #accessing }
IceTipCommand2 >> application [

	^ SpApplication defaultApplication
]

{ #category : #converting }
IceTipCommand2 >> asSpecCommand [ 

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

{ #category : #accessing }
IceTipCommand2 >> badge [
	"Answer a number as extra information in the button. An answer of nil means no information."

	^ nil
]

{ #category : #testing }
IceTipCommand2 >> hasRepository [

	^ self repositoryModel notNil
]

{ #category : #testing }
IceTipCommand2 >> hasSelectedItem [

	^ self context selectedItem notNil
]

{ #category : #testing }
IceTipCommand2 >> hasUnbornProject [
	^ self repositoryModel hasUnbornProject
]

{ #category : #accessing }
IceTipCommand2 >> iconName [
	"Answer the icon name (a Symbol) for this command."
	
	^ #blank

]

{ #category : #testing }
IceTipCommand2 >> isRepositoryDetached [
	^ self repositoryModel isNil 
		or: [ self  repositoryModel isDetached ]
]

{ #category : #testing }
IceTipCommand2 >> isRepositoryMissing [

	^ self hasRepository and: [
		self repositoryModel isMissing or: [
			self repositoryModel isCodeMissing ] ]
]

{ #category : #testing }
IceTipCommand2 >> isRepositoryOperational [
	^ self isRepositoryMissing not 
		and: [ self isRepositoryDetached not
			and: [ self hasUnbornProject not ] ]
]

{ #category : #execution }
IceTipCommand2 >> item [

	^ self context selectedItem
]

{ #category : #accessing }
IceTipCommand2 >> repository [

	^ self repositoryModel entity
]

{ #category : #accessing }
IceTipCommand2 >> repositoryModel [

	^ self context repositoryModel
]

{ #category : #accessing }
IceTipCommand2 >> shortcutKey [
	"Answer the key combination to execute this command. Answer nil if there isn't a key combination."
	
	^ nil

]

{ #category : #testing }
IceTipCommand2 >> shouldBeDisplayedOnRightSideInToolbar [

	^ false
]

{ #category : #accessing }
IceTipCommand2 >> tool [

	^ self context
]

{ #category : #accessing }
IceTipCommand2 >> toolAnnouncer [

	^ self tool announcer
]

{ #category : #accessing }
IceTipCommand2 >> toolbarItemName [
	
	^ self class defaultToolbarItemName
]

{ #category : #accessing }
IceTipCommand2 >> withErrorHandlingDo: aBlock [

	aBlock
		on: IceError
		do: [ :e |
			e acceptError:
				(IceTipInteractiveErrorVisitor on: self repositoryModel entity) ]
]
