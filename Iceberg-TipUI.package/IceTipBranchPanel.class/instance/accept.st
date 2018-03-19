actions
accept
	self validate.
	self doAccept.
	acceptBlock ifNotNil: [ acceptBlock cull: self ]