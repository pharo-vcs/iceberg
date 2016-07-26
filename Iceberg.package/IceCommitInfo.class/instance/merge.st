actions
merge
	| loader |
	self halt.
	loader := MCVersionLoader new.
	self repository loadedPackages do: [ :package |
		loader addVersion: (self versionFor: package) mcVersion
	].

	loader localModifications 
		ifEmpty: [ 
			loader loadWithNameLike: 'Merging commit: ', self id ]
		ifNotEmpty: [ 
			loader 
				announceLoad: 'Merging commit: ', self id 
				do: [ loader mergeVersions ]].

	self halt.
	loader hasVersions ifFalse: [
		self repository backend merge: self id. ]
