private requesting
get: aString parameters: aDictionary
	^ self jsonContentsWithValidationDo: [
		(self newRequestTo: aString, (String streamContents: [ :stream |
				stream << '?'.
				aDictionary associations 
					do: [ :keyPair | stream << keyPair key << '=' << keyPair value ]
					separatedBy: [ stream << '&' ] ] ))
			get;
			response ]