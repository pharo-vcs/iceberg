Class {
	#name : #IceTipSpPresenter,
	#superclass : #SpPresenter,
	#category : #'Iceberg-TipUI-View'
}

{ #category : #accessing }
IceTipSpPresenter class >> iconNamed: aSymbol [
	^ Smalltalk ui icons iconNamed: aSymbol
]

{ #category : #specs }
IceTipSpPresenter class >> title [
	^ self subclassResponsibility
]

{ #category : #adding }
IceTipSpPresenter >> addShortcutsTo: aWidget [
	self enableCommanderShortcutsIn: aWidget
]

{ #category : #accessing }
IceTipSpPresenter >> contextClass [
	"default context. This needs to be overriden for using presenters"
	^ IceTipContext
]

{ #category : #accessing }
IceTipSpPresenter >> contextSelection [
	"to be overriden by my users"
	^ nil
]

{ #category : #'private factory' }
IceTipSpPresenter >> createCommandContext [
	^ self newContextWithSelection: self contextSelection
]

{ #category : #'private factory' }
IceTipSpPresenter >> createCommandContextForSelection: selectedItems [
	^ self newContextWithSelection: selectedItems
]

{ #category : #adding }
IceTipSpPresenter >> eventKeyStrokesForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"	
		
	^ { Character tab asKeyCombination }
]

{ #category : #adding }
IceTipSpPresenter >> eventKeyStrokesForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"
	
	^ { Character tab shift asKeyCombination }
]

{ #category : #accessing }
IceTipSpPresenter >> iconNamed: aSymbol [
	^ self class iconNamed: aSymbol
]

{ #category : #'private factory' }
IceTipSpPresenter >> newContext [
	^ self contextClass for: self
]

{ #category : #'private factory' }
IceTipSpPresenter >> newContextWithSelection: anObject [
	^ self newContext
]
