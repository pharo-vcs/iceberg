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

	^ self context tool application
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

{ #category : #accessing }
IceTipCommand2 >> iconName [
	"Answer the icon name (a Symbol) for this command."
	
	^ #blank

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
