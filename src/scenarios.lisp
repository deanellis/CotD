(in-package :cotd)

;;---------------------------------
;; SCENARIO-FEATURE-TYPE Constants
;;---------------------------------

(defconstant +scenario-feature-weather+ 0)
(defconstant +scenario-feature-city-layout+ 1)
(defconstant +scenario-feature-player-faction+ 2)

;;---------------------------------
;; SCENARIO-FEATURE Constants
;;---------------------------------

(defconstant +weather-type-clear+ 0)
(defconstant +weather-type-snow+ 1)
(defconstant +city-layout-test+ 2)
(defconstant +city-layout-normal+ 3)
(defconstant +city-layout-river+ 4)
(defconstant +city-layout-port+ 5)
(defconstant +player-faction-player+ 6)
(defconstant +player-faction-test+ 7)
(defconstant +player-faction-angels+ 8)
(defconstant +player-faction-demons+ 9)
(defconstant +city-layout-forest+ 10)
(defconstant +city-layout-island+ 11)
(defconstant +player-faction-military+ 12)

(defparameter *scenario-features* (make-array (list 0) :adjustable t))

(defstruct (scenario-feature (:conc-name sf-))
  (id)
  (name)
  (type)
  (debug nil :type boolean)
  (disabled nil :type boolean)
  (func nil))

(defun set-scenario-feature (scenario-feature)
  (when (>= (sf-id scenario-feature) (length *scenario-features*))
    (adjust-array *scenario-features* (list (1+ (sf-id scenario-feature)))))
  (setf (aref *scenario-features* (sf-id scenario-feature)) scenario-feature))

(defun get-scenario-feature-by-id (scenario-feature-id)
  (aref *scenario-features* scenario-feature-id))

(defun get-all-scenario-features-by-type (scenario-feature-type-id &optional (include-debug t))
  (loop for sf across *scenario-features*
        when (or (and (= (sf-type sf) scenario-feature-type-id)
                      include-debug
                      (not (sf-disabled sf)))
                 (and (= (sf-type sf) scenario-feature-type-id)
                      (not include-debug)
                      (not (sf-debug sf))
                      (not (sf-disabled sf))))
          collect (sf-id sf)))

;;---------------------------------
;; Auxuliary scenario functions
;;---------------------------------

(defun place-city-river-e (reserved-level)
  (let ((max-x (1- (truncate (array-dimension reserved-level 0) 2)))
        (min-x 0))
    (loop for x from min-x below max-x
          for building-type-id = (if (and (zerop (mod (1+ x) 4))
                                        (/= x (1- max-x)))
                                   +building-city-bridge+
                                   +building-city-river+)
          do
             (setf (aref reserved-level x (1- (truncate (array-dimension reserved-level 1) 2))) building-type-id)
             (setf (aref reserved-level x (truncate (array-dimension reserved-level 1) 2)) building-type-id))))

(defun place-city-river-w (reserved-level)
  (let ((max-x (array-dimension reserved-level 0))
        (min-x (1- (truncate (array-dimension reserved-level 0) 2))))
    (loop for x from (+ min-x 2) below max-x
          for building-type-id = (if (and (zerop (mod (1+ (- x min-x)) 4))
                                        (/= x (1- max-x)))
                                   +building-city-bridge+
                                   +building-city-river+)
          do
             (setf (aref reserved-level x (1- (truncate (array-dimension reserved-level 1) 2))) building-type-id)
             (setf (aref reserved-level x (truncate (array-dimension reserved-level 1) 2)) building-type-id))))
           
(defun place-city-river-n (reserved-level)
  (let ((max-y (1- (truncate (array-dimension reserved-level 1) 2)))
        (min-y 0))
    (loop for y from min-y below max-y
          for building-type-id = (if (and (zerop (mod (1+ y) 4))
                                        (/= y (1- max-y)))
                                   +building-city-bridge+
                                   +building-city-river+)
          do
             (setf (aref reserved-level (truncate (array-dimension reserved-level 0) 2) y) building-type-id)
             (setf (aref reserved-level (1- (truncate (array-dimension reserved-level 0) 2)) y) building-type-id))))

