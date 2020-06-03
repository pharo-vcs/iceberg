initialization
initializeDialogWindow: aDialowWindowPresenter

	aDialowWindowPresenter 
		addButton: 'Cancel' do: #close;
		addButton: 'Create' do: [ self accept ]