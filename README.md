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
    result=$(keycd "$@")

    # Check if the result is a valid command
    if ! eval "$result" 2>/dev/null; then
        keycd "$@"
    fi
}`
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
