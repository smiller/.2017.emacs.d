
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")))

;; https://github.com/quelpa/quelpa#installation
(if (require 'quelpa nil t)
    (quelpa-self-upgrade)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
    (eval-buffer)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (dichromacy)))
 '(package-selected-packages
   (quote
    (projectile-rails rake f s inf-ruby inflections helm-projectile helm helm-core popup typo rvm rubocop enh-ruby-mode org-beautify-theme org-bullets hydra pkg-info epl magit magit-popup git-commit with-editor dash async projectile use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; -- disable stuff ----------------------------------------------------------
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
(menu-bar-mode -1)
(set-face-attribute 'fringe nil :background "white" :foreground "white")

;; -- rows and columns -------------------------------------------------------
(setq line-number-mode t)
(setq column-number-mode t)
(setq linum-format "%4d ")

(quelpa 'projectile)

(require 'projectile)
(setq projectile-keymap-prefix (kbd "C-c p"))
(projectile-global-mode)
(setq projectile-completion-system 'default)

(quelpa 'helm)
(quelpa 'helm-projectile)

(require 'helm)
(helm-mode)
(require 'helm-projectile)

(display-time-mode t)


;; jumps
(quelpa 'hydra)

(require 'hydra)
(global-set-key
  (kbd "C-c j")
  (defhydra hydra-jump (:color blue)
    "jump"
    ("e" (find-file "~/.emacs.d/init.el") ".emacs")

    ("oi" (find-file "~/code/inventory/") "invent")
    ("oo" (find-file "~/code/optics/") "optics")
    ("oj" (find-file "~/Dropbox/gesta/optoro.org") "optoro.org")

    ("a" (find-file "~/code/autrui/") "autrui")
    ("b" (find-file "~/Dropbox/gesta/books.org") "books")
    ("h" (find-file "~/Dropbox/gesta/2017.org") "hodie")
    ("r" (find-file "~/Dropbox/gesta/readings.org") "readings")
    ("w" (find-file "~/Dropbox/gesta/writings.org") "writings")
    ("t" (find-file "~/Dropbox/gesta/twc/") "twc")
    ("v" (find-file "~/Dropbox/gesta/verdour.org") "verdour")

    ("pp0" (find-file "~/Dropbox/gesta/1990.org") "1990")
    ("p0" (find-file "~/Dropbox/gesta/2000.org") "2000")
    ("p1" (find-file "~/Dropbox/gesta/2001.org") "2001")
    ("p2" (find-file "~/Dropbox/gesta/2002.org") "2002")
    ("p3" (find-file "~/Dropbox/gesta/2003.org") "2003")
    ("p4" (find-file "~/Dropbox/gesta/2004.org") "2004")
    ("p5" (find-file "~/Dropbox/gesta/2005.org") "2005")
    ("p6" (find-file "~/Dropbox/gesta/2006.org") "2006")
    ("p7" (find-file "~/Dropbox/gesta/2007.org") "2007")
    ("p8" (find-file "~/Dropbox/gesta/2008.org") "2008")
    ("p9" (find-file "~/Dropbox/gesta/2009.org") "2009")
    ("0" (find-file "~/Dropbox/gesta/2010.org") "2010")
    ("1" (find-file "~/Dropbox/gesta/2011.org") "2011")
    ("2" (find-file "~/Dropbox/gesta/2012.org") "2012")
    ("3" (find-file "~/Dropbox/gesta/2013.org") "2013")
    ("4" (find-file "~/Dropbox/gesta/2014.org") "2014")
    ("5" (find-file "~/Dropbox/gesta/2015.org") "2015")
    ("6" (find-file "~/Dropbox/gesta/2016.org") "2016")
    ("7" (find-file "~/Dropbox/gesta/2017.org") "2017")))

;; margins
(setq-default left-margin-width 4 right-margin-width 1)
(set-window-buffer nil (current-buffer))
;; http://emacsredux.com/blog/2015/01/18/customizing-the-fringes/
(fringe-mode 0)

(defun my/margins ()
  "set default margins 4 / 1"
  (interactive)
  (setq-default left-margin-width 4 right-margin-width 1)
  (set-window-buffer nil (current-buffer))
)

(global-set-key
  (kbd "C-c m")
  (defhydra hydra-mode-switch (:color blue)
    "mode-switch"
    ("e" (emacs-lisp-mode) "emacs-lisp")
    ("l" (linum-mode) "linum")
    ("o" (org-mode) "org")
    ("p" (paredit-mode) "paredit")
    ("qs" (smart-quotes-mode 1) "smart-quotes ON")
    ("qd" (smart-quotes-mode -1) "smart-quotes OFF")
    ("r" (enh-ruby-mode) "ruby")
    ("g" (my/margins) "margins")
    ))

;; Instead of typo-mode
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'smart-quotes)

(global-set-key
  (kbd "C-c q")
  (defhydra hydra-quotatons (:color blue)
    "quotations"
    ("j" (insert "«") "«")
    ("k" (insert "»") "»")
    ("." (insert "…") "…")))

;; http://www.howardism.org/Technical/Emacs/orgmode-wordprocessor.html

(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
'(("^ +\\([-*]\\) "
(0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(quelpa 'org-bullets)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;
(defun my-text-mode-hook ()
  (linum-mode -1)
  (auto-fill-mode 1)
  (set-input-method "TeX")
  (setq line-spacing 5)
  (set-frame-font "Georgia 16")
  (set-face-font 'org-level-4 "Georgia 16")
  (set-face-foreground 'org-level-4 "dark cyan")
  (set-face-font 'org-level-3 "Georgia 18")
  (set-face-foreground 'org-level-3 "dark blue")
  (set-face-font 'org-level-2 "Georgia 20")
  (set-face-foreground 'org-level-2 "dark blue")
  (set-face-font 'org-level-1 "Georgia 22")
  (set-face-foreground 'org-level-1 "dark blue")
  (org-bullets-mode 1)
  (my/margins)
  (turn-on-smart-quotes)
)

(add-hook 'text-mode-hook 'my-text-mode-hook)

;;

(defun my-code-mode-hook ()
  (set-frame-font "Courier 12")
  (linum-mode 1)
  (setq line-spacing nil)
)

(quelpa 'enh-ruby-mode)
(quelpa 'rubocop)
(quelpa 'rvm)
(quelpa 'projectile-rails)
(projectile-rails-global-mode)

(add-hook 'enh-ruby-mode-hook 'my-code-mode-hook)
(add-hook 'enh-ruby-mode-hook
  (lambda () (rvm-activate-corresponding-ruby)))
(add-hook 'enh-ruby-mode-hook 'rubocop-mode)

(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(setq ruby-deep-indent-paren nil)

;;
;; http://www.virtuouscode.com/2010/04/23/daemonic-emacs/
;; http://www.virtuouscode.com/2011/10/27/running-emacs-as-a-server-emacs-reboot-15/
(server-start)
