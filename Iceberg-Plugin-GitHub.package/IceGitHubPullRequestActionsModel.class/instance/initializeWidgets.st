initialization
initializeWidgets
	mergeButton := self newButton.
	acceptButton := self newButton.
	rejectButton := self newButton.	
	
	mergeButton 
		label: 'Merge into image';
		action: [ mergeBlock value ].
	acceptButton 
		label: 'Accept pull request';
		action: [ acceptBlock value ].
	rejectButton 
		label: 'Reject pull request';
		action: [ rejectBlock value ]