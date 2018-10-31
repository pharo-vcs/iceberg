initialization
initialize
	super initialize.
	location := FileLocator imageDirectory / 'test' / UUID new asString.