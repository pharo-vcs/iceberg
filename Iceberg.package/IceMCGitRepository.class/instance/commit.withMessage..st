actions
commit: versions withMessage: message
	self halt.
	self command: { 
		'commit'.
		'-m'. self escapeForShell: message convertToSystemString.
		'--'. versions collect: [ :version | version directoryName ] "(self class parseName: each info name) first , self packageExtension ] ]."
	}
