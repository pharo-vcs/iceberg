Class {
	#name : 'IceTipRepositoriesBrowserTest',
	#superclass : 'IceAbstractTestCase',
	#instVars : [
		'presenter',
		'alphabeticallyFirstRepository',
		'repositoryProvider'
	],
	#category : 'Iceberg-UI-Tests-Browsers',
	#package : 'Iceberg-UI-Tests',
	#tag : 'Browsers'
}

{ #category : 'factory' }
IceTipRepositoriesBrowserTest >> newFixture [
	
	^ IceSinglePackageFixture inGit
]

{ #category : 'factory' }
IceTipRepositoriesBrowserTest >> newRepositoryNamed: aName [

	^ fixture factory newRepositoryNamed: aName
]

{ #category : 'running' }
IceTipRepositoriesBrowserTest >> setUp [

	| alphabeticallyLastRepository |
	super setUp.

	alphabeticallyFirstRepository := self newRepositoryNamed:
		                                 'anotherOne'.
	alphabeticallyLastRepository := self newRepositoryNamed: 'zzzz last'.

	repositoryProvider := IceTipCollectionRepositoryProvider new 
		                      collection: { 
				                      self repository.
				                      alphabeticallyLastRepository.
				                      alphabeticallyFirstRepository }
				                      asOrderedCollection.
	presenter := IceTipRepositoriesBrowser newOnRepositoryProvider:
		             repositoryProvider.
	presenter open
]

{ #category : 'running' }
IceTipRepositoriesBrowserTest >> tearDown [
	presenter ifNotNil: [ presenter window close ]. super tearDown
]

{ #category : 'tests - table' }
IceTipRepositoriesBrowserTest >> testAddRepositoryInModelWithoutRefreshDoesNotRefreshList [
	
	| previousList |
	previousList := presenter projectsPanelRepositoryList items.
	
	repositoryProvider addRepository: (self newRepositoryNamed: 'new repo').
	
	self assert: presenter projectsPanelRepositoryList items equals: previousList.
]

{ #category : 'tests - table' }
IceTipRepositoriesBrowserTest >> testAddRepositoryInModelWithoutRefreshDoesNotShowNewRepository [
	
	| newRepository |
	newRepository := self newRepositoryNamed: 'new repo'.
	repositoryProvider addRepository: newRepository.
	
	self deny: (presenter projectsPanelIsShowingRepository: newRepository)
]

{ #category : 'tests - table' }
IceTipRepositoriesBrowserTest >> testAddRepositoryThenRefreshShowsNewRepository [
	
	| newRepository |
	newRepository := self newRepositoryNamed: 'new repo'.
	repositoryProvider addRepository: newRepository.
	presenter refresh.
	
	self assert: (presenter projectsPanelIsShowingRepository: newRepository)
]

{ #category : 'tests - table' }
IceTipRepositoriesBrowserTest >> testEditRepositoryBranchThenRefreshDoesRefreshList [
	
	self
		testEditThenRefreshRepositoryProperty: #branchName
		doing: [ :repository | repository createBranch: 'toto' ]
		makesPropertyValueTo: 'toto'
]

{ #category : 'tests - table' }
IceTipRepositoriesBrowserTest >> testEditRepositoryNameThenRefreshDoesRefreshList [
	
	| newName |	
	newName := 'newname'.
	self
		testEditThenRefreshRepositoryProperty: #name
		doing: [ :repository | repository name: newName ]
		makesPropertyValueTo: newName
]

{ #category : 'tests - table' }
IceTipRepositoriesBrowserTest >> testEditRepositoryProperty: aProperty doing: aBlock makesPropertyValueTo: aValue [

	| firstRepository repositoryModel oldValue newValue |
	firstRepository := repositoryProvider repositories last.
	repositoryModel := presenter projectsPanelRepositoryModels detect: [
		                   :m | m isModelOf: firstRepository ].
	oldValue := repositoryModel perform: aProperty.
	aBlock value: firstRepository.

	"Get again the repository model in case it was changed"
	repositoryModel := presenter projectsPanelRepositoryModels detect: [
		                   :m | m isModelOf: firstRepository ].


	self assert: repositoryModel entity equals: firstRepository.

	newValue := repositoryModel perform: aProperty.
	self assert: newValue equals: aValue
]

{ #category : 'tests - table' }
IceTipRepositoriesBrowserTest >> testEditRepositoryStatusThenRefreshDoesRefreshList [
	
	self
		testEditThenRefreshRepositoryProperty: #status
		doing: [ :repository |
			"Make the repository missing by removing its underlying repository"
			repository repositoryDirectory ensureDeleteAll ]
		makesPropertyValueTo: (IceTipRepositoryModel on: nil) localRepositoryMissing
]

{ #category : 'tests - table' }
IceTipRepositoriesBrowserTest >> testEditThenRefreshRepositoryProperty: aProperty doing: aBlock makesPropertyValueTo: aValue [

	self
		testEditRepositoryProperty: aProperty
		doing: [ :repository |
			aBlock value: repository.
			presenter refresh ]
		makesPropertyValueTo: aValue
]

{ #category : 'tests - structural' }
IceTipRepositoriesBrowserTest >> testHasAddButtonOnTheRight [

	self assert: (presenter toolbar rightItems anySatisfy: [:aButton | aButton label = 'Add']).
]

{ #category : 'tests - structural' }
IceTipRepositoriesBrowserTest >> testHasFetchAllButtonOnTheLeft [

	self assert: (presenter toolbar leftItems anySatisfy: [:aButton | aButton label = 'Fetch all']).
]

{ #category : 'tests - structural' }
IceTipRepositoriesBrowserTest >> testHasSettingsButtonOnTheRight [

	self assert: (presenter toolbar rightItems anySatisfy: [:aButton | aButton label = 'Settings']).
]

{ #category : 'tests - table' }
IceTipRepositoriesBrowserTest >> testInitialListShowsElementsInOriginalOrder [
	
	self
		assert: (presenter projectsPanelRepositoryList valueAtColumn: 1 row: 1)
		equals: presenter projectsPanelRepositoryList items first description.
	self
		assert: (presenter projectsPanelRepositoryList valueAtColumn: 1 row: 2)
		equals: presenter projectsPanelRepositoryList items second description.
	self
		assert: (presenter projectsPanelRepositoryList valueAtColumn: 1 row: 3)
		equals: presenter projectsPanelRepositoryList items third description.
]

{ #category : 'tests - context menu' }
IceTipRepositoriesBrowserTest >> testListHasContextMenuHasPackagesOptionEnabled [
	
	| menu |
	
	presenter projectsPanelRepositoryList selectIndex: 1.
	menu := presenter projectsPanelRepositoryList contextMenu value.
	
	self assert: (menu defaultGroup menuItems at: 1) name equals: 'Packages'.
	self assert: (menu defaultGroup menuItems at: 1) isEnabled
]

{ #category : 'tests - context menu' }
IceTipRepositoriesBrowserTest >> testListHasContextMenuHasRepairRepositoryOptionDisabled [

	| menu |
	presenter projectsPanelRepositoryList selectIndex: 1.
	menu := presenter projectsPanelRepositoryList contextMenu value.

	self deny: (menu defaultGroup menuItems anySatisfy: [ :each | 
			 each name = IceTipRepairCommand defaultName ])
]

{ #category : 'tests - context menu' }
IceTipRepositoriesBrowserTest >> testListHasContextMenuOnSelection [

	| menu |

	presenter projectsPanelRepositoryList selectIndex: 1.
	menu := presenter projectsPanelRepositoryList contextMenu value.
	
	self assert: menu defaultGroup menuItems isNotEmpty
]

{ #category : 'tests - table' }
IceTipRepositoriesBrowserTest >> testListShowsNotLoadedProject [
	
	self assert: (presenter projectsPanelRepositoryList valueAtColumn: 1 row: 3) equals: '*anotherOne'.
	self assert: (presenter projectsPanelRepositoryList valueAtColumn: 2 row: 3) equals: 'Not loaded'.
	self assert: (presenter projectsPanelRepositoryList valueAtColumn: 3 row: 3) equals: 'master'.
]

{ #category : 'tests - table' }
IceTipRepositoriesBrowserTest >> testListShowsUpToDateProject [

	self assert: (presenter projectsPanelRepositoryList valueAtColumn: 1 row: 1) equals: 'test-project'.
	self assert: (presenter projectsPanelRepositoryList valueAtColumn: 2 row: 1) equals: 'Up to date'. 	
	self assert: (presenter projectsPanelRepositoryList valueAtColumn: 3 row: 1) equals: 'master'. 
]

{ #category : 'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingByBranchDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 3
]

{ #category : 'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingByNameDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 1.
]

{ #category : 'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingByStatusDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 2
]

{ #category : 'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingDescendingByBranchDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 3.
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 3.
]

{ #category : 'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingDescendingByNameDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 1.
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 1.
]

{ #category : 'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingDescendingByStatusDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 2.
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 2.
]

{ #category : 'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingOriginalByBranchDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 3.
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 3.
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 3.
]

{ #category : 'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingOriginalByNameDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 1.
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 1.
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 1.
]

{ #category : 'tests - table sorting' }
IceTipRepositoriesBrowserTest >> testSortingOriginalByStatusDoesNotFail [
	
	"Smoke test because there is no way to access the real shown elements for now"
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 2.
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 2.
	presenter projectsPanelRepositoryList clickOnColumnHeaderAt: 2.
]

{ #category : 'tests - table' }
IceTipRepositoriesBrowserTest >> testTableHasTheCorrectColumns [

	self assertCollection: (presenter projectsPanelRepositoryList columns collect: #title) hasSameElements:  { 'Repositories'. 'Status'. 'Branch'}
]
