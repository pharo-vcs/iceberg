initialization
initialize
	super initialize.
	announcer := Announcer new.
	announcer when: IcePackageLoaded do: [ self clearCaches ]
