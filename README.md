# gh-release

Utilities to manage GitHub Release.

## download.sh

Usage of [`download.sh`](./bin/download.sh) is

```
download.sh {user}/{repo} {pattern} [{tag}]
```

Use https://git.io/JVbUP or https://raw.githubusercontent.com/lambdalisue/gh-release/main/bin/download.sh like

```
curl -sL https://git.io/JVbUP | bash -s -- stedolan/jq '-osx-amd64'
```

```
curl -sL https://raw.githubusercontent.com/lambdalisue/gh-release/main/bin/download.sh | bash -s -- itchyny/gojq '_darwin_amd64\\.zip'
```

For private repository, apply your personal access token to `PA_TOKEN` like

```
PA_TOKEN=... curl -sL https://git.io/JVbUP | bash -s -- itchyny/gojq '_darwin_amd64\\.zip'
```

## License

The code in this repository follows MIT license, texted in [LICENSE](./LICENSE).
Contributors need to agree that any modifications sent in this repository follow
the license.
