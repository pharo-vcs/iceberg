actions
push
	self command: ('push origin {1}' format: {self branch}).
	self announcer announce: IcePushed new.