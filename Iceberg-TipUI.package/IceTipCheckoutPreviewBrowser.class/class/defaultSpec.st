specs
defaultSpec
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :mainColumn |
			mainColumn
				"newRow: #toolbar height: IceTipToolbar defaultHeight;"
				newRow: [ :row |
					row 
						newColumn: #checkoutStrategyLabel width: 100;
						newColumn: #checkoutStrategyList ]
					height: self inputTextHeight;
				newRow: #diffPanel;
				newRow: #actionPanel height: self iceActionPanelHeight ]