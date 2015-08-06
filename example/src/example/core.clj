(ns example.core
  (:require [example.util :as util]))

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

;; the util library here! C-c C-m a r  (cljr-add-require-to-ns)
;; and type example.util :refer [bar]
;; then tab to return here

(bar 8) ;; where else is this function used? C-c C-m f u (cljr-find-usages)
;; that's "find usages" (unless your're mad at the function )
