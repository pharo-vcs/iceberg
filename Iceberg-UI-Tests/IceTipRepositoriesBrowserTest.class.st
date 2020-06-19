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

{ #category : #'tests - structural' }
IceTipRepositoriesBrowserTest >> testHasAddButtonOnTheRight [

	self assert: (presenter toolbar rightItems anySatisfy: [:aButton | aButton label = 'Add']).
]

{ #category : #'tests - structural' }
IceTipRepositoriesBrowserTest >> testHasFetchAllButtonOnTheLeft [

	self assert: (presenter toolbar leftItems anySatisfy: [:aButton | aButton label = 'Fetch all']).
]

{ #category : #'tests - structural' }
IceTipRepositoriesBrowserTest >> testHasSettingsButtonOnTheRight [

	self assert: (presenter toolbar rightItems anySatisfy: [:aButton | aButton label = 'Settings']).
]

{ #category : #'tests - table' }
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

{ #category : #'tests - context menu' }
IceTipRepositoriesBrowserTest >> testListHasContextMenuHasPackagesOptionEnabled [
	
	| menu |
	
	presenter repositoryList selectIndex: 1.
	menu := presenter repositoryList contextMenu value.
	
	self assert: (menu defaultGroup menuItems at: 1) name equals: 'Packages'.
	self assert: (menu defaultGroup menuItems at: 1) isEnabled
]

{ #category : #'tests - context menu' }
IceTipRepositoriesBrowserTest >> testListHasContextMenuHasRepairRepositoryOptionDisabled [
	
	| menu |
	
	presenter repositoryList selectIndex: 1.
	menu := presenter repositoryList contextMenu value.
	
	self assert: (menu defaultGroup menuItems at: 2) name equals: 'Repair repository'.
	self deny: (menu defaultGroup menuItems at: 2) isEnabled
]

{ #category : #'tests - context menu' }
IceTipRepositoriesBrowserTest >> testListHasContextMenuOnSelection [

	| menu |

	presenter repositoryList selectIndex: 1.
	menu := presenter repositoryList contextMenu value.
	
	self assert: menu defaultGroup menuItems isNotEmpty
]

{ #category : #'tests - table' }
IceTipRepositoriesBrowserTest >> testListShowsNotLoadedProject [
	
	self assert: (presenter repositoryList valueAtColumn: 1 row: 3) equals: '*anotherOne' asText.
	self assert: (presenter repositoryList valueAtColumn: 2 row: 3) equals: 'Not loaded' asText.
	self assert: (presenter repositoryList valueAtColumn: 3 row: 3) equals: 'master' asText.
]

{ #category : #'tests - table' }
IceTipRepositoriesBrowserTest >> testListShowsUpToDateProject [

	self assert: (presenter repositoryList valueAtColumn: 1 row: 1) equals: 'test-project'.
	self assert: (presenter repositoryList valueAtColumn: 2 row: 1) equals: 'Up to date'. 	
	self assert: (presenter repositoryList valueAtColumn: 3 row: 1) equals: 'master'. 
]

{ #category : #'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingByBranchDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 3
]

{ #category : #'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingByNameDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 1.
]

{ #category : #'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingByStatusDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 2
]

{ #category : #'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingDescendingByBranchDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 3.
	presenter repositoryList clickOnColumnHeaderAt: 3.
]

{ #category : #'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingDescendingByNameDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 1.
	presenter repositoryList clickOnColumnHeaderAt: 1.
]

{ #category : #'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingDescendingByStatusDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 2.
	presenter repositoryList clickOnColumnHeaderAt: 2.
]

{ #category : #'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingOriginalByBranchDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 3.
	presenter repositoryList clickOnColumnHeaderAt: 3.
	presenter repositoryList clickOnColumnHeaderAt: 3.
]

{ #category : #'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingOriginalByNameDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 1.
	presenter repositoryList clickOnColumnHeaderAt: 1.
	presenter repositoryList clickOnColumnHeaderAt: 1.
]

{ #category : #'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingOriginalByStatusDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter repositoryList clickOnColumnHeaderAt: 2.
	presenter repositoryList clickOnColumnHeaderAt: 2.
	presenter repositoryList clickOnColumnHeaderAt: 2.
]

{ #category : #'tests - table' }
IceTipRepositoriesBrowserTest >> testTableHasTheCorrectColumns [

	self assertCollection: (presenter repositoryList columns collect: #title) hasSameElements:  { 'Repositories'. 'Status'. 'Branch'}
]
