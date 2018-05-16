building
buildOn: browser
	browser 
		row: #versions;
		row: #diff.
		
	browser transmit 
		to: #versions;
		andShow: [ :a |
			a fastTable
				display: [ self history ];
				title: 'Versions';
				column: 'Author' evaluated: [ :each | each author];
				column: 'Timestamp' evaluated: [ :each | each datetime asLocalStringYMDHM ];
				column: 'Version' evaluated: [ :each | each commit shortId ] ;
				column: 'Commit message' evaluated: [ :each | each commit comment ifNotEmpty: [ :comment | comment lines first ] ] ]. 
			
	browser transmit 
		from: #versions;
		to: #diff;
		andShow: [ :a |
			a diff 
				title: [ :log | (self nextDescriptionOf: log), ' / ', log description ];
				display: [ :log | { self nextSourceOf: log. log source  } ].
			a text 
				title: [ :log | 'Full commit message' ];
				display: [ :log | log commit comment ] ]