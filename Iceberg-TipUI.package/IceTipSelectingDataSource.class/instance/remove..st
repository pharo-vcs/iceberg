private
remove: item
	self selectedItems remove: item.
	self onSelectionChangedBlock ifNotNil: [ :block | block cull: item cull: false ]