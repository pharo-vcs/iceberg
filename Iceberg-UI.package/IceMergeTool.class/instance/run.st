merging
run
	"Merge selected commit into another branch"
	self repository isModified ifTrue: [ 
		self confirmContinueWithDirtyRepository ifFalse: [ ^ self ]].

	self chooseTargetBranch ifNil: [ ^ self ].
	
	self assert: (self targetBranch = repository head).

	[ repository workingCopy mergeCommit: source iceCommit.
		self onMerge value ]
	on: IceMergeAborted do: [ :e | "ignored" ]