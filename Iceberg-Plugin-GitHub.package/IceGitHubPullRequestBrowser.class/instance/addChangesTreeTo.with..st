building
addChangesTreeTo: a with: commitInfo
	(IceDiffChangeTreeBuilder new
		entity: commitInfo;
		diff: (commitInfo ifNotNil: [ 
			commitInfo diffTo: (self mergeBaseCommitFor: commitInfo) ]);
		buildOn: a)
		title: 'Changes vs. destination' .
	super addChangesTreeTo: a with: commitInfo