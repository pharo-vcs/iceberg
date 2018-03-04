actions
doPull
	self model pullThen: [ 
		self model reset.
		self refresh ]