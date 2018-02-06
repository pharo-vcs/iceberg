*Iceberg-TipUI
buildGlamourContextMenuOn: aPresentation
	contents do: [ :each | 
		aPresentation addSelectionAction: each buildGlamourAction ]