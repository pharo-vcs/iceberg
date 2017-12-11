accessing
repositoryActions
	^ { 
	self synchronizeRepositoriesAction.
	self newIssueFixAction.
	}