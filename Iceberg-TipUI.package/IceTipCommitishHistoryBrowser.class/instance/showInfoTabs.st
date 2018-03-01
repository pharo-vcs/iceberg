private
showInfoTabs
	(commitTabPanel tabs includes: infoTab) ifFalse: [
		self removeAllCommitPanelTabs.
		commitTabPanel 
			addTab: infoTab;
			addTab: diffFromHeadTab;
			addTab: diffFromAncestorTab ]. 
	
	self refreshCommitInfo.
	"refresh tab headers"
	self refreshDiffFromHeadLabel.
	self refreshDiffFromAncestorLabel.
	"Refresh selected tab contents"
	commitTabPanel selectedTab ifNotNil: #tabSelected.

	