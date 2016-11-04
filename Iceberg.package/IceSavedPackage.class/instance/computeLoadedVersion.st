private
computeLoadedVersion
	| workingCopyAncestors |
	workingCopyAncestors := self package workingCopy ancestors.
	workingCopyAncestors ifEmpty: [ ^ IceTemporaryVersion forPackage: self ].

	self workingCopy ancestors
		detect: [ :ancestor | (ancestor respondsTo: #iceVersion) and: [ ancestor commit notNil ] ]
		ifFound: [ :ancestor | ^ ancestor iceVersion ].

	^ self versions 
		detect: [ :version | workingCopyAncestors includes: version info  ] 
		ifNone: [ 
			self workingCopy repositoryGroup repositories do: [ :mcRepo |
				mcRepo commitIdFor: self workingCopy ifFound: [ :commitOrTag | 
					^ (self repository revparse: commitOrTag) versionFor: self ]
			].
		
			^ IceForeignVersion forPackage: self.
		]
