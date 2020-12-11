Class {
	#name : #IceTipWorkingCopyBrowserTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'presenter'
	],
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #testing }
IceTipWorkingCopyBrowserTest class >> isAbstract [

	^ self name = #IceTipWorkingCopyBrowserTest 
]

{ #category : #tests }
IceTipWorkingCopyBrowserTest >> contextMenuForIndex: index [

	presenter packagesTable selectIndex: index.
	^ presenter packagesTable contextMenu value.
]

{ #category : #running }
IceTipWorkingCopyBrowserTest >> setUp [
	super setUp.
	
	presenter := IceTipWorkingCopyBrowser onRepository: self repository.
	presenter openWithSpec.
]

{ #category : #running }
IceTipWorkingCopyBrowserTest >> tearDown [
	
	presenter window close.
	super tearDown.
	
	
]

{ #category : #tests }
IceTipWorkingCopyBrowserTest >> testItemsHasContextMenu [

	| menu |
	
	menu := self contextMenuForIndex: 1.
	self assert: menu isNotNil.
]

{ #category : #tests }
IceTipWorkingCopyBrowserTest >> testPackageHasBrowseRepositoryVersionOption [

	| menu |
	
	menu := self contextMenuForIndex: 1.
	self assert: (menu defaultGroup menuItems anySatisfy: [ :e | e name = 'Browse repository version' ])
]

{ #category : #tests }
IceTipWorkingCopyBrowserTest >> testPackageIsShownInList [

	self assert: (presenter packagesTable items anySatisfy: [ :each | each name = self packageName1 ])
]
