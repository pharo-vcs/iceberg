private factory
newContext
	^ (self contextClass for: self)
		readContextParametersFromModel: self model;
		yourself