Class {
	#name : #IceTipCommitBrowserTestWithRemoteSet,
	#superclass : #IceTipCommitBrowserTest,
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #running }
IceTipCommitBrowserTestWithRemoteSet >> newFixture [
	^ IceWithRemoteAndLocalCommitAndUpstreamFixture inGit
]

{ #category : #tests }
IceTipCommitBrowserTestWithRemoteSet >> testNotPushingAutomatically [
	
]

{ #category : #tests }
IceTipCommitBrowserTestWithRemoteSet >> testPushSettingCheckbox [
	| previousState |
	self
		assert: presenter commentPanel isPushing 
		equals: IceTipCommitSettings pushOnCommit.
	previousState := presenter commentPanel isPushing.
	presenter commentPanel pushCheckbox toggleState.
	self
		assert: previousState
		equals: IceTipCommitSettings pushOnCommit not.
	presenter commentPanel pushCheckbox toggleState
]

{ #category : #tests }
IceTipCommitBrowserTestWithRemoteSet >> testPushingAutomatically [
		| previousState |

	self repository workingCopy addPackageNamed: self packageName1.
	self repository workingCopy
		createClass: 'TestClass2'
		inPackage: self packageName1 asSymbol.
	self repository workingCopy
		createMethod: 'm1 ^42'
		inClass: 'TestClass2'.

	presenter := IceTipCommitBrowser onRepository: self repository.
	presenter openWithSpec.
	1 halt.
		previousState := presenter commentPanel pushCheckbox state.
		presenter commentPanel pushCheckbox state: true.
		presenter commentPanel commentText: 'my super commit message'
		presenter doCommit.
]
