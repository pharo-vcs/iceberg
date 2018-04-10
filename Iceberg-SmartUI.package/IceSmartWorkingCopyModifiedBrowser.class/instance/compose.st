building
compose

	| browser |
	browser := self tabulator.
	browser
		row: #description size: 100;
		row: [ :row | 
			row
				column: #changes; 
				column: #commit ]
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
			(IceDiffCherryPickChangeTreeBuilder new 
				diff: status workingCopyDiff;
				onSelectCherryPick: [ :aSet | self selectedElements: aSet ];
				buildOn: a) title: 'Local changes' ].

	browser transmit 
		to: #commit;
		andShow: [ :a :diff | 
			a morph
				title: 'Commit changes';
				morph: [
					IceSmartCommitModel new 
						model: diff;
						withSelectedCherryPick: [ self selectedElements ];
						browser: self;
						buildWithSpec ] ].

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
			 ]]