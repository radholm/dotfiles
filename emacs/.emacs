(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))

(setq user-full-name "Fredrik Radholm")
(setq inhibit-startup-message t)
(setq electric-pair-mode t)
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(0.07))
(setq mouse-wheel-tilt-scroll t)
(setq find-file-visit-truename t)
(setq backup-directory-alist `(("." . "~/.emacs.d/backup-list")))
(set-frame-parameter nil 'alpha '(95 95))
;;(setq visible-bell t)
(global-display-line-numbers-mode t)
;;(setq display-line-numbers-type 'relative)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(load-theme 'doom-palenight t)
(set-face-attribute 'default nil :font "iosevka extended-14")
(show-paren-mode t)
(setq show-paren-delay 0)

(use-package doom-modeline :ensure t :init (doom-modeline-mode 1))
(setq doom-modeline-height 1)
(setq doom-modeline-icon nil)
(use-package all-the-icons :ensure t)
(use-package lsp-ui :ensure t)
(use-package company :ensure t :init (company-mode 1))
(setq company-minimum-prefix-length 1 company-idle-delay 0.0)
(use-package hydra :ensure t)
(use-package json-mode :ensure t)
(use-package typescript-mode :ensure t)
(use-package dash :ensure t)
(use-package evil-mc :ensure t)
(use-package gcmh :config (gcmh-mode 1))
(setq gc-cons-threshold (* 100 1024 1024))
(use-package magit :ensure t)
(add-hook 'after-save-hook 'magit-after-save-refresh-status t)
(global-evil-mc-mode 1)
(setq evil-mc-mode-line-text-inverse-colors t)
(desktop-save-mode 1)
(add-hook 'kill-emacs-hook (lambda () (desktop-save-in-desktop-dir)))

(global-set-key (kbd "C-<backspace>") 'custom/backward-kill-word)
(use-package smart-hungry-delete
  :ensure t
  :bind (([remap backward-delete-char-untabify] . smart-hungry-delete-backward-char)
	       ([remap delete-backward-char] . smart-hungry-delete-backward-char)
	       ([remap delete-char] . smart-hungry-delete-forward-char))
  :init (smart-hungry-delete-add-default-hooks))

(use-package scroll-on-jump
  :config
  (setq scroll-on-jump-duration 0.4)
  (setq scroll-on-jump-curve-power 2))

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-virtual-abbreviate 'full)
  (setq ivy-sort-functions-alist
	'((read-file-name-internal . nil)
	  (t . ivy-sort-function-buffer)))
  (ivy-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init)
  (evil-collection-init 'magit))

(use-package evil-leader
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (evil-set-leader 'normal (kbd "SPC"))
  (global-evil-leader-mode))

(use-package evil-commentary
  :after evil
  :ensure t
  :config
  (evil-commentary-mode))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-undo-system 'undo-fu)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  :config
  (evil-commentary-mode)
  (evil-mode 1))

(use-package undo-fu
  :config
  (evil-set-undo-system 'undo-redo)
  (add-hook 'magit-mode-hook 'evil-local-mode))

(with-eval-after-load 'evil
  (scroll-on-jump-advice-add evil-undo)
  (scroll-on-jump-advice-add evil-redo)
  (scroll-on-jump-advice-add evil-jump-item)
  (scroll-on-jump-advice-add evil-jump-forward)
  (scroll-on-jump-advice-add evil-jump-backward)
  (scroll-on-jump-advice-add evil-search-next)
  (scroll-on-jump-advice-add evil-search-previous)
  (scroll-on-jump-advice-add evil-forward-paragraph)
  (scroll-on-jump-advice-add evil-backward-paragraph)
  (scroll-on-jump-advice-add evil-goto-mark)
  (scroll-on-jump-with-scroll-advice-add evil-goto-line)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-down)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-up)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-line-to-center)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-line-to-top)
  (scroll-on-jump-with-scroll-advice-add evil-scroll-line-to-bottom))

(use-package smex
  :ensure t
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands))

(use-package which-key
  :ensure t
  :config
  (setq which-key-idle-delay 0.5)
  (which-key-mode))

(use-package counsel
  :ensure t
  :config)

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-diagnostic-filter-regexp "Could not find a declaration file for module")
  (setq lsp-headerline-breadcrumb-enable nil))
(with-eval-after-load 'lsp-mode
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-eslint-enable t)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
(add-hook 'js-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'lsp)

(use-package rustic)
(use-package tree-sitter-langs :ensure t)
(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
(add-hook 'rust-mode-hook #'tree-sitter-mode)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode 0)
  :config
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'js-mode)
  (flycheck-add-mode 'javascript-eslint 'typescript-mode)
  (flycheck-add-mode 'javascript-eslint 'typescript-tsx-mode))

(use-package projectile
  :ensure t
  :config
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (setq projectile-per-project-compilation-buffer t)
  (setq ivy-sort-matches-functions-alist
	'((projectile-switch-project . ivy-prefix-sort)
	  (projectile-find-file . ivy-prefix-sort)))
  (projectile-mode))
(projectile-register-project-type 'npm '("package.json")
                                  :project-file "package.json"
				  :compile "npm install"
				  :test "npm run test"
				  :run "nrd"
				  :test-suffix ".spec")
(projectile-register-project-type 'rust '("Cargo.toml")
                                  :project-file "Cargo.toml"
				  :compile "cargo build"
				  :run "cargo run")

;; ORG MODE

(setq
 org-startup-indented t
 org-indent-mode t
 org-auto-align-tags nil
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-ellipsis "…"
 org-agenda-tags-column t
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "⭠ now ─────────────────────────────────────────────────")

(global-org-modern-mode)
(defun my-org-faces ()
    (set-face-attribute 'org-level-1 nil :height 150))
(add-hook 'org-mode-hook #'my-org-faces)

;; FUNCTIONS

(defun config-reload ()
  "Reloads the .emacs file."
  (interactive)
  (let ((init-file (if (eq system-type 'windows-nt)
		       "~/.emacs.d/init.el"
                     "~/.emacs")))
    (load-file init-file)))

(defun config-edit ()
  "Find the init.el file."
  (interactive)
  (if (eq system-type 'windows-nt)
      (find-file "$HOME/.emacs.d/init.el")
    (find-file "~/.emacs")))

(defun meta-csw-grep ()
  "Grep meta-csw dir."
  (interactive)
  (let ((default-directory "~/.dev/lf/meta-csw/"))
    (call-interactively 'rgrep)))

(defun kill-compilation-buffer ()
  "Kill the `*compilation*' buffer if it exists."
  (interactive)
  (when (get-buffer "*compilation*")
    (kill-buffer "*compilation*")))

