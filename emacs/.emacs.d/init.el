;; =============================================================================
;; package initialize
;; =============================================================================
(require 'package)
;; add repository
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; auto install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
;; make sure packages are installed globally
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'editor-init)
(require 'ui-init)
(require 'org-init)
(require 'lisp-env-init)
(require 'doom-modeline-init)
