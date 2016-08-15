commits
commitsNotLoaded
	"Returns the commits that contain changes to known packages but that have not been loaded to the image"
	^ ((self loadedPackages 
		flatCollect: #versionsNotLoaded)
		collect: #commit as: Set)
		asSortedCollection: [:a :b | a datetime > b datetime ].
