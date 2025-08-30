# Contributing

We use [GitHub Actions](https://github.com/features/actions) as a continuous integration system.

For details, take a look at the following workflow configuration files:

- [`workflows/integrate.yaml`](workflows/integrate.yaml)
- [`workflows/merge.yaml`](workflows/merge.yaml)
- [`workflows/release.yaml`](workflows/release.yaml)
- [`workflows/triage.yaml`](workflows/triage.yaml)

## Coding Standards

We use [`ergebnis/composer-normalize`](https://github.com/ergebnis/composer-normalize) to normalize `composer.json`.

We use [`yamllint`](https://github.com/adrienverge/yamllint) to enforce coding standards in YAML files.

If you do not have `yamllint` installed yet, run

```sh
brew install yamllint
```

to install `yamllint`.

We use [`friendsofphp/php-cs-fixer`](https://github.com/FriendsOfPHP/PHP-CS-Fixer) to enforce coding standards in PHP files.

Run

```sh
make coding-standards
```

to automatically fix coding standard violations.

## Tests

We use [`phpunit/phpunit`](https://github.com/sebastianbergmann/phpunit) to drive the development.

Run

```sh
make tests
```

to run all the tests.

## Extra lazy?

Run

```sh
make
```

to enforce coding standards, run a static code analysis, and run tests!

## Help

:bulb: Run

```sh
make help
```

to display a list of available targets with corresponding descriptions.
