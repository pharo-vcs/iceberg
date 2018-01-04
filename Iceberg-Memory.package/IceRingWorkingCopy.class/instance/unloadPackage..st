private-monticello
unloadPackage: aPackage

	ringEnvironment removePackage: (ringEnvironment ask packageNamed: aPackage name)