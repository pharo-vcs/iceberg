accessing
beForCloneOfRepository: aRepository
	self withoutNewRepository.
	self withoutLocalRepository.
	repository := aRepository