(defun place-city-river-s (reserved-level)
  (let ((max-y (array-dimension reserved-level 1))
        (min-y (1- (truncate (array-dimension reserved-level 1) 2))))
    (loop for y from (+ min-y 2) below max-y
          for building-type-id = (if (and (zerop (mod (1+ (- y min-y)) 4))
                                        (/= y (1- max-y)))
                                   +building-city-bridge+
                                   +building-city-river+)
          do
             (setf (aref reserved-level (truncate (array-dimension reserved-level 0) 2) y) building-type-id)
             (setf (aref reserved-level (1- (truncate (array-dimension reserved-level 0) 2)) y) building-type-id))))

(defun place-city-river-center (reserved-level)
  (let ((x (1- (truncate (array-dimension reserved-level 0) 2)))
        (y (1- (truncate (array-dimension reserved-level 1) 2))))
    
    (setf (aref reserved-level (+ x 0) (+ y 0)) +building-city-river+)
    (setf (aref reserved-level (+ x 1) (+ y 0)) +building-city-river+)
    (setf (aref reserved-level (+ x 0) (+ y 1)) +building-city-river+)
    (setf (aref reserved-level (+ x 1) (+ y 1)) +building-city-river+)))

(defun change-level-to-snow (template-level)
  (loop for x from 0 below (array-dimension template-level 0) do
    (loop for y from 0 below (array-dimension template-level 1) do
      (cond
        ((= (aref template-level x y) +terrain-border-floor+) (setf (aref template-level x y) +terrain-border-floor-snow+))
        ((= (aref template-level x y) +terrain-border-grass+) (setf (aref template-level x y) +terrain-border-floor-snow+))
        ((= (aref template-level x y) +terrain-floor-dirt+) (setf (aref template-level x y) +terrain-floor-snow+))
        ((= (aref template-level x y) +terrain-floor-dirt-bright+) (setf (aref template-level x y) +terrain-floor-snow+))
        ((= (aref template-level x y) +terrain-floor-grass+) (setf (aref template-level x y) +terrain-floor-snow+))
        ((= (aref template-level x y) +terrain-tree-birch+) (setf (aref template-level x y) +terrain-tree-birch-snow+))
        ((= (aref template-level x y) +terrain-water-lake+) (setf (aref template-level x y) +terrain-water-ice+)))))
  template-level)

(defun get-max-buildings-normal ()
  (let ((max-building-types (make-hash-table)))
    (setf (gethash +building-type-church+ max-building-types) 1)
    (setf (gethash +building-type-satanists+ max-building-types) 1)
    (setf (gethash +building-type-warehouse+ max-building-types) 1)
    (setf (gethash +building-type-library+ max-building-types) 1)
    (setf (gethash +building-type-prison+ max-building-types) 1)
    (setf (gethash +building-type-lake+ max-building-types) 4)
    max-building-types))

(defun get-reserved-buildings-normal ()
  (let ((reserved-building-types (make-hash-table)))
    (setf (gethash +building-type-church+ reserved-building-types) 1)
    (setf (gethash +building-type-satanists+ reserved-building-types) 1)
    (setf (gethash +building-type-warehouse+ reserved-building-types) 1)
    (setf (gethash +building-type-library+ reserved-building-types) 1)
    (setf (gethash +building-type-prison+ reserved-building-types) 1)
    (setf (gethash +building-type-lake+ reserved-building-types) 2)
    reserved-building-types))

(defun get-max-buildings-river ()
  (let ((max-building-types (make-hash-table)))
    (setf (gethash +building-type-church+ max-building-types) 1)
    (setf (gethash +building-type-satanists+ max-building-types) 1)
    (setf (gethash +building-type-warehouse+ max-building-types) 1)
    (setf (gethash +building-type-library+ max-building-types) 1)
    (setf (gethash +building-type-prison+ max-building-types) 1)
    (setf (gethash +building-type-lake+ max-building-types) 0)
    max-building-types))

(defun get-reserved-buildings-river ()
  (let ((reserved-building-types (make-hash-table)))
    (setf (gethash +building-type-church+ reserved-building-types) 1)
    (setf (gethash +building-type-satanists+ reserved-building-types) 1)
    (setf (gethash +building-type-warehouse+ reserved-building-types) 1)
    (setf (gethash +building-type-library+ reserved-building-types) 1)
    (setf (gethash +building-type-prison+ reserved-building-types) 1)
    (setf (gethash +building-type-lake+ reserved-building-types) 0)
    reserved-building-types))

