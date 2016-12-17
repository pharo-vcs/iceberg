private
refresh
	self branch refresh.
	commitDictionary := Dictionary new.
	savedPackages := nil.
	self announcer announce: (IceRepositoryModified for: self)