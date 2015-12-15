# Swift Version Manager

swiftenv allows you to easily install, and switch between multiple versions of Swift.

This project was heavily inspired by [pyenv](https://github.com/yyuu/pyenv).

swiftenv allows you to:

- Change the **global Swift version**, per user.
- Set a **per-project Swift version**.
- Allows you to **override the Swift version** with an environmental variable.

## Installation

1. Check out swiftenv, we recommend `~/.swiftenv` (but it can be installed elsewhere as long as you set SWIFTENV_ROOT).

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
    $ echo 'setenv SWIFTENV_ROOT "$HOME/.swiftenv"' >> ~/.config/fish/config.fish
    $ echo 'setenv PATH "$SWIFTENV_ROOT/bin" $PATH' >> ~/.config/fish/config.fish
    $ echo 'status --is-interactive; and . (swiftenv init -|psub)' >> ~/.config/fish/config.fish
    ```

