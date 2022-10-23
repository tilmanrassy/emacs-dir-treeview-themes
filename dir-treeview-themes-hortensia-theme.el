;;; dir-treeview-themes-hortensia-theme.el --- A dir-treeview theme with icons based on the Oxygen icon set -*- lexical-binding: t -*-

;; Copyright (C) 2022 Tilman Rassy <tilman.rassy@googlemail.com>

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; A theme for the "dir-treeview" package.  Uses pixmap icons from the "Oxygen"
;; icon set (see https://github.com/KDE/oxygen-icons5).
;;
;; The theme is suitable for graphical displays only.  Thus, on text displays
;; all settings of the theme are ignored, and the theme has no effect.

;;; Code:

(require 'dir-treeview)

(deftheme dir-treeview-themes-hortensia
  "A dir-treeview theme with icons based on the Oxygen icon set.")
  
(custom-theme-set-variables
 'dir-treeview-themes-hortensia
 '(dir-treeview-icon-margin-right  " ")
 '(dir-treeview-default-icon                                 "image hortensia/application-x-zerosize.png")
 '(dir-treeview-folded-dir-icon                              "image hortensia/folder.png")
 '(dir-treeview-expanded-dir-icon                            "image hortensia/folder-open.png")
 '(dir-treeview-special-icons
   '((dir-treeview-is-image-p                             .  "image hortensia/image-x-generic.png")
     (dir-treeview-is-audio-p                             .  "image hortensia/audio-x-generic.png")
     (dir-treeview-is-video-p                             .  "image hortensia/video-x-generic.png")
     ("\\(?:\\.tar\\.\\(?:gz\\|bz2\\|xz\\)\\|\\.tgz\\)$"  .  "image hortensia/application-x-compressed-tar.png")
     ("\\.gz$"                                            .  "image hortensia/application-x-gzip.png")
     (dir-treeview-is-archive-p                           .  "image hortensia/application-x-ar.png")
     (file-executable-p                                   .  "image hortensia/application-x-executable.png")
     ("\\.pdf$"                                           .  "image hortensia/application-pdf.png")
     ("\\.deb$"                                           .  "image hortensia/application-x-deb.png")
     ("\\.rpm$"                                           .  "image hortensia/application-x-rpm.png")
     ("\\.\\(?:afm\\|pfa\\)$"                             .  "image hortensia/application-x-font-afm.png")
     ("\\.otf$"                                           .  "image hortensia/application-x-font-otf.png")
     ("\\.ttf$"                                           .  "image hortensia/application-x-font-ttf.png")
     ("\\.java$"                                          .  "image hortensia/application-x-java.png")
     ("\\.jar$"                                           .  "image hortensia/application-x-java-archive.png")
     ("\\.js$"                                            .  "image hortensia/application-x-javascript.png")
     ("\\.pl$"                                            .  "image hortensia/application-x-perl.png")
     ("\\.php$"                                           .  "image hortensia/application-x-php.png")
     ("\\.\\(?:sh\\|bashrc\\)$"                           .  "image hortensia/application-x-shellscript.png")
     ("\\.so\\(?:\\.[0-9._-]\\)?$"                        .  "image hortensia/application-x-sharedlib.png")
     ("\\.xml$"                                           .  "image hortensia/application-xml.png")
     ("\\.html$"                                          .  "image hortensia/text-html.png")
     ("\\.txt$"                                           .  "image hortensia/text-plain.png")
     ("\\.\\(hpp\\|h++\\)$"                               .  "image hortensia/text-x-c++hdr.png")
     ("\\.\\(cpp\\|c++\\)$"                               .  "image hortensia/text-x-c++src.png")
     ("\\.h$"                                             .  "image hortensia/text-x-chdr.png")
     ("\\.c$"                                             .  "image hortensia/text-x-csrc.png")
     ("\\.py$"                                            .  "image hortensia/text-x-python.png")
     ("\\.sql$"                                           .  "image hortensia/text-x-sql.png")
     ("\\.tex$"                                           .  "image hortensia/text-x-tex.png")
     ("\\.el$"                                            .  "image hortensia/text-x-el.png")
     ("\\.elc$"                                           .  "image hortensia/application-x-elc.png")
     ("\\.o$"                                             .  "image hortensia/application-x-cobj.png")
     ("\\.\\(?:odt\\|doc\\|docx\\)$"                      .  "image hortensia/x-office-document.png")
     ("\\.\\(?:ods\\|xls\\|xlsx\\)$"                      .  "image hortensia/application-x-spreadsheet.png")
     ("\\.\\(?:odp\\|pp|\\ppx\\)$"                        .  "image hortensia/application-x-presentation.png")
     ("\\.odg$"                                           .  "image hortensia/application-vnd.stardivision.draw.png") )))

(custom-theme-set-faces
 'dir-treeview-themes-hortensia
 '(dir-treeview-control-face         ((((type graphic)) . (:foreground "gray40"))))
 '(dir-treeview-indent-face          ((((type graphic)) . (:foreground "gray40"))))
 '(dir-treeview-directory-face       ((((type graphic)) . (:inherit dir-treeview-default-filename-face))))
 '(dir-treeview-symlink-face         ((((type graphic)) . (:inherit dir-treeview-default-filename-face :slant italic))))
 '(dir-treeview-executable-face      ((((type graphic)) . (:inherit dir-treeview-default-filename-face))))
 '(dir-treeview-archive-face         ((((type graphic)) . (:inherit dir-treeview-default-filename-face))))
 '(dir-treeview-image-face           ((((type graphic)) . (:inherit dir-treeview-default-filename-face))))
 '(dir-treeview-audio-face           ((((type graphic)) . (:inherit dir-treeview-default-filename-face))))
 '(dir-treeview-video-face           ((((type graphic)) . (:inherit dir-treeview-default-filename-face)))))

(provide-theme 'dir-treeview-themes-hortensia)

(provide 'dir-treeview-themes-hortensia)

;;; dir-treeview-themes-hortensia-theme.el ends here
