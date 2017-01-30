building
addChangesTreesTo: browser
	browser transmit 
		from: #commits;
		to: #changes; 
		andShow: [ :a :commitInfo |
			(IceDiffChangeTreeBuilder diff: commitInfo diffFromHead buildOn: a)
				title: 'Changes since selection'.
			(IceDiffChangeTreeBuilder diff: commitInfo diffToParent buildOn: a)
				title: 'Changes vs. parent' ].