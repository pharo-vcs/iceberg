initialization
pullRequest: aPullRequest
	pullRequest := aPullRequest.
	urlText text: self pullRequest url.
	authorText text: self pullRequest author.
	fromText text: self pullRequest headLabel.
	toText text: self pullRequest baseLabel.
	bodyText text: self pullRequest body.
	self retrieveStatuses.
	self retrieveDetail