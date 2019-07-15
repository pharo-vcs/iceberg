Class {
	#name : #IceTipRepositoriesBrowserTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'presenter',
		'repo2'
	],
	#category : #'Iceberg-UI-Tests'
}

{ #category : #running }
IceTipRepositoriesBrowserTest >> newFixture [
	
	^ IceSinglePackageFixture inGit
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> setUp [
	super setUp.
	
	repo2 := fixture factory newRepositoryNamed: 'anotherOne'.
	
	presenter := IceTipRepositoriesBrowser newOnRepositories: {self repository. repo2}.
	presenter openWithSpec.
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> tearDown [

	presenter ifNotNil: [ presenter window close ]
	"super tearDown"
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testHasAddButtonOnTheRight [

	self assert: (presenter toolbar rightPanel items anySatisfy: [:aButton | aButton label = 'Add']).
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testHasFetchAllButtonOnTheLeft [

	self assert: (presenter toolbar leftPanel items anySatisfy: [:aButton | aButton label = 'Fetch all']).
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testHasSettingsButtonOnTheRight [

	self assert: (presenter toolbar rightPanel items anySatisfy: [:aButton | aButton label = 'Settings']).
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testListHasContextMenuHasPackagesOptionEnabled [
	
	| menu |
	
	presenter repositoryList selectIndex: 1.
	menu := presenter repositoryList contextMenu value.
	
	self assert: (menu defaultGroup menuItems at: 1) name equals: 'Packages'.
	self assert: (menu defaultGroup menuItems at: 1) isEnabled
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testListHasContextMenuHasRepairRepositoryOptionDisabled [
	
	| menu |
	
	presenter repositoryList selectIndex: 1.
	menu := presenter repositoryList contextMenu value.
	
	self assert: (menu defaultGroup menuItems at: 2) name equals: 'Repair repository'.
	self deny: (menu defaultGroup menuItems at: 2) isEnabled
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testListHasContextMenuOnSelection [

	| menu |

	presenter repositoryList selectIndex: 1.
	menu := presenter repositoryList contextMenu value.
	
	self assert: menu defaultGroup menuItems isNotEmpty
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testListShowsNotLoadedProject [
	
	self assert: (presenter repositoryList valueAtColumn: 1 row: 2) equals: '*anotherOne'.
	self assert: (presenter repositoryList valueAtColumn: 2 row: 2) equals: 'Not loaded'. 	
	self assert: (presenter repositoryList valueAtColumn: 3 row: 2) equals: 'master'. 
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testListShowsUpToDateProject [
	
	self assert: (presenter repositoryList valueAtColumn: 1 row: 1) equals: 'test-project'.
	self assert: (presenter repositoryList valueAtColumn: 2 row: 1) equals: 'Up to date'. 	
	self assert: (presenter repositoryList valueAtColumn: 3 row: 1) equals: 'master'. 
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testTableHasTheCorrectColumns [

	self assertCollection: (presenter repositoryList columns collect: #title) hasSameElements:  { 'Repositories'. 'Status'. 'Branch'}
]
