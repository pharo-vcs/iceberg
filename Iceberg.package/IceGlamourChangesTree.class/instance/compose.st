building
compose
	self tabulator with: [ :browser |
		browser row: #tree.
		browser transmit 
			to: #tree;
			andShow: [ :a | a fastTree 
				title: 'Local changes';
				allExpanded;
				children: #elements;
				icon: #icon;
				format: #description;
				display: #elements;
				updateOn: IceChangeSetChanged from: #announcer;
				addAction: (GLMGenericAction new
					action: [ :presentation :entity | entity refresh ];
					icon: GLMUIThemeExtraIcons glamorousRefresh;
					shortcut: $r;
					title: 'Refesh'; showTitle)
			].
		
		browser sendToOutside: #selection from: #tree.
	]
