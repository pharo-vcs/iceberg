## Why do we still have a disk working copy?

Well, this is not really necessary for iceberg to work. Iceberg could just write source code directly on git's BLOB, as Thierry mentioned in the other thread.
The reason for this working copy to be there is just to try to be less alien.
Having the disk working copy allows people to still have a way to:
  - edit non-smalltalk files from the command like
  - use the non command line as a last ressource if something goes wrong with your Pharo image
  - use external tools to manage the repository (sourcetree, git kraken, whatever you're confortable with)

The idea is that Iceberg will try to keep your disk working copy in sync with your repository HEAD.
It will take care of transparently synchronizing your disk working copy when:
 - you commit
 - you change branches
 - you pull/push/merge

## Why don't we dump code into the disk as we write it?

The main reason behind it is that the image is not causally connected to the directory in disk, as Ben implied.
There is not a 1 to 1 correspondence between what you could ever have in disk and your running image.
As Ben mentionned, for this to happen:
 - changing the source code in disk should get automatically loaded into Pharo
 - changing the source code in Pharo should get automatically written in disk

The thing is that this is much more difficult than it sounds:
 - What happens if you do not want to save your image, you forgot to save it or it crashes? Suddenly you will have an image that is not in sync with your repository. Would you load all changes into your image as soon as you reopen it? Atomically?
 - What happens if you share your repository between several images?
 - Or if suddenly you change your branch from the command line to something completely different?

Several of these usecases don't even make sense. So we preferred to choose the path of "make it explicit".
Of course, we could do better, we are open to discuss any improvements.
Just take into account that Iceberg did not come from an egg :) we have thought about many possible scenarios and discussed with a lot of people before.