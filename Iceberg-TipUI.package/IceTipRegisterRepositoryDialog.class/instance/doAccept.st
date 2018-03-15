private
doAccept
	| repository |
	
	self selectedType validate.
	repository := self selectedType newRepository.
	repository register