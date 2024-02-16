Class {
	#name : 'IceTipCommitBrowserTestWithRemoteSetTest',
	#superclass : 'IceTipCommitBrowserTest',
	#category : 'Iceberg-UI-Tests-Browsers',
	#package : 'Iceberg-UI-Tests',
	#tag : 'Browsers'
}

{ #category : 'running' }
IceTipCommitBrowserTestWithRemoteSetTest >> newFixture [
	^ IceClonedFromRemoteFixture inGit
]

{ #category : 'tests' }
IceTipCommitBrowserTestWithRemoteSetTest >> testNotPushingAutomatically [
	| previousState |
	previousState := presenter commentPanel isPushing.
	presenter commentPanel pushCheckbox state: false.
	presenter doCommit.
	self assert: fixture pushRepository branch commit ancestors isEmpty.
	presenter commentPanel pushCheckbox state: previousState
]

{ #category : 'tests' }
IceTipCommitBrowserTestWithRemoteSetTest >> testPushSettingCheckbox [
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

{ #category : 'tests' }
IceTipCommitBrowserTestWithRemoteSetTest >> testPushingAutomatically [
	| previousState diffTree |
	previousState := presenter commentPanel isPushing.
	presenter commentPanel pushCheckbox state: true.
	presenter doCommit.
	diffTree := fixture pushRepository branch commit diffToParent
		tree.
	self assert: (diffTree / self packageName1) children size equals: 2.
	self assert: (diffTree / self packageName1) value isNoModification.
	self
		assert: (diffTree / self packageName1 / 'TestClass2') value isAddition.
	self
		assert:
			(diffTree / self packageName1 / 'TestClass2') value definition
				isClassDefinition.
	self
		assert: (diffTree / self packageName1 / 'TestClass2') children size
		equals: 1.
	self
		assert: (diffTree / self packageName1 / 'TestClass2' / 'm1') value isAddition.
	self
		assert:
			(diffTree / self packageName1 / 'TestClass2' / 'm1') value definition
				isMethodDefinition.
	presenter commentPanel pushCheckbox state: previousState
]
