;; manifest.scm
(use-modules (guix build-system gnu)
             (ice-9 match))

(define stdenv
  (map (lambda* (pkg)
         (match pkg
           ((_ value _ ...)
            value)))
    (standard-packages)))

(concatenate-manifests
  (list
    (specifications->manifest
      (list
        "bash"
        "gcc-toolchain"
        "which"

        "cmake"))
        
    (packages->manifest stdenv)))

