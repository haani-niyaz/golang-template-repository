# Semantic Release

## What

[Semantic Release](https://github.com/semantic-release/semantic-release) automates the whole package release workflow including: determining the next version number, generating the release notes, and publishing the package.

**semantic-release** uses the commit messages to determine the consumer impact of changes in the codebase. Following formalized conventions for commit messages, semantic-release automatically determines the next semantic version number, generates a changelog and publishes the release.

## Why

Follow a well established [commit message convention](https://github.com/angular/angular/blob/main/CONTRIBUTING.md#commit) that encourages your team to have structured commits and also provides the controls via commits to automatically version your codebase and publish a release.


## How

### Commit message convention

The formalized convention is as follows for commit messages:


```
<type>(<scope>): <short summary>
  │       │             │
  │       │             └─⫸ Summary in present tense. Not capitalized. No period at the end.
  │       │
  │       └─⫸ Commit Scope: animations|bazel|benchpress|common|compiler|compiler-cli|core|
  │                          elements|forms|http|language-service|localize|platform-browser|
  │                          platform-browser-dynamic|platform-server|router|service-worker|
  │                          upgrade|zone.js|packaging|changelog|docs-infra|migrations|ngcc|ve|
  │                          devtools
  │
  └─⫸ Commit Type: build|ci|docs|feat|fix|perf|refactor|test
```

### An example:


| Commit message                                                                                                                                                                                   | Release type               |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------------------------- |
| `fix(pencil): stop graphite breaking when too much pressure applied`                                                                                                                             | ~~Patch~~ Fix Release      |
| `feat(pencil): add 'graphiteWidth' option`                                                                                                                                                       | ~~Minor~~ Feature Release  |
| `perf(pencil): remove graphiteWidth option`<br><br>`BREAKING CHANGE: The graphiteWidth option has been removed.`<br>`The default graphite width of 10mm is always used for performance reasons.` | ~~Major~~ Breaking Release <br /> (Note that the `BREAKING CHANGE: ` token must be in the footer of the commit) |


For a base version of `0.1.0` the following will apply:

| Type                      | Release type example      | Notes                                                          |
|---------------------------|---------------------------|----------------------------------------------------------------|
| `fix`                     | increments to   `0.1.1`   |                                                                |
| `feat`                    | increments to   `0.1.0`   | Resets any existing patch fixes e.g:   `0.1.3` will be `0.2.0` |
| `feat \| BREAKING CHANGE` | Increments to `1.0.0`     |                                                                |
| All others                | No version increment      |                                                                |


## Setup

1. Instead of having to hand craft commit messages use [commitzen](https://commitizen-tools.github.io/commitizen/) to ease following the convention.

```
pip install -U commitizen
```

For more installtion options see [here](https://commitizen-tools.github.io/commitizen/#installation).

stage some files in your repo and type `cz commit` and you're ready to go!

📍 **TIP**

> Decide on the commit convention scope in advance. This will keep it consistent and provide a coherent semantic mapping.


2. Base release version

The CI is configured to run on the `main` branch and technically no further setup is required. However, `semantic-release` starts the version at `1.0.0` with pre-release options. This may still not be desireable for your project so few workarounds are desicribed below.

⚠️ You only need to action this once.

<u>In the Github repo page:</u>

1. Click on **Create a new release** link on the right hand panel

2. Click on **Choose a tag**, type in `0.1.0` and hit enter

3. Enter desired release title e.g: Pre-release

4. Tick **This is a pre-release** checkbox

5. Click the **Publish** button

Youre' done!

If you don't want to create a release and the steps above are one too many, you can just create a tag via the command line as shown below:

```
# Within the `main` branch in your git repo
git tag -a v0.1.0 -m "Pre-release"
git push origin v0.1.0
```








-
