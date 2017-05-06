building
composeBrowserOn: browser
	browser
		row: [ :row | 
			row
				column: #changes; 
				column: #commit ];
		row: #diff.

	browser transmit 
		to: #changes; 
 		andShow: [ :a :diff |
			(IceDiffCherryPickChangeTreeBuilder new 
				diff: diff;
				onSelectCherryPick: [ :aSet | self selectedElements: aSet ];
				buildOn: a)
				title: 'Local changes' ].

	browser transmit 
		to: #commit;
		andShow: [ :a :diff | 
			a morph
				title: 'Commit changes';
				morph: [
					IceCherryPickCommitModel new 
						model: diff;
						withSelectedCherryPick: [ self selectedElements ];
						buildWithSpec ] ].

	self addDiffTo: browser withTitle: 'Left: working copy / Right: local repository'