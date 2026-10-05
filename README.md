# keycd
A simple command line tool to quickly switch between directories.

# Getting Started
## Installation
### Using Mint

```zsh
mint install akino777/keycd  
```

### Using Homebrew
```zsh
brew tap akino777/keycd
```
```zsh
brew install keycd
```

### Setup
Since you need to run a command from a shell script, enter the following settings.

#### In the case of
```zsh
function kcd() {
    # Options (-s, -d, -l, -h) and no arguments only print something
    if [[ $# -eq 0 || "$1" == -* ]]; then
        keycd "$@"
        return
    fi

    # keycd prints the destination path, so move there
    local dir
    dir=$(keycd "$@") && cd "$dir"
}
```

## Usage
### switch to a directory
```zsh
kcd {key}
```

### Save current directory as
```zsh
kcd -s {key}
```

### List all saved directories
```zsh
kcd -l
```

### Remove a saved directory
```zsh
kcd -d {key}
```
