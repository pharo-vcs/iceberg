private
computeLoadedVersion
	| workingCopyAncestors |
	self halt.
	workingCopyAncestors := self package workingCopy ancestors.

	self workingCopy ancestors
		detect: [ :ancestor | (ancestor respondsTo: #iceVersion) and: [ ancestor commit notNil ] ]
		ifFound: [ :ancestor | ^ ancestor iceVersion ].

	^ self versions 
		detect: [ :version | workingCopyAncestors includes: version info  ] 
		ifNone: [ 
			self workingCopy repositoryGroup repositories do: [ :mcRepo |
				mcRepo commitIdFor: self workingCopy ifFound: [ :commitId | 
					^ (self repository commitAt: commitId) versionFor: self ]
			].
		
			^ IceForeignVersion package: self.
		]
