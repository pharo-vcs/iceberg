building
compose
	self tabulator with: [ :browser |
		browser row: #tree.
		browser transmit 
			to: #tree;
			transformed: #elements;
			andShow: [ :a :anIceChangeSet | 
				a updateOn: IceChangeSetChanged from: [ anIceChangeSet announcer. ].
				a fastTree title: 'Local changes';
					allExpanded;
					children: #elements;
					icon: #icon;
					format: #description.
			].
		
		browser sendToOutside: #selection from: #tree.
	]
