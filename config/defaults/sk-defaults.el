;;; sk-defaults.el --- Global settings -*- lexical-binding: t; -*-

;;; Commentary:

;; My custom maps for modal editing based on Modalka. This follows a Vi-style

;;; Code:

;; Enable winner-mode
(add-hook 'prog-mode-hook #'winner-mode)
(add-hook 'text-mode-hook #'winner-mode)

;; Recentf mode changes
(setq recentf-max-saved-items 1000
      recentf-exclude '("/tmp/" "/ssh:"))

;; GUI changes
(defun sk/gui-defaults ()
  (interactive)
  (recentf-mode)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  ;; (load-theme 'leuven t)
  (scroll-bar-mode -1))
(add-hook 'after-init-hook 'sk/gui-defaults)

;; initial window
(setq initial-frame-alist
      '(
        (width . 102) ; character
        (height . 54) ; lines
        ))

;; default/sebsequent window
(setq default-frame-alist
      '(
        (width . 100) ; character
        (height . 52) ; lines
        ))

;; Bar cursor
(setq-default cursor-type '(bar . 1))

;; Swiper like regex when using isearch
(setq search-whitespace-regexp ".*?")

;; No welcome screen - opens directly in scratch buffer
(setq inhibit-startup-message t
      initial-scratch-message ";; Scratch

;; Press '?' in Modalka state or 'C-x ?' in Emacs state for bindings list.
;; Press 'SPC ?' in Modalka state or 'C-h b' in Emacs state for searching through bindings.
;; Press 'SPC j' in Modalka state or 'M-x' in Emacs state to access all the functions/commands.
;; Press 'C-h C-h' for help regarding how to use help.
;; Finally, pressing one of the prefix keys and waiting for a second will also show hints.


"
      initial-major-mode 'fundamental-mode
      visible-bell nil
      inhibit-splash-screen t)

;; DocView Settings
(setq doc-view-continuous t
      doc-view-resolution 300)

;; Don't blink the cursor
(blink-cursor-mode -1)

;; GDB
(setq gdb-many-windows t
      gdb-show-main t)

;; Backups at .saves folder in the current folder
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; Ediff plain window and vertical
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; Remote file navigation
(setq tramp-default-method "ssh")
(setq tramp-backup-directory-alist backup-directory-alist)
(setq tramp-ssh-controlmaster-options "ssh")

;; File size warning - 15 MB
(setq large-file-warning-threshold (* 15 1024 1024))

;; Narrow to region
(put 'narrow-to-region 'disabled nil)

;; Column number mode
(column-number-mode)

;; Persistent history, thank you very much
(savehist-mode)

;; Truncate those long lines
(setq-default truncate-lines t)

;; Marks navigation repeat
(setq set-mark-command-repeat-pop t)

;; Change the echo message
(defun display-startup-echo-area-message ()
  (message "Let the games begin!"))

;; Shorten yes or no prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; default global bindings
(require 'sk-defaults-bindings)

(provide 'sk-defaults)
;;; sk-defaults.el ends here
