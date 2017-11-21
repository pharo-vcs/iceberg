private
basicCommitWithMessage: text ifCancel: cancelBlock
	[
		[ self basicCommitWithMessage: text asString ]
		on: IceGitUsernameOrEmailNotFound 
		do: [ :e |
			self configGitUsernameAndEmailOnCancel: cancelBlock.
			e retry ].
		self resetText ]
	on: IceNothingToCommit, IceWorkingCopyDesyncronized  
	do: [ :e | e acceptError: (IceInteractiveErrorVisitor repository: self repository) ]