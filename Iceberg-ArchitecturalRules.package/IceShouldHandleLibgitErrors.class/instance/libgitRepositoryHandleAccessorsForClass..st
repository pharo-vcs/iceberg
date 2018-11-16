accessing
libgitRepositoryHandleAccessorsForClass: aClass

	^ aClass allMethods
		select:
			[ :m | m pragmas anySatisfy: [ :p | p keyword = IceLibgitRepository libgitRepositoryHandleAccessorPragmaSelector ] ]