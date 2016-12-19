actions
addRemote
	| remoteName remoteUrl remote |
	
	remoteName := self namePanel text trim.
	remoteName ifEmpty: [ 
		UIManager default alert: 'You need to specify a remote name.' title: 'Error'. ^ self ].
	remoteUrl := self urlPanel text trim.
	remoteUrl ifEmpty: [
		UIManager default alert: 'You need to specify a remote url.' title: 'Error'. ^ self ].
	
	remote := IceRemote name: remoteName url: remoteUrl.
	self repository addRemote: remote.
	self window delete.
	acceptBlock ifNotNil: [ acceptBlock cull: remote ].
