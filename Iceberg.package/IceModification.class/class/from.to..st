instance creation
from: oldNode to: newNode

	^ self new
		oldNode: oldNode;
		modifiedNode: newNode;
		yourself