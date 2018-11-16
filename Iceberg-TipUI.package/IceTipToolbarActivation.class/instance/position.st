accessing
position
	^ position ifNil: [ IceTipItemPosition perform: self commandClass defaultPosition ]