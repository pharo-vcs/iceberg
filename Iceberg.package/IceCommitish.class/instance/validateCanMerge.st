validating
validateCanMerge

	| imageCommit headCommit mergeCommit |
	self repository isModified
		ifTrue: [ IceMergeAborted signal: 'Cannot merge when there is a dirty working copy. Please commit before merging.' ].
	
	imageCommit := self repository referenceCommit.
	headCommit := self repository headCommit.
	mergeCommit := self commit.
	
	{ mergeCommit . imageCommit . headCommit } asSet size > 2
		ifTrue: [ 
			IceMergeAborted signal: ('Cannot perform a tri-merge. You are trying to merge {1} into {2}, but the image is in {3}. Please, procceed to load either {1} or {2} in your image to merge.'
				format: { 
					mergeCommit description.
					self repository head description.
					imageCommit description }) ].