building
addChangesTreesTo: browser
	browser transmit 
		from: #commits;
		to: #changes; 
		andShow: [ :a | (a custom: GLMStacker new) with: [ :stacker |
			self addChangesTree: #diffFromHead to: stacker title: 'Changes since selection'.
			self addChangesTree: #diffToParent to: stacker title: 'Changes vs. parent' ]]