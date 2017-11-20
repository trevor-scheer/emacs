;; ==========================================
;; Package init
;; ==========================================
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(
  js2-mode
  rjsx-mode
  php-mode
  prettier-js
  ido-vertical-mode
  )) 

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;(require 'js2-mode)
;(require 'rjsx-mode)
(require 'prettier-js)


;; ==========================================
;; Default file modes
;; ==========================================
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; ==========================================
;; RJSX mode + hooks
;; ==========================================
;; Uncomment below for prettier all the time
;(add-hook 'rjsx-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode-hook 'electric-pair-mode)
(add-hook 'rjsx-mode-hook 'auto-complete-mode)
(add-hook 'rjsx-mode-hook
  (lambda () (local-set-key (kbd "C-x p") 'prettier-js)))

;; ==========================================
;; IDO mode + hooks
;; ==========================================
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "C-x b") 'ido-switch-buffer)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode)
(ido-vertical-mode t)

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


