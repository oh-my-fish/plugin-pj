<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### pj
A port of [Jan De Poorter's pj][jdp-pj] for the fish shell. `pj` was originally
popularized by the oh-my-zsh plugin with the same name, [pj][omz-pj].

`pj` allows you to easily jump between your favourite directories in
a predictable manner. You tell `pj` where to look for your projects, and it will
allow you to jump to them easily with tab completion. It even provides
a convenient ability to open an editor in that directory from anywhere!

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.2.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>


## Install

```fish
$ omf install pj
```


## Configuration

In order to tell `pj` where to look for your projects, you need to set an
environment variable called `PROJECT_PATHS`. It is a list of directories which
contain your projects.

```fish
$ set -gx PROJECT_PATHS ~/workspace ~/src
```


## Usage

To jump to a project, simply run `pj` with the name of the directory you would
like to jump to.

```fish
$ pj foo-project
```

You can also open it in your favourite editor with the `pj open` command. This
will open the project with the `$EDITOR` configured on your system.

```fish
$ pj open foo-project
```

Print work directory of project.

```fish
$ pj pwd foo-project

# abbr example: Execute project scripts anywhere
$ abbr foo 'pushd (pj pwd foo-project)/path/to/script; foo-command; popd'
```

Protip: You can set an abbrebiation in your shell for the above, like `pjo`.

```fish
$ abbr -a pjo pj open
$ pjo<space>
# Becomes
$ pj open
```


# License

[MIT][mit] © [Espen Henriksen][author] et [al][contributors]


[jdp-pj]:         https://gist.github.com/pjaspers/368394#gistcomment-1016
[omz-pj]:         https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/pj

[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/esphen
[contributors]:   https://github.com/esphen/plugin-pj/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
