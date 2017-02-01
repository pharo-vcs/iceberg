initialization
initializeRepository: aRepository.
	self initialize.
	"plugins := #()"
	self flag: #todo. "I need a way to define this... 
		1) in repository (.iceberg.ston)?
		2) in image (a plugins manager) "
	plugins := (IcePlugin allAvailableFor: aRepository) 
		collect: #new
		as: Array