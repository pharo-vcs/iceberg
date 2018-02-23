private
refreshCommitTabPanel
	self refreshCommitInfo.
	"refresh tab headers"
	self refreshDiffFromHeadLabel.
	self refreshDiffFromAncestorLabel.
	"Refresh selected tab contents"
	commitTabPanel selectedTab tabSelected.

