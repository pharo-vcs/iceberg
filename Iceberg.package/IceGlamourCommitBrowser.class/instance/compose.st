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
			andShow: [ :a |
				a fastTree title: 'Local changes';
					children: #elements;
					icon: #icon;
					format: #description 
			].
		
		browser transmit to: #commit; andShow: [ :a | a tabulator with: [ :commiter |
			commiter title: 'Commit'.
			commiter row: #message.
			commiter row: #actions size: 30.
			
			commiter transmit to: #message; andShow: [ :b | b text 
				display: '';
				act: [ :presentation :entity | entity commitWithMessage: presentation text asString ] icon: GLMUIThemeExtraIcons glamorousSave on: $s entitled: 'Commit' ].
						
			commiter transmit to: #actions; andShow: [ :b | b actionList
				act: [ :presentation :entity | entity commitWithMessage: (presentation pane port: #commitText) value asString ] entitled: 'Commit';
				act: [ :entity | entity inspect ] entitled: 'Refesh changes' ].
			
			commiter transmit 
				from: #message port: #text; 
				to: #actions port: #commitText.
		]].
				
		
		browser transmit from: #changes; to: #diff; andShow: [ :a | 
			a diff 
				title: 'Left: working copy / Right: local repository';
				display: [:change | { 
					change myVersion ifNil: ''. 
					change theirVersion ifNil: '' } ]]
	]
		
 