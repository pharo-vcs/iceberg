Class {
	#name : 'IceTipCommitBrowserTest',
	#superclass : 'IceAbstractTestCase',
	#instVars : [
		'presenter',
		'saveMock'
	],
	#category : 'Iceberg-UI-Tests-Browsers',
	#package : 'Iceberg-UI-Tests',
	#tag : 'Browsers'
}

{ #category : 'testing' }
IceTipCommitBrowserTest class >> isAbstract [
	^ self name = #IceTipCommitBrowserTest
]

{ #category : 'running' }
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
	presenter open.
	presenter commentPanel commentText text: 'my super commit message'
]

{ #category : 'running' }
IceTipCommitBrowserTest >> tearDown [

	presenter ifNotNil: [ presenter window close ].
	super tearDown 
]

{ #category : 'tests' }
IceTipCommitBrowserTest >> testAcceptShortcutInCommentBoxTriggersCommit [
	| oldStatus |
	
	oldStatus := presenter commentPanel isSaving.
	presenter commentPanel saveOnCommit: true.
	
	[
		self assert: saveMock timesExecuted equals: 0.
		presenter commentPanel commentText adapter 
			keyDown: $s asciiValue 
			shift: false 
			meta: true
			control: false
			option: false.
		self assert: saveMock timesExecuted equals: 1 ]
	ensure: [
		presenter commentPanel saveOnCommit: oldStatus ]
]

{ #category : 'tests' }
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

{ #category : 'tests' }
IceTipCommitBrowserTest >> testHasCommentPanelWithSavingSettings [
	| previousState |
	
	self assert: presenter commentPanel class equals: IceTipCommentPanel.
	self
		assert: presenter commentPanel isSaving 
		equals: IceTipCommitSettings saveImageOnCommit.
	previousState := presenter commentPanel isSaving.
	[
		presenter commentPanel saveOnCommit: presenter commentPanel isSaving not.
		self
			assert: previousState
			equals: IceTipCommitSettings saveImageOnCommit not ]
	ensure: [ 
		presenter commentPanel saveOnCommit: previousState ]
]

{ #category : 'tests' }
IceTipCommitBrowserTest >> testHasDiffPanel [
	self
		assert: presenter diffPanel class equals: IceTipDiffSelectingPanel 
]

{ #category : 'tests' }
IceTipCommitBrowserTest >> testIsAutomaticallySavingWhenChecked [
	| previousState|
	
	previousState := presenter commentPanel isSaving.
	presenter commentPanel saveOnCommit: true.
	[
		presenter doCommit.
		self assert: saveMock timesExecuted equals: 1 ]
	ensure: [
		presenter commentPanel saveOnCommit: previousState ]
	
]

{ #category : 'tests' }
IceTipCommitBrowserTest >> testIsCommittingCheckedItems [
	| diffTree |

	presenter doCommit.
	diffTree := self workingCopy repository branch commit diffToParent	tree.
	self assert: (diffTree / self packageName1) children size equals: 2.
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

{ #category : 'tests' }
IceTipCommitBrowserTest >> testIsCommittingWithTheRightMessage [
	presenter doCommit.
	self
		assert: self repository branch commit comment
		equals: 'my super commit message'
]

{ #category : 'tests' }
IceTipCommitBrowserTest >> testIsNotAutomaticallySavingWhenNotChecked [
	| previousState |
	
	previousState := presenter commentPanel isSaving.
	presenter commentPanel saveOnCommit: false.
	[
		presenter doCommit.
		self assert: saveMock  timesExecuted equals: 0 ]
	ensure: [ 
		presenter commentPanel saveOnCommit: previousState ]
]

{ #category : 'tests' }
IceTipCommitBrowserTest >> testIsNotCommittingUncheckedItems [
	| diffTree |
	presenter diffPanel selectedItems
		remove:
			((presenter diffPanel selectedItems asOrderedCollection
				select: [ :node | node value description = #m1 ]) at: 1 ).
	presenter doCommit.
	diffTree := self workingCopy repository branch commit diffToParent
		tree.
	self assert: (diffTree / self packageName1) children size equals: 2.
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
