initialization
initialElements
	^ repository savedPackages collect: [ :package |
			IcePackageChangeSet 
				package: package 
				parent: self ]