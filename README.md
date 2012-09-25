# jQuery Picture Tag

## Examples

```bash
open development/example.html
```

## Contribute

### You Need Coffee Script

```bash
brew upgrade
brew install nodejs
npm install -g coffee-script
```

### Running Specs

TODO: cake spec

```bash
cake build:development
open development/spec-runner.html
```

### Releasing

TODO: cake release VERSION=x.y.z

```bash
echo -n "x.y.z" > VERSION
cake build # Package for distribution
cake build:tag # Tag the git repo with the version number
git push --tags
```
