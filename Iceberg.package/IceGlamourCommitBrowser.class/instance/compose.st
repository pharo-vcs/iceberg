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
			transformed: #elements;
			andShow: [ :a :anIceChangeSet | 
				a updateOn: IceChangeSetChanged from: [ anIceChangeSet announcer. ].
				a fastTree title: 'Local changes';
					allExpanded;
					children: #elements;
					icon: #icon;
					format: #description ].
	
		browser transmit to: #commit; andShow: [ :a | a text
			display: '';
			title: 'Commit message';
			act: [ :presentation :entity | entity commitWithMessage: presentation text asString ] 
				icon: GLMUIThemeExtraIcons glamorousSave 
				on: $s 
				entitled: 'Commit';
			act: [ :presentation :entity | entity refresh ] 
				icon: GLMUIThemeExtraIcons glamorousRefresh 
				on: $r
				entitled: 'Refesh changes'
		].
								
		browser transmit from: #changes; to: #diff; andShow: [ :a | 
			a diff 
				title: 'Left: working copy / Right: local repository';
				display: [:change | { 
					change myVersion ifNil: ''. 
					change theirVersion ifNil: '' } ]]
	]
