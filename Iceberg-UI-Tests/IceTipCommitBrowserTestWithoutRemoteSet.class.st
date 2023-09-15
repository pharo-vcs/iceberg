Class {
	#name : 'IceTipCommitBrowserTestWithoutRemoteSet',
	#superclass : 'IceTipCommitBrowserTest',
	#category : 'Iceberg-UI-Tests-Browsers',
	#package : 'Iceberg-UI-Tests',
	#tag : 'Browsers'
}

{ #category : 'running' }
IceTipCommitBrowserTestWithoutRemoteSet >> newFixture [
	^ IceCleanWorkingCopyFixture inGit
]

{ #category : 'tests' }
IceTipCommitBrowserTestWithoutRemoteSet >> testPushSettingCheckbox [
	self assert: presenter commentPanel isPushing equals: false
]
