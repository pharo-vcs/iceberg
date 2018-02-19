building
ensureOrganization: aCollection 
	
	^ organizationChange ifNil: [ organizationChange := IcePackageOrganizationNode new
		parent: self;
		yourself. ]