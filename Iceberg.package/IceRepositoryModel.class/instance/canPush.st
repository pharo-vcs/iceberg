accessing
canPush
	[ 
		^ self isOperative and: [
			self outgoingCommits notEmpty and: [ 
			self incommingCommits isEmpty ]]
	]
	on: Error do: [ ^ false ]