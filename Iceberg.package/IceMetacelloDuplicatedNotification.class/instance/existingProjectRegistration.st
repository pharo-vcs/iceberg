accessing
existingProjectRegistration

	| repository |
	repository := IceLibgitRepository new
		location: builder locationToUse.
	^ IceMetacelloProjectRegistration new
		version: repository head description;
		yourself