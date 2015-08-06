(ns example.core-test
  (:require [clojure.test :refer :all]
            [example.core :refer :all]))

;; Type C-c , (cider-test-run-tests) to run all tests in buffer and highlight
;; failures
(deftest a-test
  (testing "FIXME, I fail."
    (is (= 0 1)))
  (testing "Squiggly clojure highlights common testing errors"
    (= "cat" "dog")
    (is (= "cat"))))
