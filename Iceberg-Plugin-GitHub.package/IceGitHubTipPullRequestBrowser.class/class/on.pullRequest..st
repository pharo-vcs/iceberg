instance creation
on: aModel pullRequest: aPullRequest
	^ self basicNew
		pullRequest: aPullRequest;
		setModelBeforeInitialization: aModel;
		initialize;
		yourself