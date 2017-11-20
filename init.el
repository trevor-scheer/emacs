;; ==========================================
;; Package init
;; ==========================================
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(
  auto-complete
  js2-mode
  rjsx-mode
  prettier-js
  fiplr)) 

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;(require 'js2-mode)
;(require 'rjsx-mode)
(require 'prettier-js)
;(require 'fiplr)

;; ==========================================
;; Mode settings + hooks
;; ==========================================
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
;(add-hook 'rjsx-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode-hook 'electric-pair-mode)
(add-hook 'rjsx-mode-hook 'auto-complete-mode)
(add-hook 'rjsx-mode-hook
  (lambda () (local-set-key (kbd "C-x p") 'prettier-js)))

;; ==========================================
;; Key bindings
;; ==========================================
(global-set-key (kbd "C-x f") 'fiplr-find-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (package-list))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
