accessing
repositoryActions
	^ { 
	self newIssueFixAction.
	self synchronizeRepositoriesAction.
	}