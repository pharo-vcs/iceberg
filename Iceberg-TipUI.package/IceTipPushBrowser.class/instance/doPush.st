actions
doPush
	self model pushThen: [ 
		self model reset.
		self refresh ]