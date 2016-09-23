initialization
initialize
	super initialize.
	commitDictionary := Dictionary new.
	
	announcer := Announcer new.
	announcer when: IcePackageLoaded do: [ self refresh ].
	announcer when: IceCommited do: [ self refresh ].

	loadedCode := IceLoadedCode repository: self.