(defun repeat-recent-shell-command ()
  "Repeats the most recent shell-command."
  (interactive)
  (shell-command (car-safe shell-command-history)))

(defun custom/backward-kill-word ()
  (interactive)
  (if (looking-back "[ \n]")
      (progn (delete-horizontal-space 't)
             (while (looking-back "[ \n]")
               (backward-delete-char 1)))
    (backward-kill-word 1)))

;; KEYBINDINGS

;; (which-key-add-prefix-title-based-replacements "+" "")
;; (which-key-add-key-based-replacements "<leader>c" "Config")
;; (which-key-replace-alist '((("<leader>b") . "Buffers")))
;; (which-key-add-key-based-replacements "<leader>b" "Buffers")
(evil-define-key 'normal 'global (kbd "<leader>cr") 'config-reload)
(evil-define-key 'normal 'global (kbd "<leader>ce") 'config-edit)
(evil-define-key 'normal 'global (kbd "<leader><SPC>") 'counsel-switch-buffer)
(evil-define-key 'normal 'global (kbd "<leader>bk") 'projectile-kill-buffers)
(evil-define-key 'normal 'global (kbd "<leader>pp") 'projectile-switch-project)
(setq projectile-switch-project-action 'projectile-commander)
(evil-define-key 'normal 'global (kbd "<leader>pf") 'projectile-find-file)
(evil-define-key 'normal 'global (kbd "<leader>pm") 'projectile-command-map)
(evil-define-key 'normal 'global (kbd "<leader>pc") 'projectile-compile-project)
(evil-define-key 'normal 'global (kbd "<leader>pr") 'projectile-run-project)
(evil-define-key 'normal 'global (kbd "<leader>pk") 'kill-compilation-buffer)
(evil-define-key 'normal 'global (kbd "<leader>sr") 'repeat-recent-shell-command)
(evil-define-key 'normal 'global (kbd "<leader>d") 'dired)
(evil-define-key 'normal 'global (kbd "<leader>m") 'magit)
(evil-define-key 'normal 'global (kbd "<leader>t") 'counsel-load-theme)
(evil-define-key 'normal 'global (kbd "<leader>X") 'previous-error)
(evil-define-key 'normal 'global (kbd "<leader>x") 'next-error)
(evil-define-key 'visual 'global (kbd "gq") 'indent-region)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bddf21b7face8adffc42c32a8223c3cc83b5c1bbd4ce49a5743ce528ca4da2b6" default))
 '(package-selected-packages
   '(smart-hungry-delete rustic tree-sitter-langs gcmh doom-themes org-modern all-the-icons doom-modeline magit redo-fu scroll-on-jump gruber-darker evil-commentary evil-leader neotree ido-vertical-mode ivy json-mode hydra typescript-mode lsp-ui smex use-package undo-fu)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(line-number ((t (:inherit default :foreground "#676E95" :slant normal))))
 '(line-number-current-line ((t (:weight bold :inherit default :slant normal)))))
