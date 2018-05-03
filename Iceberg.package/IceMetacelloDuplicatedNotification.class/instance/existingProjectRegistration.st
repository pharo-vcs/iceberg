accessing
existingProjectRegistration

	| repository |
	repository := IceLibgitRepository new
		location: builder locationToUse;
		subdirectory: builder subdirectory.
	^ IceMetacelloProjectRegistration new
		version: repository head description;
		yourself