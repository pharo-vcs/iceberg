instance creation
byRootGroupItemFor: aToolContextClass order: aNumber
	^ (self byRootGroupItemFor: aToolContextClass)	
		menuItemOrder: aNumber;
		yourself