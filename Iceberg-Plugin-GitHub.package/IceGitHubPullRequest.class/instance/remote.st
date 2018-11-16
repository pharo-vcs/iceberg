accessing
remote
	| remote |
	remote := IceGitRemote 
		name: self author
		url: (((self jsonAt: #head) at: #repo) at: #ssh_url).
	^ self repository remotes 
		detect: [ :each | each = remote ]
		ifFound: [ :each | each ]
		ifNone: [ 
			self repository addRemote: remote.
			remote ].
	
	