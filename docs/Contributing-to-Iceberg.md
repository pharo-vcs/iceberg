
# Contributing to Iceberg

Thanks for your interest on improving Iceberg.
This page explains how to do it in two ways: changing the **Source Code** and changing the **Wiki** contents.

## Contributions to Source Code

Since Iceberg is included in Pharo (from 6.0), contributors normally propose changes to this project with the final motivation of getting them to be merged into a version of Pharo (either Pharo-development or -stable).

To do that, it's needed to create a pull request to one of the following branches:
- For Pharo-stable, use the `master` branch.
- For Pharo-development, use the latest `dev-` branch.

### Installation

Loading Iceberg in Pharo is more difficult than updating other projects -that just use a "Metacello script"- since normally Metacello will rely on Iceberg to update Iceberg.

That's the reason to have [a bash update script](../scripts/testUpdateIceberg.sh) that performs some pre- and post-load actions.
Steps to use it:
1. Open a terminal
2. Clone this repository and checkout the desired branch
3. Execute `./scripts/testUpdateIceberg.sh --dev`
4. Execute `./pharo-ui Pharo.image`

Also, the script loads the `development` Metacello group, which contains some tests that are not present in the Pharo image normally.

About Windows platform, we know it worked in the MINGW64 Bash Console that came by installing git (around 2020).


## Contributions to Wiki
 
We count with [a bash script](../scripts/sync-wiki.sh) that deploys the markdown files in `doc/` directory to the Wiki section.
The entry point for the wiki is the [Home page](Home.md).

A while ago, Travis CI executed such bash script each time the `master` branch changed.
This is not working for the moment, but contributors can execute the following command in a terminal:

```bash
export GH_TOKEN=<<TOKEN>> && ./scripts/sync-wiki.sh
```

where `<<TOKEN>>` is a [GitHub Personal Token](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) with repo:write permissions on this repository.
