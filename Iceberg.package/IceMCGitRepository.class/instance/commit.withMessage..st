actions
commit: versions withMessage: message
	self 
		gitCommand: 
			{ 'commit'. '-m'. self escapeForShell: message convertToSystemString. '--' }, 
			(versions collect: [ :version | version directoryName ])
		in: directory 
