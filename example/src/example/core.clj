(ns example.core)

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

;; the util library here! C-c C-m a r  (cljr-add-require-to-ns)
;; and type example.util :as util
;; then tab to return here

(util/bar 8) ;; where else is this function used? C-c C-m f u (cljr-find-usages)
;-) that's "find usages" (unless your're mad at the function)
