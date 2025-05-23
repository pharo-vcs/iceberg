Class {
	#name : 'IceTipSyncToDiskCommand',
	#superclass : 'IceTipRepositoryCommand',
	#category : 'Iceberg-TipUI-Commands',
	#package : 'Iceberg-TipUI',
	#tag : 'Commands'
}

{ #category : 'default' }
IceTipSyncToDiskCommand class >> defaultDescription [

	^ 'Write to disk the image changes synching the image code with the files tracked by git'
]

{ #category : 'default' }
IceTipSyncToDiskCommand class >> defaultName [

	^ 'SyncToDisk'
]

{ #category : 'testing' }
IceTipSyncToDiskCommand >> canBeExecuted [

	^ self isRepositoryOperational
]

{ #category : 'executing' }
IceTipSyncToDiskCommand >> doCommit: aCollection [

	context workingCopyModel newCommitAction
		diff: context workingCopyModel diffToReferenceCommit;
		items: aCollection;
		onSuccess: [ ];
		executeWithContext: self
]

{ #category : 'executing' }
IceTipSyncToDiskCommand >> execute [

	| changes aDiff|
	changes := Set new.
	aDiff := context workingCopyModel diffToReferenceCommit.
	aDiff treeRoots do: [ :root |
			changes add: root.
			root allChildrenDo: [ :child | changes add: child ] ].
	
	context workingCopyModel repository index
		updateDiskWorkingCopy: aDiff diff;
		updateIndex: aDiff diff.

		"| col |
col := Set new.
self treeRoots do: [ :root |
		col add: root.
		root allChildrenDo: [ :child | col add: child ] ].

self diff

self copyWithOnly: col."
]

{ #category : 'testing' }
IceTipSyncToDiskCommand >> iconName [

	^ #smallSave
]
