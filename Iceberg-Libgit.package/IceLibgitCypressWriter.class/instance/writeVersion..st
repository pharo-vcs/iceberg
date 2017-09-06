visiting
writeVersion: aVersion
	directory := aVersion package name, '.package'.
	packageFileDirectory := stream / directory.

	self packageFileDirectory ensureDeleteAll.
	self writeFormat.
	self writePackage: aVersion package.
	self writeDefinitions: aVersion.
	aVersion dependencies do: [ :ea | self writeVersionDependency: ea ]