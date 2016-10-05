actions
restoreUpdating: aPresentation 
	self repository backend cloneRepository.
	self repository refresh.
	aPresentation pane browser update
