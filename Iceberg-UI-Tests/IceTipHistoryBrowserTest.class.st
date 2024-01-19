Class {
	#name : 'IceTipHistoryBrowserTest',
	#superclass : 'IceAbstractTestCase',
	#instVars : [
		'presenter'
	],
	#category : 'Iceberg-UI-Tests-Browsers',
	#package : 'Iceberg-UI-Tests',
	#tag : 'Browsers'
}

{ #category : 'running' }
IceTipHistoryBrowserTest >> newFixture [
	^ IceWithRemoteAndLocalCommitFixture inGit
]

{ #category : 'running' }
IceTipHistoryBrowserTest >> setUp [

	| model iceTipPullModel |
	super setUp.
	model := IceTipRepositoryModel on: self repository.
	iceTipPullModel := IceTipPullModel
		                   repositoryModel: model
		                   on: model entity.
	presenter := IceTipHistoryBrowser on: iceTipPullModel.
	presenter open
]

{ #category : 'running' }
IceTipHistoryBrowserTest >> tearDown [
	presenter ifNotNil: [ presenter window close ].
	super tearDown 
]

{ #category : 'running' }
IceTipHistoryBrowserTest >> testCommitListDisplayData [
	| commit |
	commit := (presenter commitList items at: 1).
	self
		assert: (presenter commitList valueAtColumn: 4 row: 1)
		equals: commit description.
	self
		assert: (presenter commitList valueAtColumn: 3 row: 1)
		equals: commit author.
	self
		assert: (presenter commitList valueAtColumn: 2 row: 1)
		equals: commit shortId.
	self
		assert: (presenter commitList valueAtColumn: 1 row: 1)
		equals: commit datetime asLocalStringYMDHM
]

{ #category : 'running' }
IceTipHistoryBrowserTest >> testCommitListHasTheCorrectColumns [
	self assertCollection: (presenter commitList columns collect: #title ) hasSameElements:  { 'Timestamp' . 'Commit' . 'Author' . 'Description'}
]

{ #category : 'running' }
IceTipHistoryBrowserTest >> testHasDiffPanel [
	self
		assert: presenter commitInfoTabs class = IceTipCommitInfoPresenter
]
