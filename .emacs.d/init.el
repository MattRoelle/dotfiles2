(add-to-list 'load-path "~/.emacs.d/lisp")

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)


;; Exec path from shell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; Parinfer
(add-to-list 'load-path "~/.emacs.d/packages/parinfer-rust-mode")
(require 'parinfer-rust-mode)

;; Fennel Mode
(autoload 'fennel-mode "~/.emacs.d/packages/fennel-mode/fennel-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.fnl\\'" . fennel-mode))

(require 'eval-pulse)

(defun my-lisp-hook ()
  (eval-pulse-mode)
  (parinfer-rust-mode 1))

(add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)
(add-hook 'fennel-mode-hook 'my-lisp-hook)

;; Org mode
(defun my-org-mode ()
  (org-bullets-mode))
(add-hook 'org-mode-hook 'my-org-mode)
(setq org-agenda-files (list "~/org/life.org"))
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-roam-directory (file-truename "~/org-roam"))
(org-roam-db-autosync-mode)

;; Copilot
(require 'copilot)

;; rg
(rg-enable-menu)

;; keybindings
(global-set-key (kbd "C-s-c C-s-c") 'copilot-complete)
(global-set-key (kbd "C-s-c C-s-a") 'copilot-accept-completion)
(global-set-key (kbd "C-s-c C-s-l") 'copilot-accept-completion-by-line)
(global-set-key (kbd "C-s-c C-s-n") 'copilot-next-completion)
(global-set-key (kbd "C-s-c C-s-p") 'copilot-previous-completion)
(global-set-key (kbd "C-s-c C-s-x") 'copilot-clear-overlay)
(global-set-key (kbd "C-s-w C-s-u") 'winner-undo)
(global-set-key (kbd "C-s-w C-s-r") 'winner-redo)
(global-set-key (kbd "C-s-p C-s-p") 'plantuml-preview)
(global-set-key (kbd "C-s-f") 'fzf)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c C-r") 'eval-region)
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "s-.") 'tide-jump-to-definition)
(global-set-key (kbd "s-,") 'tide-jump-to-implementation)
(global-set-key (kbd "C-c C-t") 'treemacs)

(winner-mode 1)
(counsel-mode 1)
(ivy-mode 1)
(global-hl-line-mode)
(global-visual-line-mode)

;; fuzzy matching in counsel/ivy
(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))


(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)


(which-key-mode 1)

(load-theme 'leuven)

(setq default-frame-alist
      (append (list
	       '(min-height . 1)
	       '(height     . 45)
	       '(min-width  . 1)
	       '(width      . 81)
	       '(vertical-scroll-bars . nil)
	       '(internal-border-width . 24)
	       '(left-fringe    . 1)
	       '(right-fringe   . 1)
	       '(tool-bar-lines . 0)
	       '(menu-bar-lines . 0))))

;; Typescript + web development
(require 'web-mode)
(require 'prettier-js)

(defun setup-tide-mode ()
  (interactive)
  (setq tide-format-options '(:indentSize 2 :tabSize 2 :baseIndentSize 2))
  (setq c-basic-offset 2)
  (setq typescript-indent-level 2)
  (tide-setup)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (flycheck-mode +1)
  (eldoc-mode +1)
  (prettier-js-mode +1)
  (tide-hl-identifier-mode +1)
  (setq-default indent-tabs-mode nil))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
	  (lambda ()
	    (when (string-equal "tsx" (file-name-extension buffer-file-name))
	      (setup-tide-mode))))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("de1f10725856538a8c373b3a314d41b450b8eba21d653c4a4498d52bb801ecd2" "69ad4071c7b2d91543fddd9030816404ff22e46f7207549319ce484e23082dee" default))
 '(package-selected-packages
   '(flx org-roam slack wanderlust evil-mu4e org-bullets plantuml-mode dap-mode wsd-mode rg editorconfig brutalist-theme treemacs-evil treemacs web-mode tide company js2-mode auto-complete which-key exec-path-from-shell counsel marginalia swiper ivy htmlize evil)))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :extend nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 220 :width normal :foundry "nil" :family "BigBlue_TerminalPlus NF")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
