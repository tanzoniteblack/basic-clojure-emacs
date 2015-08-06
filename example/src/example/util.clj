(ns example.util)

(defn bar [x]
  "im a dock string in the wrong place
   you should not have to remember this in a modern clojure setup because
   squiggley clojure will remind you"
  (let [start (System/nanoTime)]    ;; is nanoTime the right function?
    ;; C-c C-d d (cider-doc) to view the javadoc, or We can jump to the Java source and read it C-,
    ;; look! some duplicate code, let's refactor!
    ;; put the cursor at the start of the duplicate code
    ;; C-c C-m m l (cljr-move-to-let), type the name and hit C-g
    (println "first"  (+ (rem start 42) 9) x)
    (println "second" (+ (rem start 42) 9) x))) ;; lets add a break-point here C-u C-M-x

;; lets debug this!
;; hit C-u C-M-x (cider-eval-defun-at-point with univeral arg)
(->> 4
     range
     (map #(* 2 % %))
     (reduce +))

;; now call bar and explore the debugger
(bar 7)

;; Notice this usage of `bar` doesn't show up in find usages
(let [bar "cat"]
  bar)

;; and back to core, (and watch smex cycle through the buffers with C-s)
