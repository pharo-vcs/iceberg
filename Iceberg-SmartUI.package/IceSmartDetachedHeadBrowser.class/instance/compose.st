building
compose

	| browser |
	browser := self tabulator.
	browser
		row: #actions size: 40;
		row: #description size: 150;
		row: [ :row | 
			row
				column: #changes; 
				column: #branchStatus ]
		size: 150;
		row: #diff.

	browser transmit 
		to: #description;
		andShow: [ :a :status |
			a text
				title: 'Explanation';
				display: status longDescription ].

	browser transmit 
		to: #changes; 
 		andShow: [ :a :status |
			(IceDiffChangeTreeBuilder new 
				diff: status workingCopyDiff;
				buildOn: a) title: 'Local changes' ].

	browser transmit 
		to: #branchStatus;
		andShow: [ :a :diff | 
			a text
				title: 'Branch Status';
				display: 'This pane should be replaced by a branch graph showing why we are in detached mode. Follow how Epicea and Hiedra do it. Look at classes HiLink and HiRendered'. ].

	browser transmit 
		from: #changes; 
		to: #diff; 
		andShow: [ :a | 
			a swappedColorDiff
				title: 'Left: working copy / Right: local repository';
				display: [:change | { 
					change myVersion ifNil: ''. 
					change theirVersion ifNil: ''
				}
			 ]].
	
	browser transmit 
		to: #actions;
		andShow: [ :a :model | | actionList |
			"a title: ''."
			actionList := a actionList.
			model actions do: [ :each |
				actionList act: [:entity | each executeOn: model ] entitled: each name ] ]