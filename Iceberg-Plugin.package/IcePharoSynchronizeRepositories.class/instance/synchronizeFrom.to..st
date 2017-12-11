execute
synchronizeFrom: pharoRemote to: userRemote
	self repository branchName ~= 'development' 
		ifTrue: [ 
			self inform: 'Switching to branch ''development'''.
			self repository checkoutBranch: 'development' ].
		
	"clean pull user repository (not inject into image)"
	self inform: ('Synchronizing changes from {1}/development' format: { userRemote remoteName }).
	self repository backend pullFrom: userRemote.
	"clean pull pharo repository (not inject into image)"
	self inform: ('Synchronizing changes from {1}/development' format: { pharoRemote remoteName }).
	self repository backend pullFrom: pharoRemote.
	"push downloaded sources to remote (not needed, but desirable)"
	self inform: ('Pushing changes to {1}/development' format: { userRemote remoteName }).
	self repository backend pullFrom: pharoRemote.