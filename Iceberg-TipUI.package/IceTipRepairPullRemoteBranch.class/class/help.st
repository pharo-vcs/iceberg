accessing
help
	^ 'You can pull commits from a remote to put your image and your repository in sync.
This will not lose any change in the image.

This situation happens because the code loaded in your image is forward the code present in the repository.

This operation will modify the state of your working copy in disk. All non-commited changes in your disk working copy that are not in the image will be lost. If you want to keep them, perform a commit from outside before.'