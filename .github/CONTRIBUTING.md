# CONTRIBUTING

We are using [GitHub Actions](https://github.com/features/actions) as a continuous integration system.

For details, take a look at the following workflow configuration files:

- [`workflows/integrate.yaml`](workflows/integrate.yaml)
- [`workflows/prune.yaml`](workflows/prune.yaml)
- [`workflows/release.yaml`](workflows/release.yaml)
- [`workflows/triage.yaml`](workflows/triage.yaml)

## Coding Standards

We are using [`yamllint`](https://github.com/adrienverge/yamllint) to enforce coding standards in YAML files.

If you do not have `yamllint` installed yet, run

```sh
$ brew install yamllint
```

to install `yamllint`.

Run

```sh
$ make coding-standards
```

to detect coding standard violations.

## Tests

We are using [`phpunit/phpunit`](https://github.com/sebastianbergmann/phpunit) to drive the development.

Run

```sh
$ make tests
```

to run all the tests.

## Extra lazy?

Run

```sh
$ make
```

to detect coding standard violations and run tests!

## Help

:bulb: Run

```sh
$ make help
```

to display a list of available targets with corresponding descriptions.
