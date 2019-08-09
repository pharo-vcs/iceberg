Class {
	#name : #IceTipRepositoryBrowserWithoutRemoteTest,
	#superclass : #IceTipRepositoryBrowserTest,
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #running }
IceTipRepositoryBrowserWithoutRemoteTest >> newFixture [
	
	^ IceSinglePackageFixture inGit
]

{ #category : #testing }
IceTipRepositoryBrowserWithoutRemoteTest >> setUp [
	super setUp.
	presenter := IceTipRepositoryBrowser
		onRepository: self repository.
	presenter openWithSpec
]

{ #category : #testing }
IceTipRepositoryBrowserWithoutRemoteTest >> tearDown [

	presenter ifNotNil: [ presenter window close ]
	"super tearDown"
]

{ #category : #testing }
IceTipRepositoryBrowserWithoutRemoteTest >> testHasNoFetchButtonOnTheLeft [
	self
		deny:
			(presenter toolbar leftItems
				anySatisfy: [ :aButton | aButton label = 'Fetch' ])
]

{ #category : #testing }
IceTipRepositoryBrowserWithoutRemoteTest >> testHasNoPullButtonOnTheLeft [
	self
		deny:
			(presenter toolbar leftItems
				anySatisfy: [ :aButton | aButton label = 'Pull' ])
]

{ #category : #testing }
IceTipRepositoryBrowserWithoutRemoteTest >> testHasNoPushButtonOnTheLeft [
	self
		deny:
			(presenter toolbar leftItems 
				anySatisfy: [ :aButton | aButton label = 'Push' ])
]
