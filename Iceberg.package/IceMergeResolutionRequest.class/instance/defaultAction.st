exceptiondescription
defaultAction

	| window mergeMorph |
	mergeMorph := (IceMergeMorph forMerger: merge).

	mergeMorph
		fromDescription: merge sourceDescription;
		toDescription: merge targetDescription.

	window := mergeMorph newWindow
		title: 'Merge';
		yourself.

	UIManager default openModal: window.
	^ mergeMorph merged