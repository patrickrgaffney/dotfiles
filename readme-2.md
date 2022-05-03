# Init

- Install [`homebrew`](https://brew.sh):

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- `homebrew` will install the dev-tools for macos.
- We will also need to install [Rosetta](https://developer.apple.com/documentation/apple-silicon/about-the-rosetta-translation-environment) in order to run Intel based crap on Apple Silicon:

```sh
sudo softwareupdate --install-rosetta
```

- Install `homebrew` casks:

```sh
brew install --cask appcleaner
brew install --cask firefox
brew install --cask iterm2
brew install --cask sublime-text
# Disabled because it does not support Apple Silicon
# brew install --cask dbvisualizer
brew install --cask expressions
# Disabled because it's on v1.x still.
# brew install --cask postico
brew install --cask slack
brew install --cask soulver
brew install --cask rectangle
brew install --cask tableplus
```

- Install `homebrew` packages:

```sh
brew install bash
brew install kubectl
brew install gpg
brew install pass
brew install go
brew install node
brew install azure-cli
brew install bash-completion@2
brew install git
brew install jq
brew install kustomize
brew install openjdk
brew install kotlin
brew install postgresql
brew install shellcheck
brew install staticcheck
brew install terraform
```

- Set up OpenJDK as the system Java wrapper:

```sh
sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
```

- Clone the [dotfiles](https://github.com/patrickrgaffney/dotfiles):

```sh
git clone git@github.com:patrickrgaffney/dotfiles.git
```

- Symlink all the dotfiles:

```sh
./dotfiles.sh
```

- Add the new `bash` (from `homebrew` - v5) to the list of approved shells:

```sh
echo "/opt/homebrew/bin/bash" >> /etc/shells
```

- Change the default shell to `bash`:

```sh
chsh -s /opt/homebrew/bin/bash
```

- Move SSH keys over. Typically I move the entire `$HOME/.ssh` folder, then `rm known_hosts`.
- Move GPG keys over:

```sh
# Old machine: grap the ID of the key(s):
gpg --list-secret-keys user@example.com

# Old machine: export key(s):
gpg --export-secret-keys "$ID" > private.key

# New machine: import key(s):
gpg --import private.key
```

- Clone `pass` repository.

```sh
# Initialize password store.
pass init "$GPG_ID"

# Initialize empty git repo.
pass git init

# Close existing pass repo.
pass git clone "$PASS_GIT_URL"
```
