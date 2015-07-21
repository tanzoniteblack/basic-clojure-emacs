;; Initialize emacs package manager:
(require 'package)
;; Setup community package archive
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package', a convenience wrapper to the package manager
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Only need to load use-package when compiling
(require 'use-package)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; clojure dev environment ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; modern auto-completion tool
;; http://company-mode.github.io/
(use-package company
  :ensure t
  :config (progn (setq company-idle-delay .2)
                 (bind-key "C-n" 'company-select-next company-active-map)
                 (bind-key "C-p" 'company-select-previous company-active-map)
                 (global-company-mode)))

;; clojure syntax support
;; https://github.com/clojure-emacs/clojure-mode
(use-package clojure-mode
  :ensure t)

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
												(clj-refactor-mode 1)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Non-clojure specific nicities ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; fuzzy autocompletion of emacs commands
;; https://github.com/nonsequitur/smex
(use-package smex
  :ensure t
  :config (smex-initialize)
  :bind (("M-x" . smex)
         ("M-X" . smex-major-mode-commands)))
