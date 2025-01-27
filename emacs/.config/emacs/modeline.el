(defun my-modeline--major-mode-name ()
  "Return capitalized `major-mode' as a string."
  (format "%18s" (capitalize (replace-regexp-in-string "-mode" "" (symbol-name major-mode)))))

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
              (list '("%e" mode-line-front-space
                      (:propertize "[%*] " display (min-width ...))
                      mode-line-buffer-identification "   " mode-line-position
                      (vc-mode vc-mode))
                    "  "  mode-line-misc-info "  "
                    (mode-line-fill 20) my-modeline-major-mode))
