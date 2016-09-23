private
computeLoadedVersion
	| workingCopyAncestors |
	workingCopyAncestors := self package workingCopy ancestors.

	^ self versions 
		detect: [ :version | workingCopyAncestors includes: version info  ] 
		ifNone: [ 
			self workingCopy repositoryGroup repositories do: [ :mcRepo |
				mcRepo commitIdFor: self workingCopy ifFound: [ :commitId | 
					^ (self repository commitAt: commitId) versionFor: self ]
			].
		
			^ IceForeignVersion package: self.
		]
