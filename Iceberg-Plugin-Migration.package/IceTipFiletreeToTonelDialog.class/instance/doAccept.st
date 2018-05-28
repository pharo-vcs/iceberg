actions
doAccept
	
	IceConvertFormatAction new 
		repository: self repository;
		branchName: self branchName;
		format: #tonel;
		mergeWithCurrentBranch: self mergeWithMasterCheckbox state;
		execute