settings
backendTypeDomainValues
	^ TIceRepositoryBackend traitUsers 
		ifNotEmpty: [ :users | users collect: [ :each | each description -> each name ] ]
		ifEmpty: [ { 'No backend' -> nil } ]