private
sendPullRequest: pullRequest
	
	[ self basicSendPullRequest: pullRequest ]
	on: IceGitHubError
	do: [ :e | self reportError: e ]	