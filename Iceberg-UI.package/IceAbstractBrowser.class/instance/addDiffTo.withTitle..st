building
addDiffTo: browser withTitle: diffTitle
	browser transmit 
		from: #changes; 
		to: #diff; 
		andShow: [ :a | 
			a diff 
				title: diffTitle;
				display: [:change | self buildDiffInput: change ]]
