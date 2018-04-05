private-monticello
loadPackagesNamed: aCollection fromCommit: aCommit
	
	self ignoreNotificationsDuring: [ | loader |
		loader := MCVersionLoader new.
		aCollection do: [ :name | | package packageVersion |
			package := self packageNamed: name.
			packageVersion := (IceSavedPackageVersion
				fromCommit: aCommit
				package: package)
					mcVersion.
			loader addVersion: packageVersion.
			package beClean.
		].
		loader load ]