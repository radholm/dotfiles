;;; package --- summary
;;; Commentary:
;;; Code:
(setq user-full-name "Fredrik Radholm")

(setq visible-bell t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq-default truncate-lines t)
(setq-default indent-tabs-mode nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(set-face-attribute 'default nil :font "iosevka-14" :weight 'medium)

(add-hook 'js-mode-hook #'lsp)
(global-set-key (kbd "C-c p") 'projectile-find-file)

(show-paren-mode t)
(setq show-paren-delay 0)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil)
(setq-default smooth-scroll-margin 0)
(setq scroll-step 1
      scroll-margin 1
      scroll-conservatively 100000)

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

(use-package lsp-ui :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'js-mode)
  (flycheck-add-mode 'javascript-eslint 'typescript-mode)
  (flycheck-add-mode 'javascript-eslint 'typescript-tsx-mode))

(use-package company :ensure t)

(use-package hydra :ensure t)

(use-package json-mode :ensure t)

(use-package typescript-mode :ensure t)

(use-package dash :ensure t)

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

(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))
(use-package undo-fu)

(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package evil-leader
  :ensure t)
(require 'evil-leader)
(evil-set-leader 'normal (kbd "SPC"))
(with-eval-after-load 'evil-maps
  (define-key evil-insert-state-map (kbd "SPC") nil))

(use-package smex
  :ensure t
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands))

(use-package which-key
  :ensure t
  :config
  (setq which-key-idle-delay 0.3)
  (which-key-mode))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :config
  (add-hook 'after-save-hook 'magit-after-save-refresh-status))

(use-package lsp-mode
  :ensure t
  :config
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package neotree
  :ensure t
  :config
  ;;(doom-themes-neotree-enable-file-icons)
  (global-set-key [f8] 'neotree-toggle))

(with-eval-after-load 'lsp-mode
  ;; (require 'dap-chrome)
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-eslint-enable t)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  ;; (yas-global-mode)
  )

;;(use-package ido-vertical-mode
;;  :ensure t
;;  :init
;;  (require 'ido)
;; (ido-mode t)
;;  (setq ido-enable-prefix nil
;;        ido-enable-flex-matching t
;;        ido-case-fold nil
;;        ido-auto-merge-work-directories-length -1
;;        ido-create-new-buffer 'always
;;        ido-use-filename-at-point nil
;;        ido-max-prospects 10)
;;  (require 'ido-vertical-mode)
;;  (ido-vertical-mode)
;;  (require 'dash)
;;  (defun my/ido-go-straight-home ()
;;    (interactive)
;;    (Cond
;;     ((looking-back "~/") (insert ".dev/lf/"))
;;     ((looking-back "/") (insert "~/"))
;;     (:else (call-interactively 'self-insert-command))))
;;  (defun my/setup-ido ()
;;    ;; Go straight home
;;    (define-key ido-file-completion-map (kbd "~") 'my/ido-go-straight-home)
;;    (define-key ido-file-completion-map (kbd "C-~") 'my/ido-go-straight-home))
;;  (add-hook 'ido-setup-hook 'my/setup-ido)
;;  (add-to-list 'ido-ignore-directories "node_modules"))
(with-eval-after-load 'js (define-key js-mode-map (kbd "M-.") nil))

(use-package projectile
  :ensure t :config (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (setq ivy-sort-matches-functions-alist
	'((projectile-switch-project . ivy-prefix-sort)
	  (projectile-find-file . ivy-prefix-sort)))
  (projectile-mode))

(use-package anti-zenburn-theme
  :ensure t
  :config
  (load-theme 'anti-zenburn t))

(use-package desktop
  :ensure t
  :config
  (desktop-save-mode 1))

;; Functions

(defun config-reload ()
  "Reloads the init.el file."
  (interactive)
  (let ((init-file (if (eq system-type 'windows-nt)
		       "~/.emacs.d/init.el"
		     "~/.config/emacs/init.el")))
    (load-file init-file)))

(defun config-edit ()
  "Find the init.el file."
  (interactive)
  (if (eq system-type 'windows-nt)
      (find-file "$HOME/.emacs.d/init.el")
    (find-file "~/.config/emacs/init.el")))

(defun select-theme ()
  "Select a theme using Ivy."
  (interactive)
  (let ((buf (get-buffer-create "*Themes*")))
    (with-current-buffer buf
      (customize-themes)
      (read-only-mode 1))))

(projectile-register-project-type 'npm '("package.json")
                                  :project-file "package.json"
				  :compile "npm install"
				  :test "npm run test"
				  :run "npm dev run"
				  :test-suffix ".spec")

;; KEYBINDINGS

;;(which-key-add-prefix-title-based-replacements "+" "")
(which-key-add-key-based-replacements "<leader>c" "Config")
(evil-define-key 'normal 'global (kbd "<leader>cr") 'config-reload)
(evil-define-key 'normal 'global (kbd "<leader>ce") 'config-edit)
(which-key-add-key-based-replacements "<leader>b" "Buffers")
(evil-define-key 'normal 'global (kbd "<leader>bb") 'ivy-switch-buffer)
(evil-define-key 'normal 'global (kbd "<leader>bd") 'kill-buffer)
(evil-define-key 'normal 'global (kbd "<leader>pp") 'projectile-switch-project)
(global-set-key (kbd "C-c i") 'indent-region)
(global-set-key (kbd "C-c t") 'select-theme)

(custom-set-variables
 '(package-selected-packages
   '(evil-leader neotree projectile ido-vertical-mode ivy json-mode hydra typescript-mode magit company flycheck lsp-ui lsp-mode smex use-package undo-fu evil-collection)))
;;; init.el ends here
