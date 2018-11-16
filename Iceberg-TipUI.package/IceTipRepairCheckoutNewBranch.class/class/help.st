accessing
help
	^ 'You can create a new branch from the commit your image is pointing to.
This will not lose any change in the image.

This situation happens because the code loaded in your image does not correspond with the status of your repository.

This operation will modify the state of your working copy in disk. All non-commited changes in your disk working copy that are not in the image will be lost. If you want to keep them, perform a commit from outside before.'