private
addPropertiesFileTo: repository
	repository addProperties: (IceRepositoryProperties 
		fromDictionary: { #format -> self formatToUse } asDictionary)