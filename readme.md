### Requirements

```sh
$ brew install 1password 1password-cli chezmoi gh git

# Launch 1Password, log in, and enable Intergration with the CLI
# ...

# Log in to GitHub
$ gh auth login
$ gh auth setup-git

# Now we're ready to get the dotfiles
$ chezmoi init --apply cprecioso

# Done!
```
