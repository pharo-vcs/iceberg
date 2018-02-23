accessing
position
	^ position ifNil: [ IceTipToolbarItemPosition perform: self commandClass defaultPosition ]