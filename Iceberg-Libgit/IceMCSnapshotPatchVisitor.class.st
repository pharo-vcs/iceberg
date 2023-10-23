Class {
	#name : 'IceMCSnapshotPatchVisitor',
	#superclass : 'IceTreeVisitor',
	#instVars : [
		'patcher'
	],
	#category : 'Iceberg-Libgit-Commit',
	#package : 'Iceberg-Libgit',
	#tag : 'Commit'
}

{ #category : 'accessing' }
IceMCSnapshotPatchVisitor >> patcher: aMCPatcher [
	patcher := aMCPatcher
]

{ #category : 'visiting' }
IceMCSnapshotPatchVisitor >> visitAddition: anIceAddition [ 
	anIceAddition definition addToPatcher: patcher.
	self visitChildrenOf: currentNode
]

{ #category : 'visiting' }
IceMCSnapshotPatchVisitor >> visitModification: anIceModification [

	anIceModification leftDefinition addModification: anIceModification toPatcher: patcher.
	self visitChildrenOf: currentNode
]

{ #category : 'visiting' }
IceMCSnapshotPatchVisitor >> visitNoModification: anIceNoModification [
	
	anIceNoModification definition addToPatcher: patcher.
	self visitChildrenOf: currentNode
]

{ #category : 'visiting' }
IceMCSnapshotPatchVisitor >> visitNonConflictingOperation: anIceNonConflictingOperation [

	^ anIceNonConflictingOperation chosenOperation accept: self
]

{ #category : 'visiting' }
IceMCSnapshotPatchVisitor >> visitRemoval: anIceRemoval [ 
	anIceRemoval definition removeFromPatcher: patcher.
	self visitChildrenOf: currentNode
]
