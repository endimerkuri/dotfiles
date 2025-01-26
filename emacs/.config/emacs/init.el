(load-file (expand-file-name "better-defaults.el" user-emacs-directory))
(load-file (expand-file-name "packages.el" user-emacs-directory))
(load-file (expand-file-name "nerd-icons-config.el" user-emacs-directory))
(load-file (expand-file-name "ui.el" user-emacs-directory))

(defun my-modeline--major-mode-name ()
  "Return capitalized `major-mode' as a string."
  (capitalize (symbol-name major-mode)))

(defvar-local my-modeline-major-mode
    '(:eval
      (propertize (my-modeline--major-mode-name) 'face 'bold))
  "Mode line construct to display the major mode.")

(put 'my-modeline-major-mode 'risky-local-variable t)

(defun mode-line-fill (reserve)
  "Return empty space using FACE and leaving RESERVE space on the right."
  (when
      (and window-system (eq 'right (get-scroll-bar-mode)))
    (setq reserve (- reserve 3)))
  (propertize " "
              'display
              `((space :align-to (- (+ right right-fringe right-margin) ,reserve)))))

(setq-default mode-line-format
              (list
               '("%e" mode-line-front-space
                 (:propertize
                  ("" mode-line-client mode-line-modified mode-line-remote)
                  display
                  (min-width ...))
                 mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position
                 (vc-mode vc-mode)
                 "  "  mode-line-misc-info "  ")
               (mode-line-fill 20) my-modeline-major-mode mode-line-end-spaces
               ))

(setq gc-cons-threshold (or bedrock--initial-gc-threshold 800000))
