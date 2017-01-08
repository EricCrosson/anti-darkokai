# Anti Darkokai 🌑

An inverted dark variant of [sjrmanning's mokonai
interpretation](https://github.com/sjrmanning/darkokai).

## Screenshots

![darkokai-elixir-preview](/../screenshots/elixir-example.png)
![darkokai-elisp-preview](/../screenshots/elisp-example.png)
![darkokai-android-preview](/../screenshots/android-example.png)

## Installation

#### MELPA (`package.el`)

Anti-Darkokai has been merged into [MELPA](http://melpa.org) and
should appear in your `package-list-packages` pretty soon. You can
install it with `M-x package-install anti-darkokai-theme`, and load it
on startup by placing this in your init file:

```elisp
(load-theme 'anti-darkokai t)
```

#### [`use-package`](https://github.com/jwiegley/use-package)

With MELPA configured in your `package-archives`:

```elisp
(use-package anti-darkokai-theme
  :ensure t
  :config (load-theme 'anti-darkokai t))
```

#### Manual

Place `anti-darkokai-theme.el` in your `custom-theme-load-path` and
load on init. For example:

```elisp
(add-to-list 'custom-theme-load-path "~/.emacs.d/etc/themes")
(load-theme 'anti-darkokai t)
```

## Notes

To disable the padded mode-line and use the normal mode-line look:

```elisp
(setq anti-darkokai-mode-line-padding 1) ;; Default mode-line box width
(load-theme 'anti-darkokai t)
```

Terminal support is there, but some of the base terminal colours still
need to be updated to match the GUI colours. If the colours look
particularly bad in terminal, make sure you’re using a 256 color term
by adding the following to your `.zshrc` or `.bashrc`:

```bash
export TERM=xterm-256color
```

## Additions and suggestions

Pull requests and suggestions for improvement are always welcome!

## Credits

The original color theme is the work of
[sjrmanning](https://github.com/sjrmanning/darkokai).
