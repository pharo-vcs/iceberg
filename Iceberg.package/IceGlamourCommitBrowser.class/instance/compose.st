building
compose
	self tabulator with: [ :browser | 
		browser
			row: [ :top | top
				column: #changes; 
				column: #commit ];
			row: #diff.

		browser transmit 
			to: #changes; 
			andShow: [ :a | a custom: IceGlamourChangesTree new ].
	
		browser transmit to: #commit; andShow: [ :a | a text
			display: '';
			title: 'Commit message';
			addAction: (GLMGenericAction new
				action: [ :presentation :entity | entity commitWithMessage: presentation text asString ];
				icon: GLMUIThemeExtraIcons glamorousSave;
				shortcut: $s;
				title: 'Commit'; showTitle);
			addAction: (GLMGenericAction new
				action: [ :presentation :entity | entity refresh ];
				icon: GLMUIThemeExtraIcons glamorousRefresh;
				shortcut: $r;
				title: 'Refesh changes'; showTitle)
		].
								
		browser transmit from: #changes; to: #diff; andShow: [ :a | 
			a diff 
				title: 'Left: working copy / Right: local repository';
				display: [:change | { 
					change myVersion ifNil: ''. 
					change theirVersion ifNil: '' } ]]
	]
