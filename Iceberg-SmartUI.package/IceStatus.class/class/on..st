instance-creation
on: aRepository
	
	self assert: self ~= IceStatus.

	^ self new
		repository: aRepository;
		yourself