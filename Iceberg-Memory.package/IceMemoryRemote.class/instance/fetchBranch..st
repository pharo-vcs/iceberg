fetching
fetchBranch: anIceMemoryRemoteBranch 
	
	self fetchCommitsThat: [ :each | each name = anIceMemoryRemoteBranch name ]