;; set init window size 
(if (display-graphic-p)
    (progn
	(setq default-frame-alist
            '(
		(tool-bar-lines . 0)
		;; guarantee each line has exact 80 chars
		(width . 83)
		; lines
		(height . 36) 
		(left . 720)
		(top . 12))) 
    )
)

;; ---------- font & size ----------
(when (eq system-type 'darwin)
    (when (member "Monaco" (font-family-list))
    (set-frame-font "Monaco-15" t t))
)
;; ---------- editor apearance ----------
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-linum-mode t)
(column-number-mode t)
(setq inhibit-startup-screen t)
;; ---------- highlight paired bracket ----------
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; ---------- highlight current line ----------
(global-hl-line-mode t)
;; ---------- doom themes settings ----------
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one-light t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
;; ---------- mode line ----------
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(provide 'ui-init)
