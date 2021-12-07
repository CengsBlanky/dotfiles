;; better default setting
;; =============================================================================

;; ---------- editor apearance ----------
(add-to-list 'default-frame-alist '(width . 90))
(add-to-list 'default-frame-alist '(height . 36))
(menu-bar-mode 0)
(tool-bar-mode 0)
(column-number-mode t)
;; (setq inhibit-startup-screen t)
;; ---------- highlight paired bracket ----------
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; ---------- highlight current line ----------
(global-hl-line-mode t)
;; auto complete bracket
(electric-pair-mode t)
;; auto refresh buffer
(global-auto-revert-mode t)
;; show line number
(global-display-line-numbers-mode 1)
;; display relative line number
(setq display-line-numbers-type 'relative)
;; close scroll bar in graphic interface
(when (display-graphic-p) (toggle-scroll-bar -1))
;; ---------- diable generate backup file ----------
(setq make-backup-files nil)
;; ---------- disable session files ----------
(setq auto-save-list-file-prefix nil)
;; ---------- when mark region exists, type will replace it ----------
(delete-selection-mode t)
;; ---------- enable scroll left ----------
(put 'scroll-left 'disabled nil)
;; ---------- enable narrow region ----------
(put 'narrow-to-region 'disabled nil)
;; ---------- use command key as meta key in mac ----------
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'alt))

;; =============================================================================
;; global keybindings
;; =============================================================================

;; ---------- set <F2> as quick key to open my init file ----------
(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)
;; ---------- go begining of the brace or end of brace ----------
(global-set-key [(meta left)] 'backward-sexp)
(global-set-key [(meta right)] 'forward-sexp)
;; ---------- M-g to go specfic line ----------
(global-set-key [(meta g)] 'goto-line)

;; ---------- font & size ----------
(when (member "Monaco" (font-family-list))
(set-frame-font "Monaco-17" t t))

;; =============================================================================
;; globally enabled packages
;; =============================================================================
;; ---------- auto complete package ----------
(use-package company
  :config
  (global-company-mode t))
;; ---------- enable evil mode(vim-like mode) ----------
(use-package evil
  :config
  (evil-mode t)
  (define-key evil-insert-state-map (kbd "jk") 'evil-normal-state)
  (define-key evil-normal-state-map (kbd "RET") 'save-buffer)
  (define-key evil-normal-state-map (kbd "SPC") 'scroll-up-command)
  (define-key evil-normal-state-map (kbd "DEL") 'scroll-down-command)
  (define-key evil-normal-state-map (kbd "TAB") 'next-buffer)
  (define-key evil-normal-state-map (kbd "M-b") 'kill-buffer)
  )
;; ---------- markdown mode ----------
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
;; ---------- doom theme ----------
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic nil) ; if nil, italics is universally disabled
  (load-theme 'doom-one-light t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; or for treemacs users
  ;; (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  ;; (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


(provide 'editor-init)
