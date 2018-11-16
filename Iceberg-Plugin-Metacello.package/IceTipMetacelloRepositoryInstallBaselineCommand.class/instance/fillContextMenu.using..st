context menu
fillContextMenu: aMenu using: aCommandActivator
	
	self allBaselines do: [ :each |
		self fillDefaultMenu: aMenu using: aCommandActivator baseline: each.
		self fillGroupMenu: aMenu using: aCommandActivator baseline: each ]		
