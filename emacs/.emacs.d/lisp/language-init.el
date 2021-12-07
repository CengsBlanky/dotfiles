;; set c language indent
(add-hook 'c-mode-hook
	  (lambda ()
	    (setq c-basic-offset 4)
	    (setq tab-width 4)))

(provide 'language-init)
