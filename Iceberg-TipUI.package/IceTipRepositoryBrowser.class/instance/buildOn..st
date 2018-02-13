building
buildOn: browser
	browser 
		column: #tree;
		column: [ :col | 
			col 
				row: #history;
				row: [ :commitRow | 
					commitRow 
						column: #commitFiles;
						column: #diff span: 2 ]
					span: 2 ]
			span: 3.
		
	browser transmit to: #tree; andShow: [ :a |
 		a fastList 
			display: [ self model branches ];
			format: #descriptionText	].
	
	browser transmit 
		from: #tree;
		to: #history; 
		andShow: [ :a | 
			a fastTable 
				display: [ :branchModel | branchModel commits ];
				column: 'Commit' evaluated: #shortId width: 60;
				column: 'Author' evaluated: #author width: 120;
				column: 'Description' evaluated: #descriptionText ].
		
	browser transmit
		from: #history;
		to: #commitFiles;
		andShow: [ :a |
			a spec 
				title: 'Info';
				display: [ self buildInfoPanel ] ].
		
	browser transmit 
		from: #commitFiles;
		to: #diff;
		andShow: [ :a |
			 ]