actions
basicCommitWithMessage: text ifCancel: cancelBlock
	[
		self basicCommitWithMessage: text asString.
		self resetText ]
	on: IceNothingToCommit, IceWorkingCopyDesyncronized  
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor repository: self repository) ]