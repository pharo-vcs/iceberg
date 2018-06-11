Description
--------------------

I am a datasource which elements are dislpayed with a checkbox to be able to select some of them. 

Public API and Key Messages
--------------------

- #selectedItems 					Accessor to get the selected items
- #onSelectionChangedBlock 		Optional block executed when an item is selected/deselected. It takes as first parameter the item and as second parameter a boolean (true on selection, false on deselection)

Examples
--------------------

	IceTipSelectingDataSource new
		tool: self;
		elements: self allPackagesNotRegistered;
		yourself	
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	onSelectionChangedBlock:		<aBlock>		Optional block executed when an item is selected/deselected. It takes as first parameter the item and as second parameter a boolean (true on selection, false on deselection)
	selectedItems:					<aSet>			Collection containing all the selected items
