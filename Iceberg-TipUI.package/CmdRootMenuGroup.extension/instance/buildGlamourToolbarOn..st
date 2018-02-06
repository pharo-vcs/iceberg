*Iceberg-TipUI
buildGlamourToolbarOn: aPresentation
	contents do: [ :each | 
		aPresentation addAction: (each buildGlamourAction 
			showTitle; 
			yourself) ]	