visiting
visitMergeAborted: anError
	UIManager default 
		alert: (anError messageText ifNil: ['Automatic (fast-forward) merge is not possible. 
Please perform the merge manually, then proceed with your previous operation.
WARNING: If you have external files, you may need to verify the conflicts there.'])
		title: 'Automatic merge failed'