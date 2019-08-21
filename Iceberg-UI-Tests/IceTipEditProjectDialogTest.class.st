Class {
	#name : #IceTipEditProjectDialogTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'dialog'
	],
	#category : #'Iceberg-UI-Tests'
}

{ #category : #testing }
IceTipEditProjectDialogTest class >> isAbstract [
	^ self name = #IceTipEditProjectDialogTest
]

{ #category : #running }
IceTipEditProjectDialogTest >> newFixture [

	self subclassResponsibility
]

{ #category : #running }
IceTipEditProjectDialogTest >> setUp [
	super setUp.
	dialog  := IceTipEditProjectDialog on: (IceBasicProject onRepository: self repository).
	dialog openDialogWithSpec 
]

{ #category : #running }
IceTipEditProjectDialogTest >> tearDown [
	dialog ifNotNil: [ dialog  window close ].
	super tearDown 
]

{ #category : #tests }
IceTipEditProjectDialogTest >> testCanChangeCodeDirectory [
 	|file |
	file := dialog sourceDirectoryTree roots first children first.
	dialog sourceDirectoryTree selectPath: { 1 . 1 } .
	self assert: (dialog sourceDirectoryTree selectedItem) equals: file.
	dialog owner triggerOkAction.
	self assert: (self repository workingCopy project sourceDirectoryPath) equals: (file relativeTo: dialog model fileSystem )
]

{ #category : #tests }
IceTipEditProjectDialogTest >> testCanChangeFormat [
 	|format previousFormat newFormat|
	previousFormat := 	dialog formatList selectedItem.
	dialog formatList selectedItem: dialog formatList getList first model .
	newFormat := dialog formatList selectedItem.
	self deny: newFormat equals: previousFormat .
	dialog owner triggerOkAction.
	self assert: (self repository properties fileFormat ) equals: newFormat .
]

{ #category : #tests }
IceTipEditProjectDialogTest >> testHasCodeDirectoryPicker [
	self assert: (dialog sourceDirectoryLabel label) equals: 'Code directory'.
	self assert: (dialog sourceDirectoryTree roots size ) equals: 1.
	self assert: (dialog sourceDirectoryTree roots first basename ) equals: self repository name
]

{ #category : #tests }
IceTipEditProjectDialogTest >> testHasFormatPicker [
	self assert: (dialog formatLabel label) equals: 'Format'.
	self assert: (dialog formatList getList size) equals: 2.
	self assert: (dialog formatList getList collect: [ :e | e model description ] ) equals: { 'Filetree' . 'Tonel'  }
]

{ #category : #tests }
IceTipEditProjectDialogTest >> testHasProjectName [
	self assert: (dialog nameLabel label) equals: 'Project Name'.
	self assert: (dialog nameInput label) equals: self repository name.
]
