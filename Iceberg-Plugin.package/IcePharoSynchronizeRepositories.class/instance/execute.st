execute
execute
	"I verify the status of Pharo and ensure certain aspects of Pharo are ok"
	| pharoRemotes userRemote |

	pharoRemotes := self remotesIncludingPharoURLs.
	"Add pharo remote if missing"
	pharoRemotes ifEmpty: [ 
		| url |
 		url := self pharoURLs detect: [ :each | each beginsWith: 'git@' ]. 
		self inform: ('No repository pointing to pharo-project. Adding {1}' format: { url }).
		self repository addRemote: (IceRemote name: 'pharo-project' url: url).
		remotes := nil ].
		
	userRemote := self retrieveUserRemote.
	userRemote ifNil: [ ^ self ].
	self inform: ('Synchronizing pharo-project with your repository at {1}' 
		format: { userRemote remoteName }).
	self synchronizeFrom: pharoRemotes first to: userRemote