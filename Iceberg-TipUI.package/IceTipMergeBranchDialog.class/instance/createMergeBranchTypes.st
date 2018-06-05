private factory
createMergeBranchTypes
	| allTypes |
	
	"Collect types local+remotes"	
	allTypes :=  { 
	 	(IceTipMergeBranchPanel on: self model) 
			title: 'Local';
			icon: (self iconNamed: #branch);
			yourself }, 
	(self model remoteModels collect: [ :each | 
		(IceTipMergeBranchPanel on: each)
			title: each name;
			icon: (self iconNamed: #remote);
			yourself ]).
	
	"Doing this because I can trigger the accept inside the panels."
	allTypes do: [ :each | each onAccept: [ self window delete ] ].
	
	^ allTypes