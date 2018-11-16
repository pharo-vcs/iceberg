API-properties
properties
	^ IceRepositoryProperties
		fromFileReferenceDirectory: self project sourceDirectoryReference
		commitish: self