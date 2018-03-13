*Iceberg-TipUI
useFunction: aFilterFunctionClass do: aBlock 
	function := aFilterFunctionClass table: self.
	aBlock cull: function cull: self