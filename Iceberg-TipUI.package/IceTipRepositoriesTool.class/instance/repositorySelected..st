initialization
repositorySelected: ann
	| repositoryModel |
	
	repositoryModel := repositoryList widget dataSource elementAt: ann selectedRowIndex.
	(IceTipPackagesTool for: repositoryModel) openWithSpec