(defun place-reserved-buildings-river (reserved-level)
  (let ((result) (r) (n nil) (s nil) (w nil) (e nil))
    (setf r (random 11))
    (cond
      ((= r 0) (setf w t e t))           ;; 0 - we
      ((= r 1) (setf n t s t))           ;; 1 - ns
      ((= r 2) (setf n t e t))           ;; 2 - ne
      ((= r 3) (setf n t w t))           ;; 3 - nw
      ((= r 4) (setf s t e t))           ;; 4 - se
      ((= r 5) (setf s t w t))           ;; 5 - sw
      ((= r 6) (setf n t w t e t))       ;; 6 - nwe
      ((= r 7) (setf s t w t e t))       ;; 7 - swe
      ((= r 8) (setf n t s t e t))       ;; 8 - nse
      ((= r 9) (setf n t s t w t))       ;; 9 - nsw
      ((= r 10) (setf n t s t w t e t))) ;; 10 - nswe
    
    (when n (place-city-river-n reserved-level))
    (when s (place-city-river-s reserved-level))
    (when w (place-city-river-w reserved-level))
    (when e (place-city-river-e reserved-level))
    (place-city-river-center reserved-level)
    
    (loop for x from 0 below (array-dimension reserved-level 0) do
      (loop for y from 0 below (array-dimension reserved-level 1) do
        (when (or (= (aref reserved-level x y) +building-city-river+)
                  (= (aref reserved-level x y) +building-city-bridge+))
          (push (list (aref reserved-level x y) x y) result))))
    result))

(defun get-max-buildings-port ()
  (let ((max-building-types (make-hash-table)))
    (setf (gethash +building-type-church+ max-building-types) 1)
    (setf (gethash +building-type-satanists+ max-building-types) 1)
    (setf (gethash +building-type-warehouse+ max-building-types) 0)
    (setf (gethash +building-type-library+ max-building-types) 1)
    (setf (gethash +building-type-prison+ max-building-types) 1)
    (setf (gethash +building-type-lake+ max-building-types) 0)
    max-building-types))

(defun get-reserved-buildings-port ()
  (let ((reserved-building-types (make-hash-table)))
    (setf (gethash +building-type-church+ reserved-building-types) 1)
    (setf (gethash +building-type-satanists+ reserved-building-types) 1)
    (setf (gethash +building-type-warehouse+ reserved-building-types) 0)
    (setf (gethash +building-type-library+ reserved-building-types) 1)
    (setf (gethash +building-type-prison+ reserved-building-types) 1)
    (setf (gethash +building-type-lake+ reserved-building-types) 0)
    reserved-building-types))

(defun place-reserved-buildings-port-n (reserved-level)
  (let ((result))
    (loop for x from 0 below (array-dimension reserved-level 0)
          for building-type-id = (if (and (zerop (mod (1+ x) 5))
                                          (/= x (1- (array-dimension reserved-level 0))))
                                   +building-city-pier+
                                   +building-city-sea+)
          for random-warehouse-1 = (if (zerop (random 2))
                                     +building-city-warehouse-port-1+
                                     +building-city-warehouse-port-2+)
          for random-warehouse-2 = (if (zerop (random 2))
                                     +building-city-warehouse-port-1+
                                     +building-city-warehouse-port-2+)
          do
             (setf (aref reserved-level x 0) +building-city-sea+)
             (setf (aref reserved-level x 1) building-type-id)
             (setf (aref reserved-level x 2) building-type-id)
             (when (level-city-can-place-build-on-grid random-warehouse-1 x 3 reserved-level)
               (level-city-reserve-build-on-grid random-warehouse-1 x 3 reserved-level)
               (push (list random-warehouse-1 x 3) result))
             (when (level-city-can-place-build-on-grid random-warehouse-2 x 5 reserved-level)
               (level-city-reserve-build-on-grid random-warehouse-2 x 5 reserved-level)
               (push (list random-warehouse-2 x 5) result)))
    
    (loop for x from 0 below (array-dimension reserved-level 0) do
      (loop for y from 0 below (array-dimension reserved-level 1) do
        (when (or (= (aref reserved-level x y) +building-city-sea+)
                  (= (aref reserved-level x y) +building-city-pier+))
          (push (list (aref reserved-level x y) x y) result))))
    result))

