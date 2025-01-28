(load-file (expand-file-name "better-defaults.el" user-emacs-directory))
(load-file (expand-file-name "packages.el" user-emacs-directory))
(load-file (expand-file-name "nerd-icons-config.el" user-emacs-directory))
(load-file (expand-file-name "ui.el" user-emacs-directory))
(load-file (expand-file-name "modeline.el" user-emacs-directory))

(add-to-list 'auto-mode-alist '("\.[cm]js" . js-mode))

(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq gc-cons-threshold (or bedrock--initial-gc-threshold 800000))
