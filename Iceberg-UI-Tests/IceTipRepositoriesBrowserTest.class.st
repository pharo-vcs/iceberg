Class {
	#name : #IceTipRepositoriesBrowserTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'presenter',
		'alphabeticallyFirstRepository'
	],
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #running }
IceTipRepositoriesBrowserTest >> newFixture [
	
	^ IceSinglePackageFixture inGit
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> setUp [
	| alphabeticallyLastRepository |
	super setUp.
	
	alphabeticallyFirstRepository := fixture factory newRepositoryNamed: 'anotherOne'.
	alphabeticallyLastRepository := fixture factory newRepositoryNamed: 'zzzz last'.
	
	presenter := IceTipRepositoriesBrowser newOnRepositories: {self repository. alphabeticallyLastRepository . alphabeticallyFirstRepository}.
	presenter openWithSpec.
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> tearDown [
	presenter ifNotNil: [ presenter window close ]. super tearDown
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testHasAddButtonOnTheRight [

	self assert: (presenter toolbar rightItems anySatisfy: [:aButton | aButton label = 'Add']).
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testHasFetchAllButtonOnTheLeft [

	self assert: (presenter toolbar leftItems anySatisfy: [:aButton | aButton label = 'Fetch all']).
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testHasSettingsButtonOnTheRight [

	self assert: (presenter toolbar rightItems anySatisfy: [:aButton | aButton label = 'Settings']).
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testInitialListShowsElementsInOriginalOrder [
	
	self
		assert: (presenter repositoryList valueAtColumn: 1 row: 1)
		equals: presenter repositoryList items first descriptionWithDecoration asString.
	self
		assert: (presenter repositoryList valueAtColumn: 1 row: 2)
		equals: presenter repositoryList items second descriptionWithDecoration asString.
	self
		assert: (presenter repositoryList valueAtColumn: 1 row: 3)
		equals: presenter repositoryList items third descriptionWithDecoration asString.
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
	
	self assert: (presenter repositoryList valueAtColumn: 1 row: 3) equals: '*anotherOne'.
	self assert: (presenter repositoryList valueAtColumn: 2 row: 3) equals: 'Not loaded'. 	
	self assert: (presenter repositoryList valueAtColumn: 3 row: 3) equals: 'master'. 
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testListShowsUpToDateProject [

	self assert: (presenter repositoryList valueAtColumn: 1 row: 1) equals: 'test-project'.
	self assert: (presenter repositoryList valueAtColumn: 2 row: 1) equals: 'Up to date'. 	
	self assert: (presenter repositoryList valueAtColumn: 3 row: 1) equals: 'master'. 
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testSortingByBranchDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 3
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testSortingByNameDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 1.
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testSortingByStatusDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 2
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testSortingDescendingByBranchDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 3.
	presenter repositoryList clickOnColumnHeaderAt: 3.
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testSortingDescendingByNameDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 1.
	presenter repositoryList clickOnColumnHeaderAt: 1.
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testSortingDescendingByStatusDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 2.
	presenter repositoryList clickOnColumnHeaderAt: 2.
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testSortingOriginalByBranchDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 3.
	presenter repositoryList clickOnColumnHeaderAt: 3.
	presenter repositoryList clickOnColumnHeaderAt: 3.
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testSortingOriginalByNameDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 1.
	presenter repositoryList clickOnColumnHeaderAt: 1.
	presenter repositoryList clickOnColumnHeaderAt: 1.
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testSortingOriginalByStatusDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 2.
	presenter repositoryList clickOnColumnHeaderAt: 2.
	presenter repositoryList clickOnColumnHeaderAt: 2.
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> testTableHasTheCorrectColumns [

	self assertCollection: (presenter repositoryList columns collect: #title) hasSameElements:  { 'Repositories'. 'Status'. 'Branch'}
]
