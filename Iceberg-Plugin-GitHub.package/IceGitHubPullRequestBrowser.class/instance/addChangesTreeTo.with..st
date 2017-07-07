building
addChangesTreeTo: a with: commitInfo
	(IceDiffChangeTreeBuilder new
		entity: commitInfo;
		diff: (commitInfo ifNotNil: [ 
			commitInfo diffTo: (commitInfo repository commitAt: self baseSHA)  ]);
		buildOn: a)
		title: 'Changes vs. destination' .
	super addChangesTreeTo: a with: commitInfo