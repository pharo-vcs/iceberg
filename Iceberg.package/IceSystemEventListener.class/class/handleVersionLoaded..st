event handling
handleVersionLoaded: ann
	"When monticello finishes to load a package, we need to verify its status to mark them as dirty or 
	 not dirty as they apply."
	| package |
	
	"this is ugly, but since I do not have a package I need to look for it"
	package := RPackageOrganizer default packageMatchingExtensionName: ann label.
	"now we can verify its status"
	IceRepository registry do: [ :each |
		(each includesPackageNamed: package name) 
			ifTrue: [ | icePackage diff |
				icePackage := each packageNamed: package name.
				diff := each workingCopy referenceCommit diffToWorkingCopyForPackage: icePackage.
				icePackage beDirty: (diff includesPackageNamed: each name).
				Iceberg announcer announce: (IceRepositoryModified for: each) ] ]