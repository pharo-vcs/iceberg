Class {
	#name : #IceTipCommitBrowserTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'presenter'
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
	presenter openWithSpec.
	presenter commentPanel commentText text: 'my super commit message'.


]

{ #category : #running }
IceTipCommitBrowserTest >> tearDown [
	presenter ifNotNil: [ presenter window close ].
	super tearDown 
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
IceTipCommitBrowserTest >> testIsCommitingWithTheRightMessage [
	presenter doCommit.
	self
		assert: self repository branch commit comment
		equals: 'my super commit message'
]
