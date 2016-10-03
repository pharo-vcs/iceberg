accessing
canPush
	^ self outgoingCommits notEmpty 
		and: [ self incommingCommits isEmpty ]