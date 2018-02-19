storing
storeInRepository: anIceRepository
	
	self basicStoreInRepository: anIceRepository.
	self changes do: [ :e | e storeInRepository: anIceRepository ]