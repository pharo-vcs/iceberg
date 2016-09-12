initialization
initialize
	super initialize.
	commitDictionary := Dictionary new.
	loadedCode := IceLoadedCode repository: self.
	
	announcer := Announcer new.
	announcer when: IcePackageLoaded do: [ self refresh ].
	announcer when: IceCommited do: [ self refresh ].
