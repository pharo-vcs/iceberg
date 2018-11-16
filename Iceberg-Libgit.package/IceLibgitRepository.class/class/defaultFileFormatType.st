settings
defaultFileFormatType
	^ DefaultFileFormatType ifNil: [ 
		DefaultFileFormatType := TIceRepositoryWriter traitUsers 
			detect: #isDefault
			ifFound: #name
			ifNone: [ nil "To be filled later (on first demand)" ] ]