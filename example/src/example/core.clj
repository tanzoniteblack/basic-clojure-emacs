(ns example.core)

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

;; the util library here! C-c C-m a r  (add require)
;; and type example.util :refer [bar]
;; then C-g to return here

(bar) ;; where else is this function used? C-c C-m f u (thats "find usages" (unless your're mad at the function ;))

