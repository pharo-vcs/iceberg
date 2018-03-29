private
showInfoTabs
	"This is just an optimisation to not refresh always. This way it will happen 
	 just if we come from a 'non-selection'"
	(commitTabPanel tabs includes: infoTab) ifFalse: [
		self removeAllCommitPanelTabs.
		commitTabPanel 
			addTab: infoTab;
			addTab: headTabContainer tab;
			addTab: ancestorTabContainer tab ]. 
	
	self refreshCommitInfo.
	"refresh tab headers"
	self refreshDiffFromHeadLabel.
	self refreshDiffFromAncestorLabel.
	"Refresh selected tab contents"
	commitTabPanel selectedTab ifNotNil: #tabSelected.

	