walking
versionsFor: package
	self modifyingPackage: self.
	^ self commits collect: [ :commit | commit versionFor: package ]
