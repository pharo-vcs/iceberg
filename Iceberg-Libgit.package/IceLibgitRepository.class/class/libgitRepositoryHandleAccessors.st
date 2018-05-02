rules
libgitRepositoryHandleAccessors
	
	^ self allMethods select: [ :m | m pragmas anySatisfy: [ :p | p keyword = self libgitRepositoryHandleAccessorPragmaSelector ] ]