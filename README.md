# Iceberg

[![Travis Build Status](https://travis-ci.org/pharo-vcs/iceberg.svg?branch=master)](https://travis-ci.org/pharo-vcs/iceberg)
[![Appveyor Build status](https://ci.appveyor.com/api/projects/status/github/pharo-vcs/iceberg?svg=true)](https://ci.appveyor.com/project/pharo-vcs/iceberg)  


Iceberg is the main toolset for handling [VCS](https://en.wikipedia.org/wiki/Version_control) in Pharo.

More concretely, Iceberg provides tools to checkout, commit, merge and other common operations in git repositories, all directly from the image.
In fact, git is currently the only VCS backend for Iceberg, but it's design supports the addition of other options.

Iceberg also provides some plugins for smooth and fast integration with common actions in the workflow of contributors, such as creating a branch based on a GitHub issue number.


## Documentation

We count with a [wiki](https://github.com/pharo-vcs/iceberg/wiki) section on this GitHub repository.

**Getting Started?** Check the 5 minutes tutorial [in our wiki](https://github.com/pharo-vcs/iceberg/wiki/Tutorial).


## Contributions

To contribute with **source code** to this project, please fork and create a pull request.
Please find below the instructions to install the development branch.

The same procedure applies for **documentation**, since the wiki contents are deployed by CI when master branch changes: the markdown files in `/doc` are copied to the wiki. 
The entry point for changes is the [documentation home page](docs/Home.md).


## Installation (development)

Since Iceberg is included in Pharo (from 6.0), the installation of another version involves an update.
Such update can be non-trivial because it may involve updating dependencies that affect the code loading itself (LibGit2, for example). 
That's the reason to have [a bash update script](/scripts/testUpdateIceberg.sh) that performs some pre- and post-load actions.

1. Open a terminal
2. clone this repository
3. `cd scripts`
4. `testUpdateIceberg.sh --dev`

In the case of Windows, we know it worked in the MING64 Bash Console that comes with git-for-windows.


## License

The code is licensed under the [MIT](LICENSE) license.