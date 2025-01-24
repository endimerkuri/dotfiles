(let ((mono-spaced-font "Iosevka")
      (proportionately-spaced-font "Iosevka"))
  (set-face-attribute 'default nil :family mono-spaced-font :height 120)
  (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.0)
  (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.0))

(setq modus-themes-italic-constructs t
      modus-themes-bold-constructs t)
(setq modus-themes-region '(bg-only no-extend))
(setq modus-themes-headings
      '((1 . (rainbow overline background 1.4))
        (2 . (rainbow background 1.3))
        (3 . (rainbow bold 1.2))
        (t . (semilight 1.1))))

(setq modus-themes-scale-headings t)
(setq modus-themes-org-blocks 'tinted-background)

(setq modus-themes-mode-line '(accented borderless 4))
(load-theme 'modus-vivendi t)
