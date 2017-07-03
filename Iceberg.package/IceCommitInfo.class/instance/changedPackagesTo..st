accessing
changedPackagesTo: aCommitish
	"If is first commit, it will have no parents. Answer all packages because 
	 all are 'changed'"
	aCommitish ifNil: [ ^ self repository savedPackages ].
	^ aCommitish changedPackagesToCommitInfo: self 