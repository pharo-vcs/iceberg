querying
upstream
	^ [ (self command: {'rev-parse'. '--symbolic-full-name'. self branch name, '@{upstream}'}) trim ]
		on: Error do: [ 
			"Not nice but there is no other way, 
			if git returns an error we have to asume that 
			there is no upstream configured and return nil." ]
