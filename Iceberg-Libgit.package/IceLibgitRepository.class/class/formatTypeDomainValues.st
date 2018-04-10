settings
formatTypeDomainValues
	^ TIceRepositoryWriter traitUsers 
		ifNotEmpty: [ :users | users collect: [ :each | each description -> each name ] ]
		ifEmpty: [ { 'Undefined' -> nil } ]