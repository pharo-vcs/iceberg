private factory
newContextWithSelection: anObject 

	^ IceTipCredentialContext new
		store: model;
		credential: anObject;
		tool: self;
		yourself