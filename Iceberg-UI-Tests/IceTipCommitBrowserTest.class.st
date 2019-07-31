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
	presenter := IceTipCommitBrowser onRepository: self repository.
	presenter openWithSpec
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
