actions
push
	self command: {
		'push'.
		self remoteBranchName isNil ifTrue: [{
			'--set-upstream'.
			'origin'.
			self branch
		}]
	}.
