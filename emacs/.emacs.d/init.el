;; Ensure Emacs loads the most recent byte-compiled files.
(setq load-prefer-newer t)

;; Ensure JIT compilation is enabled for improved performance by
;; native-compiling loaded .elc files asynchronously
(setq native-comp-jit-compilation t)

;; Silence startup message
(setq inhibit-startup-echo-area-message (user-login-name))

;; Default frame configuration: full screen, good-looking title bar on macOS
(setq frame-resize-pixelwise t)
(setq default-frame-alist '((fullscreen . maximized)
                            ;; Setting the face in here prevents flashes of
                            ;; color as the theme gets activated
                            (background-color . "#000000")
                            (foreground-color . "#ffffff")
                            (ns-appearance . dark)
                            (ns-transparent-titlebar . t)))

(when (string= system-type "darwin")
  (setq mac-command-modifier 'meta)
  (setq dired-use-ls-dired nil))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(when (< emacs-major-version 29)
  (unless (package-installed-p 'use-package)
    (unless package-archive-contents
      (package-refresh-contents))
    (package-install 'use-package)))

(setq use-package-verbose t)
(setq use-package-always-ensure t)
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)
(set-default 'truncate-lines t)

(setopt line-number-mode t)                        ; Show current line in modeline
(setopt column-number-mode t)                      ; Show column as well

(defun my/set-font-faces ()
  (let ((mono-spaced-font "JetBrains Mono")
        (proportionately-spaced-font "JetBrains Mono"))
    (set-face-attribute 'default nil :family mono-spaced-font :height 180)
    (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
    (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0)))

(if (daemonp)
    (add-hook 'after-make-frame-functions
              (lambda (frame)
                (with-selected-frame frame
                  (my/set-font-faces))))
  (my/set-font-faces))
(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t)
(load-theme 'modus-vivendi t)

(use-package dired
  :ensure nil
  :hook
  ((dired-mode . dired-hide-details-mode)
   (dired-mode . hl-line-mode))
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (setq delete-by-moving-to-trash t)
  (setq dired-dwim-target t))

;; Display line numbers in programming mode
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(electric-pair-mode 1)

;; Nice line wrapping when working with text
(add-hook 'text-mode-hook 'visual-line-mode)

;; Modes to highlight the current line with
(let ((hl-line-hooks '(text-mode-hook prog-mode-hook)))
  (mapc (lambda (hook) (add-hook hook 'hl-line-mode)) hl-line-hooks))

(blink-cursor-mode -1)
(pixel-scroll-precision-mode)

(recentf-mode t)
(setq inhibit-startup-message t)

(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode -1))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(save-place-mode 1)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)

(savehist-mode 1)
(unless backup-directory-alist
  (setq backup-directory-alist `(("." . ,(concat user-emacs-directory
                                                 "backups")))))

;; auto-save files directory
(make-directory (expand-file-name "tmp/auto-saves/" user-emacs-directory) t)
(setq auto-save-list-file-prefix (expand-file-name "tmp/auto-saves/sessions/" user-emacs-directory)
      auto-save-file-name-transforms `((".*" ,(expand-file-name "tmp/auto-saves" user-emacs-directory) t)))

(use-package delsel
  :ensure nil ; no need to install it as it is built-in
  :hook (after-init . delete-selection-mode))

(setq treesit-font-lock-level 4)
(setq x-stretch-cursor t)
(global-set-key (kbd "M-o") 'other-window)

(add-to-list 'auto-mode-alist '("\\.php" . php-ts-mode))
(add-to-list 'auto-mode-alist '("\\.[cm]js" . js-ts-mode))
(add-to-list 'auto-mode-alist '("\\.ts" . typescript-ts-mode))
(add-to-list 'auto-mode-alist '("\\.tsx" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jsx" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.cs" . csharp-ts-mode))
(add-to-list 'auto-mode-alist '("\\.go" . go-ts-mode))

(use-package vertico
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package marginalia
  :init
  (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-category-defaults nil)
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

(use-package corfu
  ;; Optional customizations
  :custom
  (tab-always-indent 'complete)
  (corfu-cycle t)                   ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match 'insert) ;; Configure handling of exact matches

  ;; Enable Corfu only for certain modes. See also `global-corfu-modes'.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  :init

  ;; Recommended: Enable Corfu globally.  Recommended since many modes provide
  ;; Capfs and Dabbrev can be used globally (M-/).  See also the customization
  ;; variable `global-corfu-modes' to exclude certain modes.
  (global-corfu-mode)

  ;; Enable optional extension modes:
  ;; (corfu-history-mode)
  ;; (corfu-popupinfo-mode)
  )

(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)
  :custom
  (persp-mode-prefix-key (kbd "C-z"))
  :init
  (persp-mode))

(use-package agent-shell)

(use-package projectile
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

(use-package persp-projectile)
(use-package magit)

(use-package gptel)

(setq gptel-model   'mistral-medium
      gptel-backend
      (gptel-make-openai "MistralLeChat"
        :host "api.mistral.ai"
        :endpoint "/v1/chat/completions"
        :protocol "https"
        :key gptel-api-key
        :models '("mistral-medium")))

(use-package vterm
  :ensure t
  :config
  ;; Speed up vterm
  (setq vterm-timer-delay 0.01))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
               '((php-ts-mode :language-id "php") . ("intelephense" "--stdio"))))

(add-hook 'js-mode-hook #'eglot-ensure)
(add-hook 'js-ts-mode-hook #'eglot-ensure)
(add-hook 'go-mode-hook #'eglot-ensure)
(add-hook 'go-ts-mode-hook #'eglot-ensure)
(add-hook 'python-mode-hook #'eglot-ensure)
(add-hook 'python-ts-mode-hook #'eglot-ensure)
(add-hook 'php-ts-mode-hook #'eglot-ensure)
(add-hook 'csharp-ts-mode-hook #'eglot-ensure)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))
