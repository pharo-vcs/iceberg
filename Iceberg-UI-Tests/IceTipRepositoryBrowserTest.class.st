Class {
	#name : 'IceTipRepositoryBrowserTest',
	#superclass : 'IceAbstractTestCase',
	#instVars : [
		'presenter'
	],
	#category : 'Iceberg-UI-Tests-Browsers',
	#package : 'Iceberg-UI-Tests',
	#tag : 'Browsers'
}

{ #category : 'testing' }
IceTipRepositoryBrowserTest class >> isAbstract [

	^ self name = #IceTipRepositoryBrowserTest
]

{ #category : 'testing' }
IceTipRepositoryBrowserTest >> testHasAddRemoteButtonOnTheRight [
	self
		assert:
			(presenter toolbar rightItems
				anySatisfy: [ :aButton | aButton label = 'Add remote' ])
]

{ #category : 'testing' }
IceTipRepositoryBrowserTest >> testHasBranchButtonOnTheLeft [
	self
		assert:
			(presenter toolbar leftItems
				anySatisfy: [ :aButton | aButton label = 'Branch' ])
]

{ #category : 'testing' }
IceTipRepositoryBrowserTest >> testHasCorrectSideTreeBar [

	| rootNames |
	rootNames := presenter sidebarTree roots collect: #name.
	self assert: rootNames size equals: 3.
	self assertCollection: rootNames hasSameElements: {
		('Branches ' , self repository location pathString).
		'Remotes'.
		'Tags' }
]

{ #category : 'testing' }
IceTipRepositoryBrowserTest >> testHasHiedraHistoryBrowser [

	presenter historyPanel class = IceTipHiedraAltHistoryBrowser
]

{ #category : 'testing' }
IceTipRepositoryBrowserTest >> testHasMergeButtonOnTheLeft [
	self
		assert:
			(presenter toolbar leftItems
				anySatisfy: [ :aButton | 'Merge*' match: aButton label ])
]
