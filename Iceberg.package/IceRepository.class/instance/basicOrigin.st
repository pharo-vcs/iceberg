private
basicOrigin
	self isValid ifFalse: [ ^ nil ].
	^ [ self backend origin ]
		on: LGit_GIT_ENOTFOUND 
		do: [ :e | nil ]