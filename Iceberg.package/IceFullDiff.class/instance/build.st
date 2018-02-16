building
build
	"This actually only works to compare with working copy..."
	(self leftVersion loadedPackages collect: [ :package | IceImageChange package: package ])
		do: [ :change | change buildOn: self ].