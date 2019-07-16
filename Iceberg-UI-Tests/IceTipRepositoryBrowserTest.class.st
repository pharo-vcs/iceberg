Class {
	#name : #IceTipRepositoryBrowserTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'presenter'
	],
	#category : #'Iceberg-UI-Tests'
}

{ #category : #testing }
IceTipRepositoryBrowserTest class >> isAbstract [

	^ self name = #IceTipRepositoryBrowserTest
]

{ #category : #testing }
IceTipRepositoryBrowserTest >> testHasAddRemoteButtonOnTheRight [
	self
		assert:
			(presenter toolbar rightPanel items
				anySatisfy: [ :aButton | aButton label = 'Add remote' ])
]

{ #category : #testing }
IceTipRepositoryBrowserTest >> testHasBranchButtonOnTheLeft [
	self
		assert:
			(presenter toolbar leftPanel items
				anySatisfy: [ :aButton | aButton label = 'Branch' ])
]

{ #category : #testing }
IceTipRepositoryBrowserTest >> testHasCorrectSideTreeBar [
	self
		assertCollection: (presenter sidebarTree roots collect: #name)
		hasSameElements: {'Branches' . 'Remotes' . 'Tags'}

]

{ #category : #testing }
IceTipRepositoryBrowserTest >> testHasHiedraHistoryBrowser [
	presenter historyPanel class = IceTipHiedraHistoryBrowser
]

{ #category : #testing }
IceTipRepositoryBrowserTest >> testHasMergeButtonOnTheLeft [
	self
		assert:
			(presenter toolbar leftPanel items
				anySatisfy: [ :aButton | aButton label = 'Merge' ])
]
