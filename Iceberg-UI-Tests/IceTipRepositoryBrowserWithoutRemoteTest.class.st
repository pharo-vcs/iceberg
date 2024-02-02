Class {
	#name : 'IceTipRepositoryBrowserWithoutRemoteTest',
	#superclass : 'IceTipRepositoryBrowserTest',
	#category : 'Iceberg-UI-Tests-Browsers',
	#package : 'Iceberg-UI-Tests',
	#tag : 'Browsers'
}

{ #category : 'factory' }
IceTipRepositoryBrowserWithoutRemoteTest >> newFixture [
	
	^ IceSinglePackageFixture inGit
]

{ #category : 'running' }
IceTipRepositoryBrowserWithoutRemoteTest >> setUp [

	super setUp.
	presenter := IceTipRepositoryBrowser onRepository: self repository.
	presenter open
]

{ #category : 'running' }
IceTipRepositoryBrowserWithoutRemoteTest >> tearDown [

	presenter ifNotNil: [ presenter window close ].
	super tearDown
]

{ #category : 'testing' }
IceTipRepositoryBrowserWithoutRemoteTest >> testHasNoFetchButtonOnTheLeft [
	self
		deny:
			(presenter toolbar leftItems
				anySatisfy: [ :aButton | aButton label = 'Fetch' ])
]

{ #category : 'testing' }
IceTipRepositoryBrowserWithoutRemoteTest >> testHasNoPullButtonOnTheLeft [
	self
		deny:
			(presenter toolbar leftItems
				anySatisfy: [ :aButton | aButton label = 'Pull' ])
]

{ #category : 'testing' }
IceTipRepositoryBrowserWithoutRemoteTest >> testHasNoPushButtonOnTheLeft [
	self
		deny:
			(presenter toolbar leftItems 
				anySatisfy: [ :aButton | aButton label = 'Push' ])
]
