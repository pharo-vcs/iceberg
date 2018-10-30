building
addCommitInfoTo: browser
	browser transmit 
		from: #commits; 
		to: #diff; 
		andShow: [ :a |
			a morph
				title: 'Commit info';
				display: [ :commitInfo | self createCommitInfoFrom: commitInfo ] ].
