accessing
existingProjectRegistration

	^ (IceLibgitRepository new
		location: builder locationToUse;
		subdirectory: builder subdirectory;
		head) description.