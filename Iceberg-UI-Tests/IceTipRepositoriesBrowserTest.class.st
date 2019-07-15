Class {
	#name : #IceTipRepositoriesBrowserTest,
	#superclass : #IceAbstractTestCase,
	#instVars : [
		'presenter'
	],
	#category : #'Iceberg-UI-Tests'
}

{ #category : #testing }
IceTipRepositoriesBrowserTest >> setUp [
	"super setUp."
	presenter := IceTipRepositoriesBrowser new.
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
