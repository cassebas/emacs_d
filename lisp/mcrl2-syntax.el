(require 'generic-x)

(define-generic-mode
  'mcrl2-syntax
  '("%")
  '("proc" "init" "var" "act" "sort" "map" "eqn" "sum" "Pos" "Nat" "Int")
  '(("=" . 'font-lock-operator)
    ("+" . 'font-lock-operator)
    ("." . 'font-lock-operator)
    ("|" . 'font-lock-operator)
    ("||" . 'font-lock-operator)
    ("&&" . 'font-lock-operator)
    ("false" . 'font-lock-keyword-face)
    ("true" . 'font-lock-keyword-face)
    (";" . 'font-lock-builtin))
  '("\\.mcrl2$")
  nil
  "mCRL2 syntax highlighting mode"
)

(provide 'mcrl2-syntax)

