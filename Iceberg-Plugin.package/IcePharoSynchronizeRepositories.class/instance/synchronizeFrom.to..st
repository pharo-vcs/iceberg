execute
synchronizeFrom: pharoRemote to: userRemote
	UIManager default informUserDuring: [ :bar |
		bar label: 'Synchronizing repositories'.
		bar max: 4.
		self repository branchName ~= 'development' 
			ifTrue: [ 
				bar max: bar max + 1.
				bar label: 'Switching to branch ''development'''.
				self repository checkoutBranch: 'development'.
				bar value: bar value + 1 ].
		
		"clean pull user repository (not inject into image)"
		bar label: ('Synchronizing changes from {1}/development' format: { userRemote remoteName }).
		self repository backend pullFrom: userRemote.
		bar value: bar value + 1.
		"clean pull pharo repository (not inject into image)"
		bar label: ('Synchronizing changes from {1}/development' format: { pharoRemote remoteName }).
		self repository backend pullFrom: pharoRemote.
		bar value: bar value + 1.
		"push downloaded sources to remote (not needed, but desirable)"
		bar label: ('Pushing changes to {1}/development' format: { userRemote remoteName }).
		self repository backend pushTo: userRemote.
		bar value: bar value + 1 ]