instance-creation
on: aRepository
	
	self assert: self ~= IceRepositoryStatus.

	^ self new
		repository: aRepository;
		yourself