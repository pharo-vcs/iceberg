building
compose
	self tabulator with: [ :browser | 
		browser
			row: [ :r | r column: #changes; column: #commit ];
			row: #diff;
			yourself.

		browser transmit 
			to: #changes; 
			transformed: #elements;
			andShow: [ :a |
				a fastTree title: 'Local changes';
					children: #elements;
					icon: #icon;
					format: #description 
			].
	
		browser transmit from: #changes; to: #diff; andShow: [ :a | 
			a diff 
				title: 'Left: working copy / Right: local repository';
				display: [:change | { 
					change myVersion ifNil: ''. 
					change theirVersion ifNil: '' } ]]
	]
		
