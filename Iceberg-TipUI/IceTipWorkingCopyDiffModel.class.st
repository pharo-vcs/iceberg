"
I'm a diff model that represents a diff between the HEAD commit and the image working copy.
"
Class {
	#name : 'IceTipWorkingCopyDiffModel',
	#superclass : 'IceTipDiffModel',
	#instVars : [
		'diff'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'accessing' }
IceTipWorkingCopyDiffModel >> diff [
	^ diff ifNil: [ diff := self newDiff ]
]

{ #category : 'testing' }
IceTipWorkingCopyDiffModel >> isEmpty [
	^ self diff isEmpty
]

{ #category : 'private - factory' }
IceTipWorkingCopyDiffModel >> newDiff [
	^ self entity diffToReferenceCommit
]

{ #category : 'private' }
IceTipWorkingCopyDiffModel >> resetDiff [
	diff := nil
]
