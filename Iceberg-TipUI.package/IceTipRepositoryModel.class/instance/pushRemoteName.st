accessing
pushRemoteName
	^ '{1}/{2}' format: { 
	self entity pushRemote name.
	self entity branch name }