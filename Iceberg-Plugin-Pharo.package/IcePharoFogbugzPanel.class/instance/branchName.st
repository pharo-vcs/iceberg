accessing
branchName
	
	^ '{1}-{2}' format: { 
		issueNumberText text trim. 
		issueText text trim }.