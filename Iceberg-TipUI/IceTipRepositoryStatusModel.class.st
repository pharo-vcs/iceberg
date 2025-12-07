"
I represent the status of a repository at a given time to be shown. I cache all results to avoid multiple lookups.
"
Class {
	#name : 'IceTipRepositoryStatusModel',
	#superclass : 'IceTipModel',
	#instVars : [
		'repositoryModel',
		'head',
		'isMissing',
		'workingCopy',
		'isDetached',
		'isModified',
		'project',
		'workingCopyState'
	],
	#category : 'Iceberg-TipUI-Model',
	#package : 'Iceberg-TipUI',
	#tag : 'Model'
}

{ #category : 'instance creation' }
IceTipRepositoryStatusModel class >> on: aRepositoryModel [

	^ self new
		  repositoryModel: aRepositoryModel;
		  yourself
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> branchName [

	(repositoryModel isLibGitAvailable not or: [ self isMissing ]) 
		ifTrue: [ ^ repositoryModel class unknownBranchLabel ].
	
	^ self head description
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> descriptionDecorator [

	(repositoryModel isLibGitAvailable and: [ self isRepositoryModified ]) 
		ifTrue: [ ^ IceTipDescriptionDecorator modified ].
	^ IceTipTextDecorator none
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> descriptionString [
	| text |
	
	text := repositoryModel displayString.
	(repositoryModel isLibGitAvailable and: [ self isRepositoryModified ]) 
		ifTrue: [ text := '*', text ].
	^ text
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> entity [

	^ repositoryModel entity
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> head [

	^ head ifNil: [ head := self entity head ]
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> isDetached [
	
	^ isDetached ifNil: [ isDetached := self workingCopy isDetached ]
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> isMissing [

	^ isMissing ifNil: [ isMissing := self entity isMissing ]
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> isModified [

	^ isModified ifNil: [ isModified := self workingCopy isModified ]
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> isRepositoryModified [

	^ isModified ifNil: [ isModified := self entity isModified ]
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> project [

	^ project ifNil: [ project := self workingCopy project ]
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> repositoryModel: anIceTipRepositoryModel [ 
	repositoryModel := anIceTipRepositoryModel
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> statusDecorator [

	[
	self isMissing ifTrue: [ ^ IceTipStatusDecorator error ].
	self workingCopyState isUnknownCommitState ifTrue: [
		^ IceTipStatusDecorator error ].
	self isDetached ifTrue: [
		^ IceTipStatusDecorator error ].
	self head isDetached ifTrue: [ ^ IceTipStatusDecorator warning ].
	self project isUnborn ifTrue: [
		^ IceTipStatusDecorator error ] ]
		on: Error
		do: [ :e | ^ IceTipStatusDecorator error ].

	^ IceTipStatusDecorator none
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> statusString [

	| state |
	[
	| status incoming outgoing |
	repositoryModel verifyDirectoryStructureIfMissing: [ :message |
		^ message asString ].
	repositoryModel isLibGitAvailable ifFalse: [ ^ 'Unknown (No libgit2)' ].

	state := self workingCopy workingCopyState.
	state isUnknownCommitState ifTrue: [
		^ state description ].
	self isDetached ifTrue: [ ^ 'Detached Working Copy' ].

	self head isDetached ifTrue: [ ^ 'Detached HEAD' ].

	self project isUnborn ifTrue: [ ^ 'No Project Found' ].

	repositoryModel isLoaded ifFalse: [ ^ 'Not loaded' ].

	status := OrderedCollection new.
	self entity isModified ifTrue: [ status add: 'Uncommitted changes' ].

	incoming := repositoryModel incomingCommits size.
	incoming > 0 ifTrue: [
		status add: ('{1} incoming' format: { incoming }) ].

	outgoing := repositoryModel outgoingCommits size.
	outgoing > 0 ifTrue: [
		status add: ('{1} not published' format: { outgoing }) ].

	status ifEmpty: [ status add: 'Up to date' ].

	^ ', ' join: status ]
		on: Error
		do: [ :e | ^ e description ]
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> workingCopy [
	
	^ workingCopy ifNil: [ workingCopy := self entity workingCopy ]
]

{ #category : 'accessing' }
IceTipRepositoryStatusModel >> workingCopyState [
	
	^ workingCopyState ifNil: [ workingCopyState := self workingCopy workingCopyState ]
]
