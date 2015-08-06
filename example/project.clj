(defproject example "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Eclipse Public License"
            :url "http://www.eclipse.org/legal/epl-v10.html"}
  :dependencies [[org.clojure/clojure "1.7.0"]])

(comment 
  ;; first start a repl with C-c M-j (cider-jack-in)
  ;; lets start by jumping to a more interesting file:
  ;; projectile takes the mental overhead away form this
  ;; just try and remember some part of the file name.

  C-c p f (projectile-find-file)
  core.clj

  ;; PS: install clj-refactor middleware
)
