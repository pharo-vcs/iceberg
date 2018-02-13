accessing
model
	^ super model ifNil: [ 
		self model: self createModel.
		super model ]