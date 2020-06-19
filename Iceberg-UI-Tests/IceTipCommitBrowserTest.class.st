Class {
	#name : #IceTipCommitBrowserTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'presenter',
		'saveMock'
	],
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #testing }
IceTipCommitBrowserTest class >> isAbstract [
	^ self name = #IceTipCommitBrowserTest
]

{ #category : #running }
IceTipCommitBrowserTest >> setUp [
	super setUp.
	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass2'.
	presenter := IceTipCommitBrowser onRepository: self repository.
	saveMock := IceTipMockSaveImageAction new.
	presenter saveAction: saveMock.
	presenter openWithSpec.
	presenter commentPanel commentText text: 'my super commit message'
]

{ #category : #running }
IceTipCommitBrowserTest >> tearDown [
	presenter ifNotNil: [ presenter window close ].
	super tearDown 
]

{ #category : #tests }
IceTipCommitBrowserTest >> testAcceptShortcutInCommentBoxTriggersCommit [
	
	presenter commentPanel commentText adapter 
		keyPressed: $s asciiValue 
		shift: false 
		meta: true
		control: false
		option: false. 

	self
		assert: self repository branch commit comment
		equals: 'my super commit message'
]

{ #category : #tests }
IceTipCommitBrowserTest >> testFixesField [
	self
		assert: presenter commentPanel fixesField class
		equals: SpNumberInputFieldPresenter.
	self
		assert: presenter commentPanel message
		equals: 'my super commit message'.
	presenter commentPanel fixesField number: 123456.
	
	self
		assert: presenter commentPanel message
		equals:
			'my super commit message
Fixes #123456'.
]

{ #category : #tests }
IceTipCommitBrowserTest >> testHasCommentPanelWithSavingSettings [
	| previousState |
	self assert: presenter commentPanel class equals: IceTipCommentPanel.
	self
		assert: presenter commentPanel isSaving 
		equals: IceTipCommitSettings saveImageOnCommit.
	previousState := presenter commentPanel isSaving.
	presenter commentPanel saveCheckbox toggleState.
	self
		assert: previousState
		equals: IceTipCommitSettings saveImageOnCommit not.
	presenter commentPanel saveCheckbox toggleState
]

{ #category : #tests }
IceTipCommitBrowserTest >> testHasDiffPanel [
	self
		assert: presenter diffPanel class equals: IceTipDiffSelectingPanel 
]

{ #category : #tests }
IceTipCommitBrowserTest >> testIsAutomaticallySavingWhenChecked [
	| previousState|
	previousState := presenter commentPanel isSaving.
	presenter commentPanel saveCheckbox state: true.
	presenter doCommit.
	self assert: saveMock timesExecuted equals: 1.
	presenter commentPanel saveCheckbox state: previousState
]

{ #category : #tests }
IceTipCommitBrowserTest >> testIsCommitingCheckedItems [
	| diffTree |

	presenter doCommit.
	diffTree := self workingCopy repository branch commit diffToParent	tree.
	self assert: (diffTree / self packageName1) children size equals: 1.
	self assert: (diffTree / self packageName1) value isNoModification.
	self
		assert: (diffTree / self packageName1 / 'TestClass2') value isAddition.
	self
		assert:
			(diffTree / self packageName1 / 'TestClass2') value definition
				isClassDefinition.
	self
		assert: (diffTree / self packageName1 / 'TestClass2') children size
		equals: 1.
	self
		assert: (diffTree / self packageName1 / 'TestClass2' / 'm1') value isAddition.
	self
		assert:
			(diffTree / self packageName1 / 'TestClass2' / 'm1') value definition
				isMethodDefinition
]

{ #category : #tests }
IceTipCommitBrowserTest >> testIsCommitingWithTheRightMessage [
	presenter doCommit.
	self
		assert: self repository branch commit comment
		equals: 'my super commit message'
]

{ #category : #tests }
IceTipCommitBrowserTest >> testIsNotAutomaticallySavingWhenNotChecked [
	| previousState |
	previousState := presenter commentPanel isSaving.
	presenter commentPanel saveCheckbox state: false.
	presenter doCommit.
	self assert: saveMock  timesExecuted equals: 0.
	presenter commentPanel saveCheckbox state: previousState
]

{ #category : #tests }
IceTipCommitBrowserTest >> testIsNotCommitingUncheckedItems [
	| diffTree |
	presenter diffPanel selectedItems
		remove:
			((presenter diffPanel selectedItems asOrderedCollection
				select: [ :node | node value description = #m1 ]) at: 1 ).
	presenter doCommit.
	diffTree := self workingCopy repository branch commit diffToParent
		tree.
	self assert: (diffTree / self packageName1) children size equals: 1.
	self assert: (diffTree / self packageName1) value isNoModification.
	self
		assert: (diffTree / self packageName1 / 'TestClass2') value isAddition.
	self
		assert:
			(diffTree / self packageName1 / 'TestClass2') value definition
				isClassDefinition.
	self
		assert: (diffTree / self packageName1 / 'TestClass2') children size
		equals: 0
]
