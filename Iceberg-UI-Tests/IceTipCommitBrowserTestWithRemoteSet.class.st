Class {
	#name : #IceTipCommitBrowserTestWithRemoteSet,
	#superclass : #IceTipCommitBrowserTest,
	#category : #'Iceberg-UI-Tests-Browsers'
}

{ #category : #running }
IceTipCommitBrowserTestWithRemoteSet >> newFixture [
	^ IceClonedFromRemoteFixture inGit
]

{ #category : #tests }
IceTipCommitBrowserTestWithRemoteSet >> testNotPushingAutomatically [
	1 halt.
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

	previousState := presenter commentPanel isPushing.
	presenter commentPanel pushCheckbox state: true.
	presenter doCommit.
	presenter commentPanel pushCheckbox state: previousState.
	1 halt
]
