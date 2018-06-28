testing
canBeExecutedInContext: aToolContext

	| repository |
	repository := aToolContext repositoryModel entity.
	^ repository isMissing not 
		and: [ repository workingCopy isDetached not
			and: [ repository workingCopy writerClass id = #filetree
				and: [ repository head isUnbornBranch not ] ] ]