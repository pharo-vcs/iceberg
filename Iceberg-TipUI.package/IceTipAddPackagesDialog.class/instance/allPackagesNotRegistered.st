accessing
allPackagesNotRegistered
	| currentPackagesNames |
	currentPackagesNames := self model packages collect: #packageName.
	^ self allPackages reject: [ :rPackage | currentPackagesNames includes: rPackage name ]