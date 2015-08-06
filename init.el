;; Initialize emacs package manager:
(require 'package)
;; Setup community package archive
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package', a convenience wrapper to the package manager
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure dev environment ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; clojure syntax support
;; https://github.com/clojure-emacs/clojure-mode
(use-package clojure-mode
  :ensure t
  :config
  (add-hook 'clojure-mode-hook 'yas-minor-mode))

;; clojure IDE
;; https://github.com/clojure-emacs/cider
(use-package cider
  :ensure t
  :config (progn (add-hook 'clojure-mode-hook 'cider-mode)
                 (add-hook 'clojure-mode-hook 'cider-turn-on-eldoc-mode)
                 (add-hook 'cider-repl-mode-hook 'subword-mode)
                 (setq cider-annotate-completion-candidates t
                       cider-prompt-for-symbol nil)))

;; clojure refactor library
;; https://github.com/clojure-emacs/clj-refactor.el
(use-package clj-refactor
  :ensure t
  :config (progn (setq cljr-suppress-middleware-warnings t)
                 (add-hook 'clojure-mode-hook (lambda ()
						(clj-refactor-mode 1)
						(cljr-add-keybindings-with-prefix "C-c C-m")))))

;; show build errors and linting in place in buffer
;; http://www.flycheck.org/
;; Clojure specific library:
;; https://github.com/clojure-emacs/squiggly-clojure
(use-package flycheck
  :ensure t
  :config (progn (use-package flycheck-clojure                       ; load clojure specific flycheck features
                   :ensure t
                   :config (flycheck-clojure-setup))
                 (setq flycheck-display-errors-function 'flycheck-pos-tip-error-messages)
                 ;; initialize flycheck
                 (global-flycheck-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Non-clojure specific things, highly recommended ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; modern auto-completion tool
;; http://company-mode.github.io/
(use-package company
  :ensure t
  :config (progn (setq company-idle-delay .2)
                 (bind-key "C-n" 'company-select-next company-active-map)
                 (bind-key "C-p" 'company-select-previous company-active-map)
                 (global-company-mode)))

;; parenthesis/brackets balancing and navigating
;; https://github.com/Fuco1/smartparens
(use-package smartparens
  :ensure t
  :config (progn (require 'smartparens-config)
                 (smartparens-global-mode t)
                 ;; highlight matching pairs
                 (show-smartparens-global-mode t)
                 (add-hook 'clojure-mode-hook 'smartparens-strict-mode)
                 (add-hook 'emacs-lisp-mode-hook 'smartparens-strict-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; non-clojure dev niceties ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; git wrapper / advanced in emacs git menu
;; https://github.com/magit/magit
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

;; project management/navigation
;; https://github.com/bbatsov/projectile
(use-package projectile
  :ensure t
  :config (projectile-global-mode))

;; efficient navigating of viewable buffer
;; https://github.com/abo-abo/avy
(use-package avy
  :ensure t
  :bind ("C-c SPC" . avy-goto-word-1))

;; fuzzy autocompletion of emacs commands (better M-x)
;; https://github.com/nonsequitur/smex
(use-package smex
  :ensure t
  :config (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)))

;; semi-fuzzy file finding (better find-file and autocompletion)
;; http://emacswiki.org/emacs/InteractivelyDoThings
(use-package ido
  :ensure t
  :config (progn (setq
                  ;; Match letters in order throughout string, not just prefix
                  ido-enable-prefix nil
                  ;; Be able to create new buffers without complaint
                  ido-create-new-buffer 'always
                  ;; Use ido where ever possible
                  ido-everywhere 1
                  ;; if exact match not found, look for other files containing these characters
                  ido-enable-flex-matching t
                  ;; don't leave the current directory if we don't find the file we typed
                  ido-auto-merge-work-directories-length -1)
                 ;; Show available completions in the minibuffer automatically
                 (icomplete-mode 1)
                 ;; Turn on ido-mode
                 (ido-mode t)))
