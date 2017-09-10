accessing settings
defaultFileFormatType
	^ DefaultFileFormatType ifNil: [ 
		DefaultFileFormatType := (TIceRepositoryWriter traitUsers detect: #isDefault) name ]