(defun place-reserved-buildings-port-s (reserved-level)
  (let ((result) (max-y (1- (array-dimension reserved-level 1))))
    (loop for x from 0 below (array-dimension reserved-level 0)
          for building-type-id = (if (and (zerop (mod (1+ x) 5))
                                          (/= x (1- (array-dimension reserved-level 0))))
                                   +building-city-pier+
                                   +building-city-sea+)
          for random-warehouse-1 = (if (zerop (random 2))
                                     +building-city-warehouse-port-1+
                                     +building-city-warehouse-port-2+)
          for random-warehouse-2 = (if (zerop (random 2))
                                     +building-city-warehouse-port-1+
                                     +building-city-warehouse-port-2+)
          do
             (setf (aref reserved-level x (- max-y 0)) +building-city-sea+)
             (setf (aref reserved-level x (- max-y 1)) building-type-id)
             (setf (aref reserved-level x (- max-y 2)) building-type-id)
             (when (level-city-can-place-build-on-grid random-warehouse-1 x (- max-y 4) reserved-level)
               (level-city-reserve-build-on-grid random-warehouse-1 x (- max-y 4) reserved-level)
               (push (list random-warehouse-1 x (- max-y 4)) result))
             (when (level-city-can-place-build-on-grid random-warehouse-2 x (- max-y 6) reserved-level)
               (level-city-reserve-build-on-grid random-warehouse-2 x (- max-y 6) reserved-level)
               (push (list random-warehouse-2 x (- max-y 6)) result)))
    
    (loop for x from 0 below (array-dimension reserved-level 0) do
      (loop for y from 0 below (array-dimension reserved-level 1) do
        (when (or (= (aref reserved-level x y) +building-city-sea+)
                  (= (aref reserved-level x y) +building-city-pier+))
          (push (list (aref reserved-level x y) x y) result))))
    result))

(defun place-reserved-buildings-port-e (reserved-level)
  (let ((result) (max-x (1- (array-dimension reserved-level 0))))
    (loop for y from 0 below (array-dimension reserved-level 1)
          for building-type-id = (if (and (zerop (mod (1+ y) 5))
                                          (/= y (1- (array-dimension reserved-level 1))))
                                   +building-city-pier+
                                   +building-city-sea+)
          for random-warehouse-1 = (if (zerop (random 2))
                                     +building-city-warehouse-port-1+
                                     +building-city-warehouse-port-2+)
          for random-warehouse-2 = (if (zerop (random 2))
                                     +building-city-warehouse-port-1+
                                     +building-city-warehouse-port-2+)
          do
             (setf (aref reserved-level (- max-x 0) y) +building-city-sea+)
             (setf (aref reserved-level (- max-x 1) y) building-type-id)
             (setf (aref reserved-level (- max-x 2) y) building-type-id)
             (when (level-city-can-place-build-on-grid random-warehouse-1 (- max-x 4) y reserved-level)
               (level-city-reserve-build-on-grid random-warehouse-1 (- max-x 4) y reserved-level)
               (push (list random-warehouse-1 (- max-x 4) y) result))
             (when (level-city-can-place-build-on-grid random-warehouse-2 (- max-x 6) y reserved-level)
               (level-city-reserve-build-on-grid random-warehouse-2 (- max-x 6) y reserved-level)
               (push (list random-warehouse-2 (- max-x 6) y) result)))
    
    (loop for x from 0 below (array-dimension reserved-level 0) do
      (loop for y from 0 below (array-dimension reserved-level 1) do
        (when (or (= (aref reserved-level x y) +building-city-sea+)
                  (= (aref reserved-level x y) +building-city-pier+))
          (push (list (aref reserved-level x y) x y) result))))
    result))

(defun place-reserved-buildings-port-w (reserved-level)
  (let ((result))
    (loop for y from 0 below (array-dimension reserved-level 1)
          for building-type-id = (if (and (zerop (mod (1+ y) 5))
                                          (/= y (1- (array-dimension reserved-level 1))))
                                   +building-city-pier+
                                   +building-city-sea+)
          for random-warehouse-1 = (if (zerop (random 2))
                                     +building-city-warehouse-port-1+
                                     +building-city-warehouse-port-2+)
          for random-warehouse-2 = (if (zerop (random 2))
                                     +building-city-warehouse-port-1+
                                     +building-city-warehouse-port-2+)
          do
             (setf (aref reserved-level 0 y) +building-city-sea+)
             (setf (aref reserved-level 1 y) building-type-id)
             (setf (aref reserved-level 2 y) building-type-id)
             (when (level-city-can-place-build-on-grid random-warehouse-1 3 y reserved-level)
               (level-city-reserve-build-on-grid random-warehouse-1 3 y reserved-level)
               (push (list random-warehouse-1 3 y) result))
             (when (level-city-can-place-build-on-grid random-warehouse-2 5 y reserved-level)
               (level-city-reserve-build-on-grid random-warehouse-2 5 y reserved-level)
               (push (list random-warehouse-2 5 y) result)))
    
    (loop for x from 0 below (array-dimension reserved-level 0) do
      (loop for y from 0 below (array-dimension reserved-level 1) do
        (when (or (= (aref reserved-level x y) +building-city-sea+)
                  (= (aref reserved-level x y) +building-city-pier+))
          (push (list (aref reserved-level x y) x y) result))))
    result))

