Class {
	#name : #IceTipRepositoryBrowserWithRemoteTest,
	#superclass : #IceTipRepositoryBrowserTest,
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #running }
IceTipRepositoryBrowserWithRemoteTest >> newFixture [
	^ IceWithRemoteFixture inGit
]

{ #category : #testing }
IceTipRepositoryBrowserWithRemoteTest >> setUp [
	super setUp.
	presenter := IceTipRepositoryBrowser onRepository: self repository.
	presenter openWithSpec.
]

{ #category : #testing }
IceTipRepositoryBrowserWithRemoteTest >> tearDown [
	presenter ifNotNil: [ "super tearDown" presenter window close ].
	super tearDown.
]

{ #category : #testing }
IceTipRepositoryBrowserWithRemoteTest >> testHasFetchButtonOnTheLeft [
	self
		assert:
			(presenter toolbar leftItems
				anySatisfy: [ :aButton | aButton label = 'Fetch' ])
]

{ #category : #testing }
IceTipRepositoryBrowserWithRemoteTest >> testHasPullButtonOnTheLeft [
	self
		assert:
			(presenter toolbar leftItems
				anySatisfy: [ :aButton | aButton label = 'Pull' ])
]

{ #category : #testing }
IceTipRepositoryBrowserWithRemoteTest >> testHasPushButtonOnTheLeft [
	self
		assert:
			(presenter toolbar leftItems
				anySatisfy: [ :aButton | aButton label = 'Push' ])
]
