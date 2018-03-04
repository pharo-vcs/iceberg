execution
execute
	self withErrorHandlingDo: [ 
		self validateRemotesPresent.
	 	(IceTipPullBrowser onRepository: self repositoryModel entity) openWithSpec ]
