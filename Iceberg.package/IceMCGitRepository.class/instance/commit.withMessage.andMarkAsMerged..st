actions
commit: versions withMessage: message andMarkAsMerged: aCommitish
	self command: 'git merge'. aCommitish id. '--strategy=ours --no-commit'.
	self commit: versions withMessage: message.
