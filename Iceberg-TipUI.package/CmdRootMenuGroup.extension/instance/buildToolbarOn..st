*Iceberg-TipUI
buildToolbarOn: aToolbar
	contents do: [ :each | 
		aToolbar addItem: each buildToolbarItem ]