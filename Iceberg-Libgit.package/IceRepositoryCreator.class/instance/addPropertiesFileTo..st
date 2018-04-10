private
addPropertiesFileTo: repository
	| properties |

	properties := IceRepositoryProperties 
		fromDictionary: { #format -> self formatToUse } asDictionary.
	repository addProperties: properties