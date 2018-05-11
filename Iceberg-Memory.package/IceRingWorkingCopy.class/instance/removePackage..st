private-impacting changes
removePackage: anIcePackageDefinition 
	
	"A previous adopt commit removed maybe the package from teh packages dictionary.
	It is still however in the working copy."
	| package |
	package := IcePackage named: anIcePackageDefinition name repository: self repository.
	self unloadPackage: package.
	self basicRemovePackage: package.