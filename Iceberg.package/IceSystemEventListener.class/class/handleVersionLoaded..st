event handling
handleVersionLoaded: ann
	"When monticello finishes to load a package, we need to verify its status to mark them as dirty or 
	 not dirty as they apply."

	| package |
	"this is ugly, but since I do not have a package I need to look for it"
	package := RPackageOrganizer default packageMatchingExtensionName: ann label.
	
	"The package can be nil".
	package ifNil: [ ^self ].

	"now we can verify its status"
	RPackageSet withoutCacheDo: [
		IceRepository registry
			do: [ :each | 
				(each includesPackageNamed: package name)
					ifTrue: [ | icePackage isDirty |
						icePackage := each packageNamed: package name.
						"Ugly hack. Should enhance for next version"
						self flag: #enhance.
						isDirty := each workingCopy referenceCommit isUnknownCommit
							ifTrue: [ true ]
							ifFalse: [ | diff |
								diff := each workingCopy referenceCommit diffToWorkingCopyForPackage: icePackage.
								diff includesPackageNamed: package name ].
						icePackage beDirty: isDirty.
						Iceberg announcer announce: (IceRepositoryModified for: each) ] ]]