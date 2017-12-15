private
basicOrigin
	self isValid ifFalse: [ ^ nil ].
	[ | remotes |
		remotes := self remotes.
		remotes ifEmpty: [ ^ nil  ].
		^ remotes
			detect: [ :each | each isOrigin ]
			ifNone: [ remotes first ] ]
			on: LGit_GIT_ENOTFOUND 
			do: [ :e | nil ]