(defun create-mobs-from-template (world mob-template-list)
  (loop for (mob-type-id x y) in mob-template-list 
        do
           (add-mob-to-level-list (level world) (make-instance 'mob :mob-type mob-type-id :x x :y y))))

(defun populate-world-with-mobs (world mob-template-list placement-func)
  (loop for (mob-template-id . num) in mob-template-list do
    (loop repeat num
          do
             (funcall placement-func world (make-instance 'mob :mob-type mob-template-id))))
  )

(defun find-unoccupied-place-around (world mob sx sy)
  (loop with min-x = sx
        with max-x = sx
        with min-y = sy
        with max-y = sy
        for cell-list = nil
        do
           ;; prepare the list of cells
           ;; north 
           (setf cell-list (append cell-list (loop with y = min-y
                                                   for x from min-x to max-x
                                                   collect (cons x y))))
           ;; east
           (setf cell-list (append cell-list (loop with x = max-x
                                                   for y from min-y to max-y
                                                   collect (cons x y))))
           ;; south
           (setf cell-list (append cell-list (loop with y = max-y
                                                   for x from min-x to max-x
                                                   collect (cons x y))))
           ;; west
           (setf cell-list (append cell-list (loop with x = min-x
                                                   for y from min-y to max-y
                                                   collect (cons x y))))

           ;; iterate through the list of cells
           (loop for (x . y) in cell-list
                 when (and (>= x 0) (< x *max-x-level*) (>= y 0) (< y *max-y-level*)
                           (not (get-mob-* (level world) x y))
                           (not (get-terrain-type-trait (get-terrain-* (level world) x y) +terrain-trait-blocks-move+)))
                   do
                      (setf (x mob) x (y mob) y)
                      (add-mob-to-level-list (level world) mob)
                      (return-from find-unoccupied-place-around mob))

           ;; if the loop is not over - increase the boundaries
           (decf min-x)
           (decf min-y)
           (incf max-x)
           (incf max-y)
           ))
 
(defun find-unoccupied-place-outside (world mob)
  (loop for x = (random *max-x-level*)
        for y = (random *max-y-level*)
        until (and (not (and (> x 7) (< x (- *max-x-level* 7)) (> y 7) (< y (- *max-y-level* 7))))
                   (not (get-mob-* (level world) x y))
                   (not (get-terrain-type-trait (get-terrain-* (level world) x y) +terrain-trait-blocks-move+)))
        finally (setf (x mob) x (y mob) y)
                (add-mob-to-level-list (level world) mob)))

(defun find-unoccupied-place-inside (world mob)
  (loop for x = (random *max-x-level*)
        for y = (random *max-y-level*)
        until (and (and (> x 10) (< x (- *max-x-level* 10)) (> y 10) (< y (- *max-y-level* 10)))
                   (not (get-mob-* (level world) x y))
                   (not (get-terrain-type-trait (get-terrain-* (level world) x y) +terrain-trait-blocks-move+)))
        finally (setf (x mob) x (y mob) y)
                (add-mob-to-level-list (level world) mob)))

(defun place-reserved-buildings-forest (reserved-level)
  (let ((result))
    ;; place +building-city-park-tiny+ and +building-city-park-3+ along the borders
    (loop for x from 0 below (array-dimension reserved-level 0)
          do
             (setf (aref reserved-level x 0) +building-city-park-tiny+)
             (setf (aref reserved-level x (1- (array-dimension reserved-level 1))) +building-city-park-tiny+)
             (when (level-city-can-place-build-on-grid +building-city-park-3+ x 1 reserved-level)
               (level-city-reserve-build-on-grid +building-city-park-3+ x 1 reserved-level)
               (push (list +building-city-park-3+ x 1) result))
             (when (level-city-can-place-build-on-grid +building-city-park-3+ x (- (array-dimension reserved-level 1) 3) reserved-level)
               (level-city-reserve-build-on-grid +building-city-park-3+ x (- (array-dimension reserved-level 1) 3) reserved-level)
               (push (list +building-city-park-3+ x (- (array-dimension reserved-level 1) 3)) result)))
    (loop for y from 0 below (array-dimension reserved-level 1)
          do
             (setf (aref reserved-level 0 y) +building-city-park-tiny+)
             (setf (aref reserved-level (1- (array-dimension reserved-level 0)) y) +building-city-park-tiny+)
             (when (level-city-can-place-build-on-grid +building-city-park-3+ 1 y reserved-level)
               (level-city-reserve-build-on-grid +building-city-park-3+ 1 y reserved-level)
               (push (list +building-city-park-3+ 1 y) result))
             (when (level-city-can-place-build-on-grid +building-city-park-3+ (- (array-dimension reserved-level 0) 3) y reserved-level)
               (level-city-reserve-build-on-grid +building-city-park-3+ (- (array-dimension reserved-level 0) 3) y reserved-level)
               (push (list +building-city-park-3+ (- (array-dimension reserved-level 0) 3) y) result)))
    
    (loop for x from 0 below (array-dimension reserved-level 0) do
      (loop for y from 0 below (array-dimension reserved-level 1) do
        (when (= (aref reserved-level x y) +building-city-park-tiny+)
          (push (list (aref reserved-level x y) x y) result))))
    result))

(defun place-reserved-buildings-island (reserved-level)
  (let ((result))
    ;; place water along the borders
    (loop for x from 0 below (array-dimension reserved-level 0)
          do
             (setf (aref reserved-level x 0) +building-city-sea+)
             (setf (aref reserved-level x 1) +building-city-sea+)
             (setf (aref reserved-level x 2) +building-city-sea+)
             (setf (aref reserved-level x (- (array-dimension reserved-level 1) 1)) +building-city-sea+)
             (setf (aref reserved-level x (- (array-dimension reserved-level 1) 2)) +building-city-sea+)
             (setf (aref reserved-level x (- (array-dimension reserved-level 1) 3)) +building-city-sea+))
            
    (loop for y from 0 below (array-dimension reserved-level 1)
          do
             (setf (aref reserved-level 0 y) +building-city-sea+)
             (setf (aref reserved-level 1 y) +building-city-sea+)
             (when (and (>= y 2) (<= y (- (array-dimension reserved-level 1) 3)))
               (setf (aref reserved-level 2 y) +building-city-sea+))
             (setf (aref reserved-level (- (array-dimension reserved-level 0) 1) y) +building-city-sea+)
             (setf (aref reserved-level (- (array-dimension reserved-level 0) 2) y) +building-city-sea+)
             (when (and (>= y 2) (<= y (- (array-dimension reserved-level 1) 3)))
               (setf (aref reserved-level (- (array-dimension reserved-level 0) 3) y) +building-city-sea+)))

    ;; place four piers - north, south, east, west
    (let ((min) (max) (r))
      ;; north
      (setf min 3 max (- (array-dimension reserved-level 0) 3))
      (setf r (+ (random (- max min)) min))
      (setf (aref reserved-level r 1) +building-city-pier+)
      (setf (aref reserved-level r 2) +building-city-pier+)
      
      ;; south
      (setf r (+ (random (- max min)) min))
      (setf (aref reserved-level r (- (array-dimension reserved-level 1) 2)) +building-city-pier+)
      (setf (aref reserved-level r (- (array-dimension reserved-level 1) 3)) +building-city-pier+)
      
      ;; west
      (setf min 3 max (- (array-dimension reserved-level 1) 3))
      (setf r (+ (random (- max min)) min))
      (setf (aref reserved-level 1 r) +building-city-pier+)
      (setf (aref reserved-level 2 r) +building-city-pier+)

      ;; east
      (setf r (+ (random (- max min)) min))
      (setf (aref reserved-level (- (array-dimension reserved-level 1) 2) r) +building-city-pier+)
      (setf (aref reserved-level (- (array-dimension reserved-level 1) 3) r) +building-city-pier+))
    
    (loop for x from 0 below (array-dimension reserved-level 0) do
      (loop for y from 0 below (array-dimension reserved-level 1) do
        (when (or (= (aref reserved-level x y) +building-city-sea+)
                  (= (aref reserved-level x y) +building-city-pier+)
                  (= (aref reserved-level x y) +building-city-island-ground-border+))
          (push (list (aref reserved-level x y) x y) result))))
    result))
