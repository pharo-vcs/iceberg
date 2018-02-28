specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :mainColumn |
			mainColumn
				"newRow: #toolbar height: IceTipToolbar defaultHeight;"
				newRow: [ :row |
					row newColumn: [ :column |
						column 
							newRow: #commitsPanel;
							newRow: #actionPanel height: IceTipActionPanel defaultHeight ] ] ]