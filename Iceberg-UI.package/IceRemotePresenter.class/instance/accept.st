actions
accept
	| remoteName remoteUrl |
	
	remoteName := self namePanel text trim.
	remoteName ifEmpty: [ 
		UIManager default alert: 'You need to specify a remote name.' title: 'Error'. ^ self ].
	remoteUrl := self urlPanel text trim.
	remoteUrl ifEmpty: [
		UIManager default alert: 'You need to specify a remote url.' title: 'Error'. ^ self ].
	
	self window delete.
	acceptBlock ifNotNil: [ 
		acceptBlock cull: (IceGitRemote name: remoteName url: remoteUrl) ]