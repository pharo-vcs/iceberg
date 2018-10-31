initialization
initialize
	super initialize.
	location := FileLocator imageDirectory / 'test' / UUID new asString.
	super initialize.
	packageName1 := 'IceMockPackage1'.
	packageName2 := 'IceMockPackage2'.