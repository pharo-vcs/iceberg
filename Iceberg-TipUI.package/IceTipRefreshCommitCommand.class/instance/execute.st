execution
execute
	repositoryModel reset.
	"Announce to my owner (not the general announcement, because just my owner panel is 
	 interested on this action)"
	self announcer announce: (IceTipDiffRefreshed for: repositoryModel entity)