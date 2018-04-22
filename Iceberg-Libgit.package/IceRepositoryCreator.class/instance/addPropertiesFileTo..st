private
addPropertiesFileTo: repository
	repository properties
		at: #format put: self formatToUse;
		store