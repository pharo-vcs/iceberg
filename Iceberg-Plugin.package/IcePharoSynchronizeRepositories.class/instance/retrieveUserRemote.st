private
retrieveUserRemote
	| userRemotes |
	
	userRemotes := self remotes reject: [ :each | self pharoURLs includes: each url ].
	userRemotes size = 1 ifTrue: [ ^ self  ].
	userRemotes size > 1 ifTrue: [ ^ self pickOne: userRemotes ].
		
	self error: 'Can''t determine remote to use during contribution (maybe you need to add one?).'