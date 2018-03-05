private
mcPackageModified: ann
	"This is a 'translation' service: I receive the information of a package has been modified 
	 and I redispatch it as 'repository' modified. Is useful for tools to know when a repository 
	 changed (since repository and not package is the unit of work of iceberg)"
	| packageName |
	
	packageName := ann package name.
	IceRepository registry 
		select: [ :each | each includesPackageNamed: packageName ]
		thenDo: [ :each | self announcer announce: (IceRepositoryModified for: each) ]