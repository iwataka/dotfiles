(menu-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

(el-get-bundle auto-complete
  :url "http://github.com/auto-complete/auto-complete"
  :fetures auto-complete)

(el-get-bundle color-theme-solarized
  :url "https://github.com/sellout/emacs-color-theme-solarized"
  :fetures color-theme-solarized
  (load-theme 'solarized t))

;; use light frames in the GUI and dark frames in the terminal
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (set-frame-parameter frame
                                 'background-mode
                                 (if (display-graphic-p frame) 'light 'dark))
            (enable-theme 'solarized)))

(defun prev-window ()
  (interactive)
  (other-window -1))

(el-get-bundle blank-mode
  (setq-default blank-space nil)
  (setq-default blank-indentation nil)
  (setq-default blank-hspace nil)
  (setq-default blank-chars '(tabs trailing newline))
  (setq-default blank-active-chars '(tabs trailing newline))
  (eval-and-compile
    (blank-mode 1)
    (global-blank-mode 1)))

(el-get-bundle projectile
  :url "https://github.com/bbatsov/projectile"
  :features projectile
  (projectile-global-mode))

(el-get-bundle helm
  :url "https://github.com/emacs-helm/helm"
  :features helm
  (setq helm-split-window-in-side-p t
        helm-move-to-line-cycle-in-source t
        helm-scroll-amount 8))

(el-get-bundle magit
  :url "https://github.com/magit/magit"
  :features magit
  (setq magit-last-seen-setup-instructions "1.4.0"))

(el-get-bundle git-gutter
  :url "https://github.com/syohex/emacs-git-gutter"
  :features git-gutter
  (global-git-gutter-mode 1)
  (setq-default git-gutter:deleted-sign "-")
  (setq-default git-gutter:modified-sign "~")
  (setq-default git-gutter:force t))

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)
;; Use the system clipboard
(setq x-select-enable-clipboard t)

(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))

(defun rename-this-file (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "New name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (if (get-buffer new-name)
        (message "A buffer named '%s' already exists!" new-name)
      (progn
        (rename-file filename new-name 1)
        (rename-buffer new-name)
        (set-visited-file-name new-name)
        (set-buffer-modified-p nil)))))

(defun open-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun stage-this-file ()
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (magit-stage-item (buffer-file-name))
  (git-gutter:update-all-windows))

(defun revert-this-file ()
  (interactive)
  (or (buffer-file-name) (error "No file is currently being edited"))
  (magit-revert-item (buffer-file-name))
  (git-gutter:update-all-windows))
