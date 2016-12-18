actions
push
	self flag: #todo. "replace #origin for a #remoteForPush"
	self pushTo: self origin