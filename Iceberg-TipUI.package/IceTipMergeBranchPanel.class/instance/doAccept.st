actions
doAccept

	IceTipStandardAction new 
		repository: self model entity; 
		message: ('Verifying merge from {1}' format: { self selectedBranch name });
		onSuccess: [ self selectedBranch previewMerge: self mergeType ];
		execute: [ self validate ]