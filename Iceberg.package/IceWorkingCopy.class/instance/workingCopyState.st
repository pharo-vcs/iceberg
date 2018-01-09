accessing
workingCopyState
	
	^ (self packages select: #isLoaded thenCollect: #packageState)
			inject: (IceEmptyWorkingCopyState repository: repository)
			into: [ :a :b | a mergeStateWith: b ]