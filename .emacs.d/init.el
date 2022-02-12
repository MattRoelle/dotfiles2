(require 'package)

;; Straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package
  '(nano-emacs :type git :host github :repo "rougier/nano-emacs"))

;; Nano
(require 'nano)

;; package.el 
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)


;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Clojure
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

;; Enable Evil
(require 'evil)
(evil-mode 1)

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Parinfer
(add-to-list 'load-path "~/.emacs.d/packages/parinfer-rust-mode")
(add-hook 'emacs-lisp-mode 'parinfer-rust-mode)
(add-hook 'fennel-mode 'parinfer-rust-mode)
(add-hook 'racket-mode 'parinfer-rust-mode)

;; Fennel
(autoload 'fennel-mode "fennel-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.fnl\\'" . fennel-mode))
(setq fennel-program "make -C /home/matt/s/ctrx repl")

;; Plugins 
(require 'monroe)
(require 'find-file-in-project)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(solarized-theme racket-mode evil)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
