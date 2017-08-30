actions
merge: aCommitish into: aBranch
	"Currently a commitish can only be an IceCommitInfo, but we should be prepared for other 
	 types of commitish."
	self backend 
		merge: aCommitish id 
		into: aBranch basename