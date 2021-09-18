;; depress cl deprecated warning
(setq byte-compile-warnings '(cl-functions))
;; ---------- Common Lisp Extension ----------
(require 'cl)
;; ---------- repl environment for commen lisp ----------
(use-package slime)
;; ---------- use sbcl to compile lisp ----------
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/usr/local/bin/sbcl")

(provide 'lisp-env-init)
