actions
keepCurrentVersion
	"Mark the conflict as local."
	
	self selectedChangeWrapper chooseLocal.
	self changed: #changes.
	self updateSource