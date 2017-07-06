building
addChangesTreesTo: browser
	browser transmit 
		from: #commits;
		to: #changes; 
		andShow: [ :a :commitInfo |
			self addChangesTreeTo: a with: commitInfo ].