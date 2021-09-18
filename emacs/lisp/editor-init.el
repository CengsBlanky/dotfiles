;; =============================================================================
;; better default setting
;; =============================================================================
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

;; ---------- set env ----------
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell 
      (replace-regexp-in-string "[[:space:]\n]*$" "" 
        (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when (equal system-type 'darwin) (set-exec-path-from-shell-PATH))

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
  (evil-mode t))
;; ---------- enable relative line number ----------
(use-package linum-relative
  :config
  (linum-relative-on))
;; ---------- enable key-chord ----------
(use-package key-chord
  :config
  (key-chord-mode t)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

(provide 'editor-init)
