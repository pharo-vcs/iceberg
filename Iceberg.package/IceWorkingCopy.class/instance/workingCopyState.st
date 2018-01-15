accessing
workingCopyState
	
	"This method obtains the head commit once and sends it as argument as an optimization.
	This is because asking for the head commit is expensive.
	
	Check the commits of #packageState and #packageStateWithHeadCommit:"
	
	| headCommit |
	headCommit := repository head commit.
	^ (self packages select: #isLoaded thenCollect: [ :package | 
		package packageStateWithHeadCommit: headCommit ])
			inject: (IceEmptyWorkingCopyState repository: repository)
			into: [ :a :b | a mergeStateWith: b ]