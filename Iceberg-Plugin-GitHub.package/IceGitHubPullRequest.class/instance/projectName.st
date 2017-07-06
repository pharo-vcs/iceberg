accessing
projectName
	^ ((self jsonAt: #base) at: #repo) at: #name