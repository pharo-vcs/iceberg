private
ensureMCVersionWithClassOrganisation: mcVersion
	"if a package does not has class organisation (happens when package is composed 
	 only for extensions, we need to ensure it has one, otherwise package creation will 
	 fail"

	^ mcVersion snapshot definitions 
		detect: [ :each | each isClassDefinition ]
		ifFound: [ :each | mcVersion ]
		ifNone: [ 
			MCVersion 
				package: mcVersion package
				info: mcVersion info
				snapshot: (MCSnapshot fromDefinitions: (
					{ MCOrganizationDefinition categories: { mcVersion package name }}, 
					mcVersion snapshot definitions)) ]