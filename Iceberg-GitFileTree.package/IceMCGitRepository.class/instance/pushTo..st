actions
pushTo: aRemote
	[ self command: {
		'push'.
		self upstream ifNil: [{
			'--set-upstream'.
			aRemote remoteName.
			self branch
		}]
	}] on: MCFileTreeGitError do: [ YouShouldPullBeforePush signal ]
