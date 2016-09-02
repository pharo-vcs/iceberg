actions
push
	[ self command: {
		'push'.
		self upstream isNil ifTrue: [{
			'--set-upstream'.
			'origin'.
			self branch
		}]
	}] on: MCFileTreeGitError do: #processPushError
