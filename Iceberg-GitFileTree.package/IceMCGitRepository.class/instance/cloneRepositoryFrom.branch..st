actions
cloneRepositoryFrom: anUrl branch: aName
	self remoteUrl: anUrl url.
	self branch: aName.
	self cloneRepository