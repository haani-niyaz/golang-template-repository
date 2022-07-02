# gitleaks

## What

[gitleaks](https://github.com/zricethezav/gitleak) is a SAST tool for detecting and preventing hardcoded secrets like passwords, api keys, and tokens in git repos. Gitleaks is an easy-to-use, all-in-one solution for detecting secrets, past or present, in your code.

## Why

Raise security incidents early by detecting secret leaks and raising Github security code scanning alerts.

## How

The mechanism to detect secrets and protect (undo commit with secret) is described [here](https://github.com/zricethezav/gitleaks#commands).

## Setup

A gitleaks workflow is configured to run a detect operation on the `main` branch and no further configuration is required.

!!! info

    The gitleaks github action requires a paid licensed therefore a custom workflow has been setup instead. It will fail the secret scan if secrets are detected and push alerts to Github security.
