# Quickstart

The following instructions provide the setup required to optimally use this repository.

### Install developer tooling

 ```bash
 pip install --user pre-commit commitizen
 ```
!!! tip

       - For background on `pre-commit` please see [pre-commit](continuous-integration/pre-commit.md) for further details.
       - For background on `commitizen` please see [commitizen](continuous-integration/semantic-release.md#commitizen) for further details.


### Setup base release for [semantic-release](continuous-integration/semantic-release.md)

!!! attention

    This is a one time activity. If a tag already exists in the repo this step is not required. If no tags exist proceed to read the next section.

!!! question "Why is this required?"

    Please see [Base release version](continuous-integration/semantic-release.md#base-release-version) documentation for rationale.


   ```bash
   # Within the `main` branch in your git repo
   git tag -a v0.1.0 -m "Pre-release"
   git push origin v0.1.0
   ```


### Get template repository updates (optional)

Setup an additional remote to periodically get latest template repository updates.

```bash
git remote add template https://github.com/rog-golang-buddies/golang-template-repository.git
# Update
git fetch template
git merge template/[branch to merge]
```
