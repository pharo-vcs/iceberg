private
basicCommitWithMessage: text ifCancel: cancelBlock
	[
		[ self basicCommitWithMessage: text asString ]
		on: IceGitUsernameOrEmailNotFound 
		do: [ :e |
			self configGitUsernameAndEmailOnCancel: cancelBlock.
			e retry ].
		self resetText ]
	on: NothingToCommitException 
	do: [ :e | UIManager default inform: 'There is nothing to commit.' ]