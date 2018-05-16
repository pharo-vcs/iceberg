accessing
remotes
	^ self repository remotes collect: [ :each | IceRemoteModel modelFor: each ]