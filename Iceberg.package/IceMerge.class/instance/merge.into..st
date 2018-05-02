building
merge: changeTree into: currentTree

	^ changeTree collectWithPath: [ :operation :path | 
			currentTree 
				resolve: path 
				ifPresent: [ :currentOperation | operation mergeWithOperation: currentOperation ] 
				ifAbsent: [ IceNonConflictingOperation operation: operation] ]