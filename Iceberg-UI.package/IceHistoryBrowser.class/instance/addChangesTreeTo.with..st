building
addChangesTreeTo: a with: commitInfo
	(IceDiffChangeTreeBuilder new 
		entity: commitInfo;
		diff: (commitInfo ifNotNil: [ commitInfo diffFromHead ]); 
		buildOn: a)
		title: 'Changes since selection'.
	(IceDiffChangeTreeBuilder new
		entity: commitInfo;
		diff: (commitInfo ifNotNil: [ commitInfo diffToParent ]);
		buildOn: a)
		title: 'Changes vs. parent' 