(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Desktop/WORK/SCHOOL/PHD/ThirdYear/FirstSemester/Workplan/workplan.txt")))
 '(package-selected-packages
   (quote
    (ac-c-headers auto-complete-c-headers yasnippet auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;start package.el with emacs
(require 'package)
;add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;initialize package.el
(package-initialize)
;start auto-complete with emacs
(require 'auto-complete)
;do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
;start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1);
;let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-sources-c-headers))
;now call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)


;;PNB: IDO MODE SETTINGS
(progn
  ;; make buffer switch command do suggestions, also for find-file command
  (require 'ido)
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (ido-mode 1)

  ;; show choices vertically
  ;; (if (version< emacs-version "25")
  ;;     (progn
  ;;       (make-local-variable 'ido-separator)
  ;;       (setq ido-separator "\n"))
  ;;   (progn
  ;;     (make-local-variable 'ido-decorations)
  ;;     (setf (nth 2 ido-decorations) "\n")))

  ;; show any name that has the chars you typed
  (setq ido-enable-flex-matching t)
  ;; use current pane for newly opened file
  (setq ido-default-file-method 'selected-window)
  ;; use current pane for newly switched buffer
  (setq ido-default-buffer-method 'selected-window)
  ;; stop ido from suggesting when naming new file
  (define-key (cdr ido-minor-mode-map-entry) [remap write-file] nil))


;;PNB: ORG MODE SETTINGS
;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .txt
 (add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))
;; The above is the default in recent emacsen
