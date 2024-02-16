Class {
	#name : 'IceTipCommitBrowserTestWithoutRemoteSetTest',
	#superclass : 'IceTipCommitBrowserTest',
	#category : 'Iceberg-UI-Tests-Browsers',
	#package : 'Iceberg-UI-Tests',
	#tag : 'Browsers'
}

{ #category : 'running' }
IceTipCommitBrowserTestWithoutRemoteSetTest >> newFixture [
	^ IceCleanWorkingCopyFixture inGit
]

{ #category : 'tests' }
IceTipCommitBrowserTestWithoutRemoteSetTest >> testPushSettingCheckbox [
	self assert: presenter commentPanel isPushing equals: false
]
