# Iceberg

[![Travis Build Status](https://travis-ci.com/pharo-vcs/iceberg.svg?branch=dev-1.9)](https://travis-ci.com/pharo-vcs/iceberg)


Iceberg is the main toolset for handling [VCS](https://en.wikipedia.org/wiki/Version_control) in Pharo.

More concretely, Iceberg provides tools to checkout, commit, merge and other common operations in git repositories, all directly from the image.
In fact, git is currently the only VCS backend for Iceberg, but it's design supports the addition of other options.

Iceberg also provides some plugins for smooth and fast integration with common actions in the workflow of contributors, such as creating a branch based on a GitHub issue number.


## Documentation

Please refer to the [Wiki section](https://github.com/pharo-vcs/iceberg/wiki).
Getting Started? Check the 5 minutes tutorial [in our wiki](https://github.com/pharo-vcs/iceberg/wiki/Tutorial).


## Contributions to Source Code

Since Iceberg is included in Pharo (from 6.0), contributors normally propose changes to this project with the final motivation of getting them to be merged into a version of Pharo (either Pharo-development or -stable).

To do that, it's needed to create a pull request to one of the following branches:
- For Pharo-stable, use the `master` branch.
- For Pharo-development, use the latest `dev-` branch.

### Installation

Loading Iceberg in Pharo is more difficult than updating other projects -that just use a "Metacello script"- since normally Metacello will rely on Iceberg to update Iceberg.

That's the reason to have [a bash update script](/scripts/testUpdateIceberg.sh) that performs some pre- and post-load actions.
Steps to use it:
1. Open a terminal
2. Clone this repository and checkout the right branch
3. Execute `./scripts/testUpdateIceberg.sh --dev`

About Windows platform, we know it worked in the MING64 Bash Console that came by installing git (around 2020).

## Contributions to Wiki
 
We count with [a bash script](scripts/sync-wiki.sh) that deploys the markdown files in `doc/` directory to the Wiki section.
The entry point for the wiki is the [Home page](docs/Home.md).

A while ago, Travis CI executed such bash script each time the `master` branch changed.
This is not working for the moment, but contributors can execute the following command in a terminal:

```
export GH_TOKEN=<<TOKEN>> && ./scripts/sync-wiki.sh
```

where `<<TOKEN>>` is a [GitHub Personal Token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) with repo:write permissions on this repository.

## License

The code is licensed under the [MIT](LICENSE) license.
