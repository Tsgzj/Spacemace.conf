;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     nginx
     helm
     yaml
     html
     clojure
     javascript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ---------------------------------------------------------------
     better-defaults
     emacs-lisp
     git
     gtags
     markdown
     org
     (clojure :variables
              aggressive-indent-mode t)
     (shell :variables
            shell-default-shell 'eshell
            shell-enable-smart-eshell t
            shell-default-height 30
            shell-default-position 'bottom)
     ;;spell-checking
     emoji
     haskell
     syntax-checking
     version-control
     c-c++
     rust
     python
     ruby
     (racket :variables
             aggressive-indent-mode t)
     (common-lisp :variables
                  aggressive-indent-mode t)
     scheme
     latex
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'cycle)
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      key-chord
                                      google-c-style
                                      figlet
                                      all-the-icons
                                      challenger-deep-theme)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner '998
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 7
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-light solarized-dark
                                         spacemacs-dark monokai)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Essential PragmataPro"
                               :size 14
                               :weight light
                               :width narrow
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (dsefault "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   dotspacemacs-large-file-size 1
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup 1
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers `relative
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server 1
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup `trailing

   dotspacemacs-folding-method 'evil
   dotspacemacs-smart-closing-parenthesis nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost
any user code here.  The exception is org related code, which should be placed
in `dotspacemacs/user-config'."
  (setq-default rust-enable-racer t)
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
  (setq exec-path (append exec-path '("/usr/local/bin"))))


(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (setq mac-option-modifier 'super)
  (setq mac-command-modifier 'meta)
  (setq powerline-default-separator 'alternate)

  (global-prettify-symbols-mode +1)
  (indent-guide-global-mode t)
  (display-time-mode)

  (defun check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
        (backward-char 1)
        (if (looking-at "\\.") t
          (backward-char 1)
          (if (looking-at "->") t nil)))))
  (defun do-yas-expand ()
    (let ((yas/fallback-behavior 'return-nil))
      (yas/expand)))
  (defun tab-indent-or-complete ()
    (interactive)
    (if (minibufferp)
        (minibuffer-complete)
      (if (or (not yas/minor-mode)
              (null (do-yas-expand)))
          (if (check-expansion)
              (company-complete-common)
            (indent-for-tab-command)))))
  (setq clojure-enable-fancify-symbols t)
  (defun bind-tab-properly ()
    "Binds tab to tab-indent-or-complete, overwritting yas and company bindings"
    (interactive)
    ;;overwrite yas and company tab mappings
    (define-key yas-minor-mode-map (kbd "<tab>") 'tab-indent-or-complete)
    (define-key yas-minor-mode-map (kbd "TAB") 'tab-indent-or-complete)
    (define-key company-active-map [tab] 'tab-indent-or-complete)
    (add-hook 'company-mode-hook 'bind-tab-properly))
  (global-set-key (kbd "TAB") 'tab-indent-or-complete)
  ;; (add-hook 'rust-mode-hook 'pretty-lambda-mode)
  ;; (add-hook 'common-lisp-lisp-mode-hook 'pretty-lambda-mode)
  ;; (add-hook 'emacs-lisp-mode-hook 'pretty-lambda-mode)
  ;; (add-hook 'racket-mode-hook 'pretty-lambda-mode)
  (global-set-key (kbd "C-x C-h") help-map)
  (global-set-key (kbd "C-h") 'previous-line)

  ;; (define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
  ;; (define-key evil-insert-state-map "\C-e" 'end-of-line)
  ;; (define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
  ;; (define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
  ;; (define-key evil-normal-state-map "\C-f" 'evil-forward-char)
  ;; (define-key evil-insert-state-map "\C-f" 'evil-forward-char)
  ;; (define-key evil-insert-state-map "\C-f" 'evil-forward-char)
  ;; (define-key evil-normal-state-map "\C-b" 'evil-backward-char)
  ;; (define-key evil-insert-state-map "\C-b" 'evil-backward-char)
  ;; (define-key evil-visual-state-map "\C-b" 'evil-backward-char)
  ;; (define-key evil-normal-state-map "\C-d" 'evil-delete-char)
  ;; (define-key evil-insert-state-map "\C-d" 'evil-delete-char)
  ;; (define-key evil-visual-state-map "\C-d" 'evil-delete-char)
  ;; (define-key evil-normal-state-map "\C-n" 'evil-next-line)
  ;; (define-key evil-insert-state-map "\C-n" 'evil-next-line)
  ;; (define-key evil-visual-state-map "\C-n" 'evil-next-line)
  ;; (define-key evil-normal-state-map "\C-p" 'evil-previous-line)
  ;; (define-key evil-insert-state-map "\C-p" 'evil-previous-line)
  ;; (define-key evil-visual-state-map "\C-p" 'evil-previous-line)
  ;; (define-key evil-normal-state-map "\C-w" 'evil-delete)
  ;; (define-key evil-insert-state-map "\C-w" 'evil-delete)
  ;; (define-key evil-visual-state-map "\C-w" 'evil-delete)
  ;; (define-key evil-normal-state-map "\C-y" 'yank)
  ;; (define-key evil-insert-state-map "\C-y" 'yank)
  ;; (define-key evil-visual-state-map "\C-y" 'yank)
  ;; (define-key evil-normal-state-map "\C-k" 'kill-line)
  ;; (define-key evil-insert-state-map "\C-k" 'kill-line)
  ;; (define-key evil-visual-state-map "\C-k" 'kill-line)
  ;; (define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
  ;; (define-key evil-visual-state-map "Q" 'call-last-kbd-macro)
  ;; (define-key evil-normal-state-map (kbd "TAB") 'evil-undefine)

  (defun evil-undefine ()
    (interactive)
    (let (evil-mode-map-alist)
      (call-interactively (key-binding (this-command-keys)))))

  ;;Exit insert mode by pressing j and then j quickly
  ;;(require 'key-chord)
  ;;(key-chord-mode 1)
  ;;(key-chord-define evil-insert-state-map  "hh" 'evil-normal-state)
  (setq-default evil-escape-key-sequence "ht")
  (setq-default evil-escape-delay 0.1)
  (setq c-default-style "k&r"
        c-basic-offset 4)
  )

(with-eval-after-load 'org
  ;; to avoid conflict according to the doc
  (require 'ob-clojure)
  (require 'ob-shell)
  (require 'ob-haskell)
  (require 'ob-ruby)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((clojure . t)
     (scheme . t)
     (shell . t)
     (haskell . t)
     (C . t)
     (ruby . t)))
  (setq org-babel-clojure-backend 'cider)
  (plist-put org-format-latex-options :scale 1.5))


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "dcb9fd142d390bb289fee1d1bb49cb67ab7422cd46baddf11f5c9b7ff756f64c" default)))
 '(evil-want-Y-yank-to-eol t)
 '(package-selected-packages
   (quote
    (treepy graphql sesman nginx-mode key-chord challenger-deep-theme org-category-capture org-mime intero hlint-refactor hindent helm-hoogle helm-gtags haskell-snippets google-c-style ggtags flycheck-haskell figlet ghub let-alist company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode all-the-icons memoize emoji-cheat-sheet-plus company-emoji winum unfill fuzzy clojure-cheatsheet yaml-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data clojure-snippets clj-refactor inflections edn paredit peg cider-eval-sexp-fu cider queue clojure-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode slime-company slime company-auctex common-lisp-snippets packed auctex racket-mode faceup powerline spinner hydra parent-mode projectile pkg-info epl flx smartparens iedit anzu evil goto-chg undo-tree highlight f s diminish bind-map bind-key helm avy helm-core popup async package-build yapfify xterm-color toml-mode smeargle shell-pop rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake racer pyvenv pytest pyenv-mode py-isort pip-requirements orgit org-projectile pcache org-present org org-pomodoro alert log4e gntp org-download mwim multi-term mmm-mode minitest markdown-toc markdown-mode magit-gitflow live-py-mode hy-mode htmlize helm-pydoc helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md geiser flycheck-rust seq flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help disaster diff-hl cython-mode company-statistics company-c-headers company-anaconda company cmake-mode clang-format chruby cargo rust-mode bundler inf-ruby auto-yasnippet yasnippet anaconda-mode pythonic ac-ispell auto-complete solarized-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(package-selected-packages
     (quote
      (dash font-lock+ emoji-cheat-sheet-plus company-emoji winum unfill fuzzy clojure-cheatsheet yaml-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data clojure-snippets clj-refactor inflections edn paredit peg cider-eval-sexp-fu cider queue clojure-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode slime-company slime company-auctex common-lisp-snippets packed auctex racket-mode faceup powerline spinner hydra parent-mode projectile pkg-info epl flx smartparens iedit anzu evil goto-chg undo-tree highlight f s diminish bind-map bind-key helm avy helm-core popup async package-build yapfify xterm-color toml-mode smeargle shell-pop rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake racer pyvenv pytest pyenv-mode py-isort pip-requirements orgit org-projectile pcache org-present org org-pomodoro alert log4e gntp org-download mwim multi-term mmm-mode minitest markdown-toc markdown-mode magit-gitflow live-py-mode hy-mode htmlize helm-pydoc helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md geiser flycheck-rust seq flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help disaster diff-hl cython-mode company-statistics company-c-headers company-anaconda company cmake-mode clang-format chruby cargo rust-mode bundler inf-ruby auto-yasnippet yasnippet anaconda-mode pythonic ac-ispell auto-complete solarized-theme ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   ))
