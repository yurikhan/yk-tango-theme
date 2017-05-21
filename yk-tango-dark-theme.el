(deftheme yk-tango-dark)

(require 'yk-tango-colors)
(require 'yk-term-colors)
(require 'yk-color) ;; github:yurikhan/yk-color

(defface yk-normal nil "Normal face")
(defface yk-ui nil "UI parts, as opposed to document content.")
(defface yk-incorrect nil "Highlight for mistakes and style violations.")
(defface yk-speedbar nil "Speedbar base face.")
(defface yk-nxml-cdata nil "Base face for CDATA sections.")
(defface yk-magit-diff-highlight nil "Base face for Magit heading highlighting.")

;;; Caveat
;; On a 256-color terminal, avoid using the 8 standard colors.
;; Rationale:
;; * Terminal emulators provide customization UI for these.
;; * tmux cannot display these in bold. It shifts to colors 8–15.

;;; Coverage guidelines
;; * Features that I personally use.

;;; Auxiliary colors
(defconst aluminium01 (yk-color-adjust aluminium0 1.1 aluminium0 aluminium1))
(defconst aluminium02 (yk-color-adjust aluminium0 1.2 aluminium0 aluminium1))
(defconst butter-bg (yk-color-blend aluminium0 0.05 butter3))
(defconst butter-bg2 (yk-color-blend aluminium0 0.1 butter3))
(defconst orange-bg (yk-color-blend aluminium0 0.2 orange3))
(defconst chocolate-bg (yk-color-blend aluminium0 0.2 chocolate3))
(defconst chameleon-bg (yk-color-blend aluminium0 0.1 chameleon3))
(defconst chameleon-bg2 (yk-color-blend aluminium0 0.2 chameleon3))
(defconst skyblue-bg (yk-color-blend aluminium0 0.1 skyblue4))
(defconst skyblue-bg2 (yk-color-blend aluminium0 0.2 skyblue4))
(defconst plum-bg (yk-color-blend aluminium0 0.2 plum3))
(defconst plum30 (yk-color-adjust aluminium0 3.0 plum3 plum4))
(defconst plum40 (yk-color-adjust aluminium0 4.5 plum4 plum5))
(defconst scarletred-bg (yk-color-blend aluminium0 0.15 scarletred3))
(defconst scarletred-bg2 (yk-color-blend aluminium0 0.3 scarletred3))

;;; Face customizations
(custom-theme-set-faces 'yk-tango-dark
;;;; Base UI faces
  `(yk-normal ((((min-colors 16777216)) . (:foreground ,aluminium3))
               (((min-colors 256)) . (:foreground ,gray18))))
  `(yk-ui ((default . (:inherit yk-normal :distant-foreground ,nil))
           (((min-colors 16777216)) . (:background ,aluminium02))
           (((min-colors 256)) . (:background ,gray6))))
;;;; Buffer space
;;;;; `faces' — Basic Faces
  `(default ((((min-colors 16777216)) . (:background ,aluminium0 :foreground ,aluminium3))
             (((min-colors 256)) . (:background ,gray4 :foreground ,gray18))))
  `(cursor ((((min-colors 16777216)) . (:background ,skyblue4))
            (((min-colors 256)) . (:background ,rgb234))))
  `(highlight ((default . (:underline t))))
  `(region ((((min-colors 16777216)) . (:background ,skyblue-bg :distant-foreground unspecified))
            (((min-colors 256)) . (:background ,rgb023 :distant-foreground unspecified))))
  `(secondary-selection ((((min-colors 16777216)) . (:background ,butter-bg))
                         (((min-colors 256)) . (:background ,rgb210))))
  `(escape-glyph ((((min-colors 16777216)) . (:foreground ,scarletred5))
                  (((min-colors 256)) . (:foreground ,rgb522))))
  `(yk-incorrect ((((type graphic)) . (:underline (:color ,scarletred4 :style wave)))
                  (((min-colors 16777216)) . (:foreground ,scarletred4 :underline t))
                  (((min-colors 256)) . (:foreground ,rgb400 :underline t))))
  `(trailing-whitespace ((default . (:inherit yk-incorrect))))
  `(match ((default . (:underline ,butter3))
           (((min-colors 16777216)) . (:background ,butter-bg))
           (((min-colors 256)) . (:background ,gray8))))

;;;;; `cua' — Emulate CUA key bindings including C-x and C-c
  `(cua-global-mark ((((min-colors 16777216)) . (:background ,butter-bg))
                     (((min-colors 256)) . (:background ,rgb210))))
  `(cua-rectangle ((default . (:inherit region))
                   (((min-colors 16777216)) . (:background ,plum-bg))
                   (((min-colors 256)) . (:background ,rgb101))))
  `(cua-rectangle-noselect ((default . (:inherit region))
                            (((min-colors 16777216)) . (:background ,chocolate-bg))
                            (((min-colors 256)) . (:background ,rgb110))))
;;;;; `hl-line' — Highlight the current line
  `(hl-line ((((min-colors 16777216)) . (:background ,aluminium01))
             (((min-colors 256)) . (:background ,gray5))))

;;;;; `isearch' — Incremental search minor mode
  `(isearch ((((min-colors 16777216)) . (:background ,skyblue-bg2))
             (((min-colors 256)) . (:background ,rgb023))))
  `(isearch-fail ((((min-colors 16777216)) . (:background ,scarletred-bg))
                  (((min-colors 256)) . (:background ,rgb100))))
  `(lazy-highlight ((((min-colors 16777216)) . (:background ,skyblue-bg))
                    (((min-colors 256)) . (:background ,rgb012))))

;;;;; `whitespace' — Visualize blanks (TAB, (HARD) SPACE and NEWLINE)
  ;; see also: `escape-glyph'
  `(whitespace-space ((default . (:background unspecified))
                      (((min-colors 16777216))
                       . (:foreground ,aluminium1 :distant-foreground ,aluminium1))
                      (((min-colors 256)) . (:foreground ,gray8 :distant-foreground ,gray8))))
  `(whitespace-hspace ((default . (:inherit escape-glyph))))  ; " "
  `(whitespace-tab ((default . (:inherit whitespace-space)))) ; "	"
  `(whitespace-newline ((default . (:inherit whitespace-space))))

;;;;; `whitespace' — Whitespace style violations
  ;; see also: `trailing-whitespace'
  `(whitespace-trailing ((default . (:inherit (yk-incorrect whitespace-space)))))
  `(whitespace-line ((default . (:inherit yk-incorrect whitespace-space))))
  `(whitespace-space-before-tab ((default . (:inherit (yk-incorrect whitespace-space)))))
  `(whitespace-indentation ((default . (:inherit (yk-incorrect whitespace-space)))))
  `(whitespace-big-indent ((default . (:inherit (yk-incorrect whitespace-space)))))
  `(whitespace-empty ((default . (:inherit (yk-incorrect whitespace-space)))))
  `(whitespace-space-after-tab ((default . (:inherit (yk-incorrect whitespace-space)))))

;;;;; `highlight-beyond-fill-column'
  `(highlight-beyond-fill-column-face ((default . (:inherit yk-incorrect))))

;;;;; `paren-showing-faces' — Showing (un)matching of parens and expressions
  `(show-paren-match ((((min-colors 16777216)) . (:background ,chameleon-bg))
                      (((min-colors 256)) . (:background ,rgb010))))
  `(show-paren-mismatch ((((min-colors 16777216)) . (:background ,scarletred-bg))
                         (((min-colors 256)) . (:background ,rgb300))))

;;;;; `smartparens'
  `(sp-pair-overlay-face ((default . (:inherit highlight))))
  `(sp-wrap-overlay-face ((default . (:inherit sp-pair-overlay-face))))
  `(sp-wrap-overlay-opening-pair ((default . (:inherit sp-wrap-overlay-face))
                                  (((min-colors 16777216)) . (:foreground ,chameleon3))
                                  (((min-colors 256)) . (:foreground ,rgb240))))
  `(sp-wrap-overlay-closing-pair ((default . (:inherit sp-wrap-overlay-face))
                                  (((min-colors 16777216)) . (:foreground ,scarletred4))
                                  (((min-colors 256)) . (:foreground ,rgb511))))
;;;; Comint modes
;;;;; `faces'
  `(success ((default . (:weight bold))
             (((min-colors 16777216)) . (:foreground ,chameleon2))
             (((min-colors 256)) . (:foreground ,rgb120))))
  `(warning ((default . (:weight bold))
             (((min-colors 16777216)) . (:foreground ,orange3))
             (((min-colors 256)) . (:foreground ,rgb520))))
  `(error ((default . (:weight bold))
           (((min-colors 16777216)) . (:foreground ,scarletred4))
           (((min-colors 256)) . (:foreground ,rgb511))))

;;;; Editing utility modes
;;;;; `bm' — Visible, buffer local bookmarks
  `(bm-face ((((min-colors 16777216)) . (:background ,chocolate-bg))
             (((min-colors 256)) . (:background ,rgb100))))
  `(bm-fringe-face ((default . (:inherit bm-face))))
  `(bm-persistent-face ((((min-colors 16777216)) . (:background ,orange-bg))
                        (((min-colors 256)) . (:background ,rgb210))))

;;;;; `hi-lock' — Interactively add and remove font-lock patterns for highlighting text
  ;; Rationale (:underline and :overline): Pure background highlighting is overridden
  ;; by `hl-line' and `region'.
  ;; Rationale (:underline and :overline vs :box with negative :line-width:
  ;; while top/bottom borders are drawn within character space,
  ;; left/right borders have their own width and cause characters to move.
  `(hi-blue ((((min-colors 16777216))
              . (:background ,skyblue-bg :underline ,skyblue4 :overline nil))
             (((min-colors 256)) . (:background ,rgb023))))
  `(hi-blue-b ((default . (:weight bold))
               (((min-colors 16777216)) . (:foreground ,skyblue4))
               (((min-colors 256)) . (:foreground ,rgb234))))
  `(hi-green ((((min-colors 16777216))
               . (:background ,chameleon-bg :underline ,chameleon3 :overline nil))
              (((min-colors 256)) . (:background ,rgb453))))
  `(hi-green-b ((default . (:weight bold))
                (((min-colors 16777216)) . (:foreground ,chameleon2))
                (((min-colors 256)) . (:foreground ,rgb120))))
  `(hi-pink ((((min-colors 16777216))
              . (:background ,scarletred-bg :underline ,scarletred3 :overline nil))
              (((min-colors 256)) . (:background ,rgb300))))
  `(hi-red-b ((default . (:weight bold))
              (((min-colors 16777216)) . (:foreground ,scarletred4))
              (((min-colors 256)) . (:foreground ,rgb511))))
  `(hi-yellow ((((min-colors 16777216))
                . (:background ,butter-bg2 :underline ,butter3 :overline nil))
               (((min-colors 256)) . (:background ,rgb210))))

;;;;; `diff-mode' — Major mode for viewing/editing diffs
  `(diff-header ((((min-colors 16777216)) . (:background ,aluminium01))
                 (((min-colors 256)) . (:background ,gray5))))
  `(diff-file-header ((default . (:inherit diff-header :weight bold))))
  `(diff-hunk-header ((default . (:inherit diff-header))
                      (((min-colors 16777216)) . (:foreground ,skyblue5))
                      (((min-colors 256)) . (:foreground ,rgb345))))
  `(diff-function ((default . (:inherit diff-hunk-header))))
  `(diff-context ((default . (:inherit default))))
  `(diff-added ((((min-colors 16777216)) . (:foreground ,chameleon2))
                (((min-colors 256)) . (:foreground ,rgb352))))
  `(diff-changed ((((min-colors 16777216)) . (:foreground ,orange5))
                  (((min-colors 256)) . (:foreground ,rgb542))))
  `(diff-removed ((((min-colors 16777216)) . (:foreground ,scarletred5))
                  (((min-colors 256)) . (:foreground ,rgb522))))
  `(diff-refine-added ((((min-colors 16777216)) . (:background ,chameleon-bg))
                       (((min-colors 256)) . (:background ,rgb010))))
  `(diff-refine-changed ((((min-colors 16777216)) . (:background ,butter-bg))
                         (((min-colors 256)) . (:background ,rgb210))))
  `(diff-refine-removed ((((min-colors 16777216)) . (:background ,scarletred-bg))
                         (((min-colors 256)) . (:background ,rgb100))))

;;;;; `ediff-mode' — Comprehensive visual interface to ‘diff’ and ‘patch’
  `(ediff-even-diff-Ancestor ((((min-colors 16777216)) . (:background ,butter-bg))
                              (((min-colors 256)) . (:background ,gray6))))
  `(ediff-even-diff-A ((default . (:inherit ediff-even-diff-Ancestor))))
  `(ediff-even-diff-B ((default . (:inherit ediff-even-diff-Ancestor))))
  `(ediff-even-diff-C ((default . (:inherit ediff-even-diff-Ancestor))))
  `(ediff-odd-diff-Ancestor ((default . (:inherit ediff-even-diff-Ancestor))))
  `(ediff-odd-diff-A ((default . (:inherit ediff-odd-diff-Ancestor))))
  `(ediff-odd-diff-B ((default . (:inherit ediff-odd-diff-Ancestor))))
  `(ediff-odd-diff-C ((default . (:inherit ediff-odd-diff-Ancestor))))
  `(ediff-current-diff-Ancestor ((((min-colors 16777216)) . (:background ,butter-bg))
                                 (((min-colors 256)) . (:background ,gray6))))
  `(ediff-current-diff-A ((((min-colors 16777216)) . (:background ,scarletred-bg))
                          (((min-colors 256)) . (:background ,rgb100))))
  `(ediff-current-diff-B ((((min-colors 16777216)) . (:background ,chameleon-bg))
                          (((min-colors 256)) . (:background ,rgb010))))
  `(ediff-current-diff-C ((((min-colors 16777216)) . (:background ,skyblue-bg))
                          (((min-colors 256)) . (:background ,rgb012))))
  `(ediff-fine-diff-Ancestor
    ((default . (:inherit ediff-current-diff-Ancestor))
     (((min-colors 16777216)) . (:background ,butter-bg2))
     (((min-colors 256)) . (:background ,gray6 :foreground ,rgb552))))
  `(ediff-fine-diff-A
    ((default . (:inherit ediff-current-diff-A))
     (((min-colors 16777216)) . (:background ,scarletred-bg2))
     (((min-colors 256)) . (:background ,rgb100 :foreground ,rgb522))))
  `(ediff-fine-diff-B
    ((default . (:inherit ediff-current-diff-B))
     (((min-colors 16777216)) . (:background ,chameleon-bg2))
     (((min-colors 256)) . (:background ,rgb010 :foreground ,rgb352))))
  `(ediff-fine-diff-C
    ((default . (:inherit ediff-current-diff-C))
     (((min-colors 16777216)) . (:background ,skyblue-bg2))
     (((min-colors 256)) . (:foreground ,rgb345))))

;;;;; `magit-faces' — Controlling Git from Emacs — Diff
  `(magit-section-heading ((default . (:inherit bold))))
  `(magit-section-highlight ((default . (:inherit hl-line))))
  `(magit-section-heading-selection ((default (:inherit region magit-section-highlight))))
  `(magit-diff-file-heading ((default . (:inherit diff-file-header))))
  `(yk-magit-diff-highlight ((((min-colors 16777216)) . (:background ,aluminium02))
                             (((min-colors 256)) . (:background ,gray6))))
  `(magit-diff-file-heading-highlight ((default . (:inherit (yk-magit-diff-highlight
                                                             magit-diff-file-heading)))))
  `(magit-diff-file-heading-selection ((default . (:inherit (region
                                                             magit-diff-file-heading-highlight)))))
  `(magit-diff-hunk-heading ((default . (:inherit diff-hunk-header))))
  `(magit-diff-hunk-heading-highlight ((default . (:inherit (yk-magit-diff-highlight
                                                             magit-diff-hunk-heading)))))
  `(magit-diff-hunk-heading-selection ((default . (:inherit (region
                                                             magit-diff-hunk-heading-highlight)))))
  `(magit-diff-lines-heading ((default . (:inherit region))))

  `(magit-diff-context ((default . (:inherit diff-context))))
  `(magit-diff-context-highlight ((default . (:inherit (hl-line diff-context)))))
  `(magit-diff-added ((default . (:inherit diff-added))))
  `(magit-diff-added-highlight ((default . (:inherit (magit-diff-added hl-line)))))
  `(magit-diff-removed ((default . (:inherit diff-removed))))
  `(magit-diff-removed-highlight ((default . (:inherit (magit-diff-removed hl-line)))))
  `(magit-diffstat-added ((default . (:inherit magit-diff-added))))
  `(magit-diffstat-removed ((default . (:inherit magit-diff-removed))))

;;;;; `magit-faces' — Controlling Git from Emacs — Conflict resolution
  `(magit-diff-conflict-heading ((default . (:inherit (shadow magit-diff-hunk-heading)))))
  `(magit-diff-base ((((min-colors 16777216)) . (:foreground ,butter2))
                     (((min-colors 256)) . (:foreground ,rgb430))))
  `(magit-diff-base-highlight ((default . (:inherit (magit-diff-base hl-line)))))
  `(magit-diff-our ((default . (:inherit magit-diff-removed))))
  `(magit-diff-our-highlight ((default . (:inherit (magit-diff-our hl-line)))))
  `(magit-diff-their ((default . (:inherit magit-diff-added))))
  `(magit-diff-their-highlight ((default . (:inherit (magit-diff-their hl-line)))))

;;;;; `smerge' — Minor mode to highlight and resolve diff3 conflicts
  `(smerge-markers ((default . (:inherit magit-diff-conflict-heading))))
  `(smerge-base ((default . (:inherit ediff-current-diff-Ancestor))))
  `(smerge-mine ((default . (:inherit ediff-current-diff-A))))
  `(smerge-other ((default . (:inherit ediff-current-diff-B))))
  `(smerge-refined-added ((default . (:inherit (smerge-refined-changed ediff-fine-diff-B)))))
  `(smerge-refined-removed ((default . (:inherit (smerge-refined-changed ediff-fine-diff-A)))))

;;;; Programming modes
;;;;; `font-lock' — Faces for highlighting text
  `(font-lock-keyword-face ((((min-colors 16777216)) . (:foreground ,plum40))
                            (((min-colors 256)) . (:foreground ,rgb434))))
  `(font-lock-comment-face ((((min-colors 16777216)) . (:foreground ,aluminium2))
                            (((min-colors 256)) . (:foreground ,gray13))))
  `(font-lock-string-face ((((min-colors 16777216)) . (:foreground ,chocolate3))
                           (((min-colors 256)) . (:foreground ,rgb420))))
  `(font-lock-type-face ((((min-colors 16777216)) . (:foreground ,chameleon2))
                         (((min-colors 256)) . (:foreground ,rgb120))))
  `(font-lock-constant-face ((((min-colors 16777216)) . (:foreground ,skyblue4))
                             (((min-colors 256)) . (:foreground ,rgb234))))
  `(font-lock-function-name-face ((((min-colors 16777216)) . (:foreground ,skyblue5))
                                  (((min-colors 256)) . (:foreground ,rgb345))))
  `(font-lock-variable-name-face ((((min-colors 16777216)) . (:foreground ,orange2))
                                  (((min-colors 256)) . (:foreground ,rgb520))))
  `(font-lock-builtin-face ((((min-colors 16777216)) . (:foreground ,plum30))
                            (((min-colors 256)) . (:foreground ,rgb323))))
  `(font-lock-warning-face ((default . (:inherit warning))))

;;;;; `nxml-faces' — New XML editing mode
  `(yk-nxml-cdata ((((min-colors 16777216)) . (:background ,aluminium01))
                   (((min-colors 256)) . (:background ,gray5))))
  `(nxml-delimiter ((((min-colors 16777216)) . (:foreground ,aluminium2))
                    (((min-colors 256)) . (:foreground ,gray13))))
  `(nxml-name ((((min-colors 16777216)) . (:foreground ,plum4))
               (((min-colors 256)) . (:foreground ,rgb323))))
  `(nxml-cdata-section-delimiter ((default . (:inherit (nxml-delimiter yk-nxml-cdata)))))
  `(nxml-cdata-section-CDATA ((default . (:inherit (nxml-name yk-nxml-cdata)))))
  `(nxml-cdata-section-content ((default . (:inherit (nxml-text yk-nxml-cdata)))))
  `(nxml-element-local-name ((((min-colors 16777216)) . (:foreground ,skyblue4))
                             (((min-colors 256)) . (:foreground ,rgb123))))

;;;;; `web-mode' — Major mode for editing web templates
  `(web-mode-block-face ((((min-colors 16777216)) . (:background ,aluminium01))
                         (((min-colors 256)) . (:background ,gray5)))) ;todo
  `(web-mode-block-attr-name-face ((((min-colors 16777216)) . (:foreground ,chameleon4))
                                    (((min-colors 256)) . (:foreground ,rgb251)))) ;todo
  `(web-mode-block-attr-value-face ((((min-colors 16777216)) . (:foreground ,skyblue4))
                                    (((min-colors 256)) . (:foreground ,rgb234)))) ;todo
  `(web-mode-current-column-highlight-face ((((min-colors 16777216)) . (:background ,aluminium01))
                                            (((min-colors 256)) . (:background ,gray5))))
  `(web-mode-current-element-highlight-face ((((min-colors 16777216)) . (:background ,aluminium01))
                                             (((min-colors 256)) . (:background ,gray5))))
  `(web-mode-doctype-face ((((min-colors 16777216)) . (:foreground ,aluminium2))
                           (((min-colors 256)) . (:foreground ,gray13))))
  `(web-mode-error-face ((default . (:inherit yk-incorrect))))
  `(web-mode-html-attr-name-face ((default . (:inherit nxml-attribute-local-name))))
  `(web-mode-html-entity-face ((default . (:inherit nxml-entity-ref-name))))
  `(web-mode-html-tag-bracket-face ((default . (:inherit nxml-tag-delimiter))))
  `(web-mode-html-tag-face ((default . (:inherit nxml-element-local-name))))
  `(web-mode-inlay-face ((((min-colors 16777216)) . (:background ,aluminium01))
                         (((min-colors 256)) . (:background ,gray5))))
  `(web-mode-json-context-face ((default . (:inherit web-mode-json-key-face))
                                (((min-colors 16777216)) . (:foreground ,plum3))
                                (((min-colors 256)) . (:foreground ,rgb212))))
  `(web-mode-json-key-face ((default . (:inherit font-lock-variable-name-face))))
  `(web-mode-jsx-depth-1-face ((((min-colors 16777216)) . (:background ,aluminium01))
                               (((min-colors 256)) . (:background ,gray5))))
  `(web-mode-jsx-depth-2-face ((((min-colors 16777216)) . (:background ,aluminium02))
                               (((min-colors 256)) . (:background ,gray6))))
  `(web-mode-jsx-depth-3-face ((((min-colors 16777216)) . (:background ,aluminium01))
                               (((min-colors 256)) . (:background ,gray5))))
  `(web-mode-jsx-depth-4-face ((((min-colors 16777216)) . (:background ,aluminium02))
                               (((min-colors 256)) . (:background ,gray6))))
  `(web-mode-param-name-face ((((min-colors 16777216)) . (:foreground ,aluminium2))
                              (((min-colors 256)) . (:foreground ,gray13))))
  `(web-mode-symbol-face ((((min-colors 16777216)) . (:foreground ,orange2))
                          (((min-colors 256)) . (:foreground ,rgb410))))
  `(web-mode-whitespace-face ((((min-colors 16777216)) . (:background ,plum-bg))
                              (((min-colors 256)) . (:background ,rgb101))))

;;;; UI space
;;;;; `faces' — Basic Faces — UI
  `(shadow ((((min-colors 16777216)) . (:foreground ,aluminium2))
            (((min-colors 256)) . (:foreground ,gray13))))
  `(menu ((default . (:inherit yk-ui))))
  `(tty-menu-enabled-face ((default . (:inherit menu))))
  `(tty-menu-disabled-face ((default . (:inherit (shadow menu)))))
  `(tty-menu-selected-face ((default . (:inherit menu))
                            (((min-colors 16777216)) . (:background ,skyblue-bg))
                            (((min-colors 256)) . (:background ,rgb023))))
  `(fringe ((default . (:inherit yk-ui :underline nil :strike-through nil))))
  `(header-line ((default . (:inherit yk-ui))))
  ;; see also `tabbar'
  `(mode-line ((default . (:inherit yk-ui))
               (((min-colors 16777216)) . (:background ,aluminium1
                                           :box (:line-width -1 :color ,aluminium1)))
               (((min-colors 256)) . (:background ,gray8))))
  `(mode-line-inactive ((default . (:inherit (yk-ui) :box (:line-width -1 :color ,black)))
                        (((min-colors 16777216)) . (:foreground ,aluminium2))
                        (((min-colors 256)) . (:foreground ,gray13))))
  `(window-divider ((((min-colors 16777216)) . (:foreground ,aluminium1))
                    (((min-colors 256)) . (:foreground ,gray8))))
  `(window-divider-first-pixel ((((min-colors 16777216)) . (:foreground ,aluminium2))
                                (((min-colors 256)) . (:foreground ,gray13))))
  `(window-divider-last-pixel ((((min-colors 16777216)) . (:foreground ,aluminium0))
                               (((min-colors 256)) . (:foreground ,gray4))))
  `(minibuffer-prompt ((((min-colors 16777216)) . (:foreground ,skyblue4))
                       (((min-colors 256)) . (:foreground ,rgb234))))
  `(link ((default . (:underline t))
          (((min-colors 16777216)) . (:foreground ,skyblue4))
          (((min-colors 256)) . (:foreground ,rgb234))))
  `(link-visited ((default . (:inherit link))
                  (((min-colors 16777216)) . (:foreground ,plum4))
                  (((min-colors 256)) . (:foreground ,rgb323))))

;;;;; `tooltip'
  `(tooltip ((default . (:inherit (yk-normal variable-pitch)))
             (((min-colors 16777216)) . (:background ,skyblue-bg))
             (((min-colors 256)) . (:background ,gray3))))

;;;;; `git-gutter' — Port GitGutter
  `(git-gutter:added ((default . (:inherit fringe))
                      (((min-colors 16777216)) . (:foreground ,chameleon4))
                      (((min-colors 256)) . (:foreground ,rgb240))))
  `(git-gutter:deleted ((default . (:inherit fringe))
                        (((min-colors 16777216)) . (:foreground ,scarletred4))
                        (((min-colors 256)) . (:foreground ,rgb511))))
  `(git-gutter:modified ((default . (:inherit fringe))
                         (((min-colors 16777216)) . (:foreground ,orange3))
                         (((min-colors 256)) . (:foreground ,rgb520))))
  `(git-gutter:unchanged ((default . (:inherit fringe))
                          (((min-colors 16777216))
                           . (:foreground ,aluminium1 :distant-foreground ,aluminium1))
                          (((min-colors 256))
                           . (:foreground ,gray8 :distant-foreground ,gray8))))

;;;;; `linum' — Show line numbers in the left margin
  `(linum ((default . (:inherit fringe))
           (((min-colors 16777216)) . (:foreground ,aluminium2))
           (((min-colors 256)) . (:foreground ,gray13))))
  `(linum-leading-zero ((default . (:inherit linum))
                        (((min-colors 16777216))
                         . (:foreground ,aluminium02 :distant-foreground ,aluminium02))
                        (((min-colors 256))
                         . (:foreground ,gray6 :distant-foreground ,gray6))))

;;;;; `tabbar' — Display a tab bar in the header line
  ;; Caveat: The code in `tabbar' that extracts background from this face
  ;; does not handle multiple inheritance.
  `(tabbar-default ((default . (:height 0.9 :inherit yk-ui))
                    (((min-colors 16777216)) . (:background ,aluminium02))
                    (((min-colors 256)) . (:background ,gray8))))
  `(tabbar-highlight ((default . (:underline nil))))
  `(tabbar-button ((default . (:box unspecified))))
  `(tabbar-button-highlight ((default . ())))
  `(tabbar-unselected ((default . (:inherit tabbar-default
                                   :box (:line-width 1 :color ,aluminium1)))))
  `(tabbar-selected ((default . (:inherit tabbar-unselected :foreground unspecified))
                     (((min-colors 16777216)) . (:background ,aluminium01 :overline ,skyblue4))
                     (((min-colors 256)) . (:background ,gray4))))

;;;;; `widget-faces' — Faces used by the widget library
  `(widget-button-pressed ((((min-colors 16777216)) . (:foreground ,scarletred4))
                           (((min-colors 256)) . (:foreground ,rgb511))))
  `(widget-documentation ((((min-colors 16777216)) . (:foreground ,chameleon3))
                          (((min-colors 256)) . (:foreground ,rgb240))))
  `(widget-field ((default . (:inherit yk-ui))))
  `(widget-single-line-field ((default . (:inherit widget-field))))

;;;;; `custom-faces' — Faces used by customize
  `(custom-group-tag-1 ((((type graphic)) . (:inherit variable-pitch :height 1.5))
                        (t . (:weight bold))))
  `(custom-group-tag ((((type graphic)) . (:inherit variable-pitch :height 1.2))
                      (t . (:weight bold))))
  `(custom-variable-tag ((((min-colors 16777216)) . (:foreground ,skyblue4))
                         (((min-colors 256)) . (:foreground ,rgb234))))

  `(custom-button ((default . (:inherit yk-ui :box (:line-width 2 :style released-button)))))
  `(custom-button-mouse ((default . (:inherit custom-button))
                         (((min-colors 16777216)) . (:background ,aluminium02))
                         (((min-colors 256)) . (:background ,gray6))))
  `(custom-button-pressed ((default . (:inherit custom-button
                                       :box (:line-width 2 :style pressed-button)))))
  `(custom-button-unraised ((default . (:inherit underline))))
  `(custom-button-pressed-unraised ((default . (:inherit custom-button-unraised))
                                    (((min-colors 16777216)) . (:foreground ,plum4))
                                    (((min-colors 256)) . (:foreground ,rgb323))))

  `(custom-comment ((default . (:inherit yk-ui))))
  `(custom-comment-tag ((((min-colors 16777216)) . (:foreground ,skyblue4))
                        (((min-colors 256)) . (:foreground ,rgb234))))
  `(custom-state ((((min-colors 16777216)) . (:foreground ,chameleon2))
                  (((min-colors 256)) . (:foreground ,rgb120))))
  `(custom-visibility ((default . (:height 0.8 :inherit link))))

;;;;; `custom-magic-faces' — Faces used by the magic button
  `(custom-changed ((((min-colors 16777216)) . (:background ,skyblue2 :foreground ,white))
                    (((min-colors 256)) . (:background ,rgb012 :foreground ,white))))
  `(custom-invalid ((((min-colors 16777216)) . (:background ,scarletred4 :foreground ,butter4))
                    (((min-colors 256)) . (:background ,rgb511 :foreground ,rgb551))))
  `(custom-modified ((((min-colors 16777216)) . (:background ,skyblue2 :foreground ,white))
                     (((min-colors 256)) . (:background ,rgb012 :foreground ,white))))
  `(custom-rogue ((((min-colors 16777216)) . (:background ,black :foreground ,scarletred5))
                  (((min-colors 256)) . (:background ,rgb000 :foreground ,rgb522))))
  `(custom-set ((((min-colors 16777216)) . (:background ,white :foreground ,skyblue2))
                (((min-colors 256)) . (:background ,rgb555 :foreground ,rgb012))))
  `(custom-themed ((((min-colors 16777216)) . (:background ,skyblue2 :foreground ,white))
                   (((min-colors 256)) . (:background ,rgb012 :foreground ,white))))

;;;;; `eieio-custom'
  `(eieio-custom-slot-tag-face ((((min-colors 16777216)) . (:foreground ,skyblue4))
                                (((min-colors 256)) . (:foreground ,rgb234))))

;;;;; `dired-faces'
  `(dired-header ((default . (:inherit bold))))
  `(dired-directory ((((min-colors 16777216)) . (:foreground ,skyblue4))
                     (((min-colors 256)) . (:foreground ,rgb234))))
  `(dired-symlink ((((min-colors 16777216)) . (:foreground ,orange3))
                    (((min-colors 256)) . (:foreground ,rgb520))))
  `(dired-ignored ((default . (:inherit shadow))))
  `(dired-flagged ((((min-colors 16777216)) . (:foreground ,scarletred4))
                   (((min-colors 256)) . (:foreground ,rgb511))))
  `(dired-mark ((((min-colors 16777216)) . (:foreground ,plum4))
                (((min-colors 256)) . (:foreground ,rgb323))))
  `(dired-marked ((default . (:inherit region))))
  `(dired-perm-write ((((min-colors 16777216)) . (:foreground ,scarletred5))
                      (((min-colors 256)) . (:foreground ,rgb522))))

;;;;; `Dired-Plus'
  `(diredp-dir-heading ((default . (:inherit dired-header))))
  `(diredp-file-name ((default . (:inherit default))))
  `(diredp-file-suffix ((default . (:inherit diredp-file-name))))
  `(diredp-compressed-file-suffix ((((min-colors 16777216)) . (:foreground ,plum4))
                                   (((min-colors 256)) . (:foreground ,rgb323))))
  `(diredp-ignored-file-name ((default . (:inherit dired-ignored))))
  `(diredp-date-time ((((min-colors 16777216)) . (:foreground ,aluminium1))
                      (((min-colors 256)) . (:foreground ,gray8))))
  `(diredp-no-priv ((((min-colors 16777216)) . (:foreground ,aluminium1))
                    (((min-colors 256)) . (:foreground ,gray8))))
  `(diredp-dir-priv ((default . (:inherit dired-directory))))
  `(diredp-symlink ((default . (:inherit dired-symlink))))
  `(diredp-read-priv ((((min-colors 16777216)) . (:foreground ,skyblue4))
                      (((min-colors 256)) . (:foreground ,rgb234))))
  `(diredp-write-priv ((default . (:inherit dired-perm-write))))
  `(diredp-exec-priv ((((min-colors 16777216)) . (:foreground ,chameleon4))
                      (((min-colors 256)) . (:foreground ,rgb251))))
  `(diredp-executable-tag ((default . (:inherit diredp-exec-priv))))
  `(diredp-other-priv ((((min-colors 16777216)) . (:background ,butter4))
                       (((min-colors 256)) . (:background ,rgb551))))
  `(diredp-link-priv ((default . (:inherit diredp-symlink))))
  `(diredp-rare-priv ((((min-colors 16777216)) . (:background ,chameleon2))
                      (((min-colors 256)) . (:background ,rgb120))))
  `(diredp-number ((((min-colors 16777216)) . (:foreground ,aluminium2))
                   (((min-colors 256)) . (:foreground ,gray13))))
  `(diredp-deletion ((default  . (:inherit dired-flagged))))
  `(diredp-deletion-file-name ((default . (:inherit diredp-deletion))))
  `(diredp-flag-mark ((default . (:inherit dired-mark))))
  `(diredp-flag-mark-line ((default . (:inherit dired-marked))))
  `(diredp-display-msg ((((min-colors 16777216)) . (:foreground ,skyblue4))
                        (((min-colors 256)) . (:foreground ,rgb234))))
  `(diredp-mode-line-flagged ((default . (:inherit diredp-deletion))))
  `(diredp-mode-line-marked ((((min-colors 16777216)) . (:foreground ,plum4))
                             (((min-colors 256)) . (:foreground ,rgb323))))

;;;;; `magit-faces' — Controlling Git from Emacs — General UI
  `(magit-dimmed ((default . (:inherit shadow))))
  `(magit-filename ((default . (:weight normal))))
  `(magit-process-ng ((default . (:inherit (error magit-section-heading)))))
  `(magit-process-ok ((default . (:inherit (success magit-section-heading)))))
  `(magit-signature-bad ((((min-colors 16777216)) . (:foreground ,scarletred4))
                        (((min-colors 256)) . (:foreground ,rgb511))))
  `(magit-signature-good ((((min-colors 16777216)) . (:foreground ,chameleon2))
                          (((min-colors 256)) . (:foreground ,rgb120))))
  `(magit-signature-untrusted ((((min-colors 16777216)) . (:foreground ,orange3))
                               (((min-colors 256)) . (:foreground ,rgb520))))

;;;;; `magit-faces' — Controlling Git from Emacs — Commit references
  `(magit-hash ((default . (:inherit shadow))))
  `(magit-branch-local ((((min-colors 16777216)) . (:foreground ,chameleon4 :background ,chameleon-bg
                                                    :box (:line-width -1 :color ,chameleon4)))
                        (((min-colors 256)) . (:foreground ,rgb251 :background ,rgb000))))
  `(magit-branch-current ((default . (:inherit (bold magit-branch-local)))))
  `(magit-branch-remote ((((min-colors 16777216)) . (:foreground ,orange4 :background ,orange-bg
                                                     :box (:line-width -1 :color ,orange4)))
                         (((min-colors 256)) . (:foreground ,rgb530 :background ,rgb000))))
  `(magit-tag ((((min-colors 16777216)) . (:foreground ,butter4 :background ,butter-bg
                                           :box (:line-width -1 :color ,butter2)))
               (((min-colors 256)) . (:foreground ,rgb551 :background ,rgb000))))
  `(magit-bisect-bad ((((min-colors 16777216)) . (:foreground ,plum4 :background ,plum-bg
                                                  :box (:line-width -1 :color ,plum4)))
                      (((min-colors 256)) . (:foreground ,rgb323 :background ,rgb000))))
  `(magit-bisect-good ((((min-colors 16777216)) . (:foreground ,skyblue4 :background ,skyblue-bg
                                                   :box (:line-width -1 :color ,skyblue4)))
                       (((min-colors 256)) . (:foreground ,rgb234 :background ,rgb000))))
  `(magit-bisect-skip ((((min-colors 16777216)) . (:foreground ,chocolate3 :background ,chocolate-bg
                                                   :box (:line-width -1 :color ,chocolate4)))
                       (((min-colors 256)) . (:foreground ,rgb420 :background ,rgb000))))
  `(magit-refname ((((min-colors 16777216)) . (:foreground ,aluminium3 :background ,black
                                               :box (:line-width -1 :color ,aluminium4)))
                   (((min-colors 256)) . (:foreground ,gray18 :background ,rgb000))))

;;;;; `magit-faces' — Controlling Git from Emacs — Cherrypicking
  `(magit-cherry-equivalent ((((min-colors 16777216)) . (:foreground ,plum4))
                             (((min-colors 256)) . (:foreground ,rgb323))))
  `(magit-cherry-unmatched ((((min-colors 16777216)) . (:foreground ,skyblue4))
                            (((min-colors 256)) . (:foreground ,rgb234))))

;;;;; `magit-faces' — Controlling Git from Emacs — Blame
  `(magit-blame-heading ((default . (:inherit (shadow default)))
                         (((min-colors 16777216)) . (:background ,aluminium01))
                         (((min-colors 256)) . (:background ,gray5))))

;;;;; `magit-faces' — Controlling Git from Emacs — Log
  `(magit-log-author ((default . (:inherit yk-normal))))
  `(magit-log-date ((default . (:inherit shadow))))
  `(magit-log-graph ((default . (:inherit yk-normal))))
  `(magit-reflog-amend ((((min-colors 16777216)) . (:foreground ,plum4))
                        (((min-colors 256)) . (:foreground ,rgb323))))
  `(magit-reflog-checkout ((((min-colors 16777216)) . (:foreground ,skyblue4))
                           (((min-colors 256)) . (:foreground ,rgb234))))
  `(magit-reflog-cherry-pick ((((min-colors 16777216)) . (:foreground ,chameleon3))
                              (((min-colors 256)) . (:foreground ,rgb240))))
  `(magit-reflog-commit ((((min-colors 16777216)) . (:foreground ,chameleon3))
                         (((min-colors 256)) . (:foreground ,rgb240))))
  `(magit-reflog-merge ((((min-colors 16777216)) . (:foreground ,chameleon3))
                        (((min-colors 256)) . (:foreground ,rgb240))))
  `(magit-reflog-other ((((min-colors 16777216)) . (:foreground ,skyblue4))
                        (((min-colors 256)) . (:foreground ,rgb234))))
  `(magit-reflog-rebase ((((min-colors 16777216)) . (:foreground ,plum4))
                         (((min-colors 256)) . (:foreground ,rgb323))))
  `(magit-reflog-remote ((((min-colors 16777216)) . (:foreground ,skyblue5))
                         (((min-colors 256)) . (:foreground ,rgb345))))
  `(magit-reflog-reset ((((min-colors 16777216)) . (:foreground ,scarletred4))
                        (((min-colors 256)) . (:foreground ,rgb511))))
;;;;; `magit-faces' — Controlling Git from Emacs — Rebase
  `(magit-sequence-done ((default . (:inherit magit-hash))))
  `(magit-sequence-drop ((((min-colors 16777216)) . (:foreground ,scarletred4))
                         (((min-colors 256)) . (:foreground ,rgb511))))
  `(magit-sequence-head ((((min-colors 16777216)) . (:foreground ,skyblue4))
                         (((min-colors 256)) . (:foreground ,rgb234))))
  `(magit-sequence-onto ((default . (:inherit magit-sequence-done))))
  `(magit-sequence-part ((((min-colors 16777216)) . (:foreground ,chocolate3))
                         (((min-colors 256)) . (:foreground ,rgb420))))
  `(magit-sequence-pick ((default . (:inherit default))))
  `(magit-sequence-stop ((((min-colors 16777216)) . (:foreground ,chameleon3))
                         (((min-colors 256)) . (:foreground ,rgb240))))

;;;;; `hydra'
  `(hydra-face-red ((((min-colors 16777216)) . (:foreground ,scarletred4))
                    (((min-colors 256)) . (:foreground ,rgb511))))
  `(hydra-face-blue ((((min-colors 16777216)) . (:foreground ,skyblue4))
                     (((min-colors 256)) . (:foreground ,rgb234))))
  `(hydra-face-amaranth ((((min-colors 16777216)) . (:foreground ,orange4))
                         (((min-colors 256)) . (:foreground ,rgb530))))
  `(hydra-face-teal ((((min-colors 16777216)) . (:foreground ,chameleon3))
                     (((min-colors 256)) . (:foreground ,rgb240))))
  `(hydra-face-pink ((((min-colors 16777216)) . (:foreground ,plum4))
                     (((min-colors 256)) . (:foreground ,rgb323))))
;;;;; `ruler-mode' — Display a ruler in the header line
  `(ruler-mode-default ((default . (:inherit (shadow yk-ui)
                                    :box (:line-width 1 :style released-button)))))
  `(ruler-mode-current-column ((default . (:inherit ruler-mode-default :weight bold))
                               (((min-colors 16777216)) . (:foreground ,butter3))
                               (((min-colors 256)) . (:foreground ,rgb540))))
  `(ruler-mode-goal-column ((default . (:inherit ruler-mode-default))
                            (((min-colors 16777216)) . (:foreground ,scarletred4))
                            (((min-colors 256)) . (:foreground ,rgb511))))
  `(ruler-mode-comment-column ((default . (:inherit ruler-mode-default))
                               (((min-colors 16777216)) . (:foreground ,scarletred4))
                               (((min-colors 256)) . (:foreground ,rgb511))))
  `(ruler-mode-fill-column ((default . (:inherit ruler-mode-default))
                            (((min-colors 16777216)) . (:foreground ,scarletred4))
                            (((min-colors 256)) . (:foreground ,rgb511))))
  `(ruler-mode-tab-stop ((default . (:inherit ruler-mode-default))
                         (((min-colors 16777216)) . (:foreground ,skyblue4))
                         (((min-colors 256)) . (:foreground ,rgb234))))
  `(ruler-mode-fringes ((default . (:inherit ruler-mode-default))
                        (((min-colors 16777216)) . (:foreground ,chameleon1))
                        (((min-colors 256)) . (:foreground ,rgb010))))
  `(ruler-mode-margins ((default . (:inherit ruler-mode-default))
                        (((min-colors 16777216)) . (:foreground ,white))
                        (((min-colors 256)) . (:foreground ,rgb555))))
  `(ruler-mode-pad ((default . (:inherit ruler-mode-default))
                    (((min-colors 16777216)) . (:background ,aluminium3))
                    (((min-colors 256)) . (:background ,gray18))))
;;;;; `speedbar-faces' — File and tag browser frame
  `(yk-speedbar ((default . (:height 0.8))))
  `(speedbar-button-face ((default . (:inherit yk-speedbar))
                          (((min-colors 16777216)) . (:foreground ,chameleon3))
                          (((min-colors 256)) . (:foreground ,rgb240))))
  `(speedbar-directory-face ((default . (:inherit yk-speedbar))
                             (((min-colors 16777216)) . (:foreground ,skyblue4))
                             (((min-colors 256)) . (:foreground ,rgb234))))
  `(speedbar-file-face ((default . (:inherit yk-speedbar))))
  `(speedbar-highlight-face ((default . (:inherit highlight))))
  `(speedbar-selected-face ((default . (:inherit (bold yk-speedbar)))))
  `(speedbar-separator-face ((default . (:inherit yk-speedbar :height 1.25 :weight bold))))
  `(speedbar-tag-face ((default . (:inherit yk-speedbar))
                       (((min-colors 16777216)) . (:foreground ,chocolate3))
                       (((min-colors 256)) . (:foreground ,rgb420))))
;;;; Application modes
;;;;; `calendar-faces'
  `(calendar-today ((default . (:inherit bold))))
  `(diary ((((min-colors 16777216)) . (:foreground ,orange3))
           (((min-colors 256)) . (:foreground ,rgb520))))
  `(holiday ((((min-colors 16777216)) . (:foreground ,scarletred4))
             (((min-colors 256)) . (:foreground ,rgb511))))
;;;;; `info'
  `(info-menu-star ((((min-colors 16777216)) . (:foreground ,plum4))
                    (((min-colors 256)) . (:foreground ,rgb323))))
  `(info-node ((((min-colors 16777216)) . (:foreground ,chocolate3))
               (((min-colors 256)) . (:foreground ,rgb420))))
  `(info-title-1 ((default . (:inherit info-title-2 :height 1.2))))
  `(info-title-2 ((default . (:inherit info-title-3 :height 1.2))))
  `(info-title-3 ((default . (:inherit info-title-4 :height 1.2))))
  `(info-title-4 ((default . (:inherit variable-pitch :weight bold))))
  `(Info-quoted ((default . (:inherit font-lock-builtin-face))))
;;;; End
  )

;;; Variable customizations
(custom-theme-set-variables 'yk-tango-light
  `(highlight-changes-colors (,plum3 ,skyblue3 ,chameleon3 ,chocolate3 ,orange3 ,butter3))
  `(ansi-color-names-vector ,(vector black scarletred2 chameleon2 butter2
                                     skyblue2 plum2 chocolate2 aluminium3))
  `(ansi-color-map ,(ansi-color-make-color-map)))

(provide-theme 'yk-tango-dark)
