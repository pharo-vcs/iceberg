executing
calculateChanges

	| commonAncestor sourceDiff targetDiff |

	mergeTree ifNotNil: [ ^ self ].

	commonAncestor := (self leftCommit commonAncestorWith: mergeCommit) ifNil: [ IceNoCommit new ].
	sourceDiff := self sourceVersion diffTo: commonAncestor.
	targetDiff := self targetVersion diffTo: commonAncestor.

	mergeTree := self merge: sourceDiff tree
		into: targetDiff tree.
	
	changesToWorkingCopyTree := self isInverseMerge 
		ifTrue: [  self merge: targetDiff tree into: sourceDiff tree ] 
		ifFalse: [ mergeTree  ]
	 