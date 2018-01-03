building
compose

	| browser |
	browser := self tabulator.
	browser row: [ :mainPane |
							mainPane
								column: [ :restAtLeft |
									restAtLeft
										row: #description;
										row: #changes;
										row: #diff.
								] span: 80;
								column: #branchStatus span: 20 ]
			span: 800.
	(browser row: [ :footer |
		footer
			column: #status span: 800;
			column: #actions size: 500
		 ])
		size: 30;
		span: 1.

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