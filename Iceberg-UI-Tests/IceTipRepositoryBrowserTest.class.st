Class {
	#name : #IceTipRepositoryBrowserTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'presenter'
	],
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #testing }
IceTipRepositoryBrowserTest class >> isAbstract [

	^ self name = #IceTipRepositoryBrowserTest
]

{ #category : #testing }
IceTipRepositoryBrowserTest >> testHasAddRemoteButtonOnTheRight [
	self
		assert:
			(presenter toolbar rightItems
				anySatisfy: [ :aButton | aButton label = 'Add remote' ])
]

{ #category : #testing }
IceTipRepositoryBrowserTest >> testHasBranchButtonOnTheLeft [
	self
		assert:
			(presenter toolbar leftItems
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
			(presenter toolbar leftItems
				anySatisfy: [ :aButton | aButton label = 'Merge' ])
]
