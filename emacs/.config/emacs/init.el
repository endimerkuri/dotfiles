(load-file (expand-file-name "better-defaults.el" user-emacs-directory))
(load-file (expand-file-name "packages.el" user-emacs-directory))
(load-file (expand-file-name "nerd-icons-config.el" user-emacs-directory))
(load-file (expand-file-name "ui.el" user-emacs-directory))

(setq gc-cons-threshold (or bedrock--initial-gc-threshold 800000))
