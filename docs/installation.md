# Installation

**NOTE**: If you're on macOS, consider [installing with Homebrew](#via-homebrew).

### Via a Git clone

1. Check out swiftenv, we recommend `~/.swiftenv` (but it can be installed elsewhere as long as you set `SWIFTENV_ROOT`).

    ```shell
    $ git clone https://github.com/kylef/swiftenv.git ~/.swiftenv
    ```

2. Configure environment.

    For Bash:

    ```shell
    $ echo 'export SWIFTENV_ROOT="$HOME/.swiftenv"' >> ~/.bash_profile
    $ echo 'export PATH="$SWIFTENV_ROOT/bin:$PATH"' >> ~/.bash_profile
    $ echo 'eval "$(swiftenv init -)"' >> ~/.bash_profile
    ```

    **NOTE**: *On some platforms, you may need to modify `~/.bashrc` instead of `~/.bash_profile`.*

    For ZSH:

    ```shell
    $ echo 'export SWIFTENV_ROOT="$HOME/.swiftenv"' >> ~/.zshenv
    $ echo 'export PATH="$SWIFTENV_ROOT/bin:$PATH"' >> ~/.zshenv
    $ echo 'eval "$(swiftenv init -)"' >> ~/.zshenv
    ```

    For Fish:

    ```shell
    $ echo 'set -gx SWIFTENV_ROOT "$HOME/.swiftenv"' >> ~/.config/fish/config.fish
    $ echo 'set -gx PATH "$SWIFTENV_ROOT/bin" $PATH' >> ~/.config/fish/config.fish
    $ echo 'if which swiftenv > /dev/null; status --is-interactive; and source (swiftenv init -|psub); end' >> ~/.config/fish/config.fish
    ```

    For other shells, please [open an issue](https://github.com/kylef/swiftenv/issues/new) and we will visit adding support.

3. Restart your shell so the changes take effect.

## Via Homebrew

You can install swiftenv using the [Homebrew](http://brew.sh/) package manager
on macOS.

1. Install swiftenv

    ```shell
    $ brew install kylef/formulae/swiftenv
    ```

2. Then configure the shims and completions by adding the following to your profile.

    For Bash:

    ```shell
    $ echo 'if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi' >> ~/.bash_profile
    ```

    **NOTE**: *On some platforms, you may need to modify `~/.bashrc` instead of `~/.bash_profile`.*

    For ZSH:

    ```shell
    $ echo 'if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi' >> ~/.zshrc
    ```

    For Fish:

    ```shell
    $ echo 'if which swiftenv > /dev/null; status --is-interactive; and source (swiftenv init -|psub); end' >> ~/.config/fish/config.fish
    ```

## Uninstalling swiftenv

1. Remove swiftenv from any `.bash_profile`, `.bashrc`, `.zshrc`, `fish.config` that you've added during installation.

2. Remove `SWIFTENV_ROOT` aka, `~/.swiftenv`.

    ```shell
    $ rm -fr ~/.swiftenv
    ```

3. Uninstall any swiftenv packages (brew uninstall, pacman, etc).
