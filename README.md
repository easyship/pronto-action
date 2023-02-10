# Pronto Action

A Github action to run [pronto](https://github.com/prontolabs/pronto).

## Acknowledgement

Big thanks to [HeRoMo](https://github.com/HeRoMo) for building the awesome action!
This action is modified from [HeRoMo/pronto\-action](https://github.com/HeRoMo/pronto-action) project.

## Support Pronto runners

This action support the following pronto runners.

- [pronto\-brakeman](https://github.com/prontolabs/pronto-brakeman)
- [pronto\-standardrb](https://github.com/julianrubisch/pronto-standardrb)

## Usage

Create Github workflow definition yaml file in *.github/workflows* directory of your repository.

### Input parameters

This action can be configured by the following input parameters.
<!-- textlint-disable spellcheck-tech-word -->
| name | require | default | description |
|---|---|---|---|
| github_token | false | ${{ github.token }} | default value is setted by github workflow automatically. |
| commit | false | `origin/${{ github.base_ref }}` | Commit for the diff.<br>(`origin/main`, if base of pullrequest is `main`) |
| runner | false | `standardrb brakeman` | Run only the passed runners. |
| formatters | false | `github_status github_pr_review` | Pick output formatters. |
| path | false | `'.'` | Relative path to check. |
<!-- textlint-enable spellcheck-tech-word -->
see [Pronto usage](https://github.com/prontolabs/pronto#usage).

## Github workflow definition samples

### For running rubocop runner

The followoing yaml is a simplest workflow difinition of using pronto-action.

```yaml
name: Pronto
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  pronto:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
      statuses: write
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      # Ruby 3
      - uses: easyship/pronto-action@v3
```

## Required `permissions` in GitHub workflow

When *Read repository contents permission* in *Settings/Actions* of the repository is setted, you have to add `permissions` to the Github workflow difinition YAML.

The following permissions are required.

- pull-requests: write
- statuses: write

The followoing yaml is a workflow difinition of pronto-action with permissions.

```yaml
name: Pronto
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  pronto:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
      statuses: write
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - uses: easyship/pronto-action@v3
```

## LICENSE
[MIT](LICENSE)
