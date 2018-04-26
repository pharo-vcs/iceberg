executing
calculateChanges

	| commonAncestor sourceDiff targetDiff |

	mergeTree ifNotNil: [ ^ self ].

	commonAncestor := (self leftCommit commonAncestorWith: mergeCommit) ifNil: [ IceNoCommit new ].
	sourceDiff := IceDiff from: self sourceVersion to: commonAncestor.
	targetDiff := IceDiff from: self targetVersion to: commonAncestor.

	mergeTree := self merge: sourceDiff tree
		into: targetDiff tree.
	
	changesToWorkingCopyTree := self isInverseMerge 
		ifTrue: [  self merge: targetDiff tree into: sourceDiff tree ] 
		ifFalse: [ mergeTree  ]
	 