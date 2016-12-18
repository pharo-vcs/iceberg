actions
pull
	self flag: #todo. "replace #origin for a #remoteForPull"
	self pullFrom: self origin