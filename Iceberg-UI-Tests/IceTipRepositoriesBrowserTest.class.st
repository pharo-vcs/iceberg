Class {
	#name : #IceTipRepositoriesBrowserTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'presenter',
		'alphabeticallyFirstRepository',
		'repositoryProvider'
	],
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #running }
IceTipRepositoriesBrowserTest >> newFixture [
	
	^ IceSinglePackageFixture inGit
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> newRepositoryNamed: aName [

	^ fixture factory newRepositoryNamed: aName
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> setUp [
	| alphabeticallyLastRepository |
	super setUp.
	
	alphabeticallyFirstRepository := self newRepositoryNamed: 'anotherOne'.
	alphabeticallyLastRepository := self newRepositoryNamed: 'zzzz last'.
	
	repositoryProvider := IceTipCollectionRepositoryProvider new collection: {
		self repository. 
		alphabeticallyLastRepository . 
		alphabeticallyFirstRepository } asOrderedCollection.
	presenter := IceTipRepositoriesBrowser newOnRepositoryProvider: repositoryProvider.
	presenter openWithSpec.
]

{ #category : #testing }
IceTipRepositoriesBrowserTest >> tearDown [
	presenter ifNotNil: [ presenter window close ]. super tearDown
]

{ #category : #'tests - table' }
IceTipRepositoriesBrowserTest >> testAddRepositoryInModelWithoutRefreshDoesNotRefreshList [
	
	| previousList |
	previousList := presenter repositoryList items.
	
	repositoryProvider addRepository: (self newRepositoryNamed: 'new repo').
	
	self assert: presenter repositoryList items equals: previousList.
]

{ #category : #'tests - table' }
IceTipRepositoriesBrowserTest >> testAddRepositoryInModelWithoutRefreshDoesNotShowNewRepository [
	
	| newRepository |
	newRepository := self newRepositoryNamed: 'new repo'.
	repositoryProvider addRepository: newRepository.
	
	self deny: (presenter isShowingRepository: newRepository)
]

{ #category : #'tests - table' }
IceTipRepositoriesBrowserTest >> testAddRepositoryThenRefreshShowsNewRepository [
	
	| newRepository |
	newRepository := self newRepositoryNamed: 'new repo'.
	repositoryProvider addRepository: newRepository.
	presenter refresh.
	
	self assert: (presenter isShowingRepository: newRepository)
]

{ #category : #'tests - table' }
IceTipRepositoriesBrowserTest >> testEditRepositoryBranchThenRefreshDoesRefreshList [
	
	| firstRepository oldBranchName repositoryModel |	
	firstRepository := repositoryProvider repositories first.

	repositoryModel := presenter repositoryModels first.
	oldBranchName := repositoryModel branchNameText.

	"Make the repository missing by removing its underlying repository"
	firstRepository createBranch: 'toto'.
	presenter refresh.
	repositoryModel := presenter repositoryModels first.
	
	self assert: repositoryModel branchNameText equals: 'toto' asText
]

{ #category : #'tests - table' }
IceTipRepositoriesBrowserTest >> testEditRepositoryBranchWithoutRefreshDoesNotRefreshList [
	
	| firstRepository oldBranchName repositoryModel |	
	firstRepository := repositoryProvider repositories first.

	repositoryModel := presenter repositoryModels first.
	oldBranchName := repositoryModel branchNameText.

	"Make the repository missing by removing its underlying repository"
	firstRepository createBranch: 'toto'.	
	repositoryModel := presenter repositoryModels first.
	
	self assert: repositoryModel branchNameText equals: oldBranchName
]

{ #category : #'tests - table' }
IceTipRepositoriesBrowserTest >> testEditRepositoryNameThenRefreshDoesRefreshList [
	
	| firstRepository oldName newName |	
	firstRepository := repositoryProvider repositories first.
	newName := 'newname'.
	oldName := firstRepository name.

	"Force the caching..."
	presenter repositoryModels first name.

	"Change the name then refresh."
	firstRepository name: newName.	
	presenter refresh.
	
	self assert: presenter repositoryModels first name equals: newName
]

{ #category : #'tests - table' }
IceTipRepositoriesBrowserTest >> testEditRepositoryNameWithoutRefreshDoesNotRefreshList [
	
	| firstRepository oldName |
	firstRepository := repositoryProvider repositories first.
	oldName := firstRepository name.
	
	"Force the caching..."
	presenter repositoryModels first name.
	
	"Change the name. This should not change the model"
	firstRepository name: 'newname'.
	
	self assert: presenter repositoryModels first name equals: oldName.
]

{ #category : #'tests - table' }
IceTipRepositoriesBrowserTest >> testEditRepositoryStatusThenRefreshDoesRefreshList [
	
	| firstRepository oldStatus repositoryModel |	
	firstRepository := repositoryProvider repositories first.

	repositoryModel := presenter repositoryModels first.
	oldStatus := repositoryModel statusText.

	"Make the repository missing by removing its underlying repository"
	firstRepository repositoryDirectory ensureDeleteAll.	
	presenter refresh.
	repositoryModel := presenter repositoryModels first.
	
	self assert: repositoryModel statusText equals: repositoryModel localRepositoryMissingText
]

{ #category : #'tests - table' }
IceTipRepositoriesBrowserTest >> testEditRepositoryStatusWithoutRefreshDoesNotRefreshList [
	
	| firstRepository oldBranchName repositoryModel |	
	firstRepository := repositoryProvider repositories first.

	repositoryModel := presenter repositoryModels first.
	oldBranchName := repositoryModel statusText.

	"Make the repository missing by removing its underlying repository"
	firstRepository repositoryDirectory ensureDeleteAll.	
	repositoryModel := presenter repositoryModels first.
	
	self assert: repositoryModel statusText equals: oldBranchName
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
