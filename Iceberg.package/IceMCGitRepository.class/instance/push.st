actions
push
	self command: {
		'push'.
		self remoteBranchName ifNil: [{
			'--set-upstream'.
			'origin'.
			self branch
		}]
	}.
