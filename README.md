# jQuery Picture Tag

### Examples

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

```bash
cake build:development
open development/spec-runner.html
```

### Releasing

```bash
echo -n "0.0.0" > VERSION
cake build # Package for distribution
cake build:tag # Tag the git repo with the version number
git push --tags
```
