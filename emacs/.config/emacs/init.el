(setq inhibit-startup-message t
      visible-bell nil)

(global-display-line-numbers-mode 1)

(recentf-mode 1)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq modus-themes-mode-line '(accented borderless 4))
(load-theme 'modus-vivendi t)

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
