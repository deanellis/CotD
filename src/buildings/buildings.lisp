(in-package :cotd)

;;--------------------------------------
;; GENERAL BUILDING TYPES
;;--------------------------------------

(defconstant +building-type-none+ 0)
(defconstant +building-type-house+ 1)
(defconstant +building-type-townhall+ 2)
(defconstant +building-type-park+ 3)
(defconstant +building-type-lake+ 4)
(defconstant +building-type-prison+ 5)
(defconstant +building-type-church+ 6)
(defconstant +building-type-library+ 7)
(defconstant +building-type-warehouse+ 8)
(defconstant +building-type-satanists+ 9)
(defconstant +building-type-stables+ 10)
(defconstant +building-type-mansion+ 11)
(defconstant +building-type-bank+ 12)
(defconstant +building-type-graveyard+ 13)

(defconstant +building-type-ruined-house+ 14)
(defconstant +building-type-ruined-townhall+ 15)
(defconstant +building-type-ruined-park+ 16)
(defconstant +building-type-ruined-prison+ 17)
(defconstant +building-type-ruined-warehouse+ 18)
(defconstant +building-type-ruined-library+ 19)
(defconstant +building-type-ruined-mansion+ 20)
(defconstant +building-type-ruined-bank+ 21)

(defconstant +building-type-corrupted-house+ 22)
(defconstant +building-type-corrupted-townhall+ 23)
(defconstant +building-type-corrupted-park+ 24)
(defconstant +building-type-corrupted-prison+ 25)
(defconstant +building-type-corrupted-warehouse+ 26)
(defconstant +building-type-corrupted-library+ 27)
(defconstant +building-type-corrupted-mansion+ 28)
(defconstant +building-type-corrupted-bank+ 29)
(defconstant +building-type-corrupted-graveyard+ 30)
(defconstant +building-type-corrupted-lake+ 31)

;;--------------------------------------
;; SPECIFIC BUILDING TYPES
;;--------------------------------------
(defconstant +building-city-free+ 0)
(defconstant +building-city-reserved+ 1)
(defconstant +building-city-house-1+ 2)
(defconstant +building-city-house-2+ 3)
(defconstant +building-city-house-3+ 4)
(defconstant +building-city-house-4+ 5)
(defconstant +building-city-townhall-1+ 6)
(defconstant +building-city-park-1+ 7)
(defconstant +building-city-lake-1+ 8)
(defconstant +building-city-park-2+ 9)
(defconstant +building-city-prison-1+ 10)
(defconstant +building-city-church-1+ 11)
(defconstant +building-city-warehouse-1+ 12)
(defconstant +building-city-library-1+ 13)
(defconstant +building-city-park-3+ 14)
(defconstant +building-city-lake-2+ 15)
(defconstant +building-city-park-tiny+ 16)
(defconstant +building-city-townhall-2+ 17)
(defconstant +building-city-townhall-3+ 18)
(defconstant +building-city-townhall-4+ 19)
(defconstant +building-city-satan-lair-1+ 20)
(defconstant +building-city-river+ 21)
(defconstant +building-city-bridge+ 22)
(defconstant +building-city-pier+ 23)
(defconstant +building-city-sea+ 24)
(defconstant +building-city-warehouse-port-1+ 25)
(defconstant +building-city-warehouse-port-2+ 26)
(defconstant +building-city-island-ground-border+ 27)
(defconstant +building-city-barricade-ns+ 28)
(defconstant +building-city-barricade-we+ 29)
(defconstant +building-city-barricade-se+ 30)
(defconstant +building-city-barricade-sw+ 31)
(defconstant +building-city-barricade-nw+ 32)
(defconstant +building-city-barricade-ne+ 33)
(defconstant +building-city-stables-1+ 34)
(defconstant +building-city-mansion-1+ 35)
(defconstant +building-city-mansion-2+ 36)
(defconstant +building-city-park-4+ 37)
(defconstant +building-city-bank-1+ 38)
(defconstant +building-city-graveyard-1+ 39)
(defconstant +building-city-church-2+ 40)
(defconstant +building-city-land-border+ 41)
(defconstant +building-city-forest-border+ 42)
(defconstant +building-city-army-post+ 43)

(defconstant +building-city-ruined-house-1+ 45)
(defconstant +building-city-ruined-house-2+ 46)
(defconstant +building-city-ruined-house-3+ 47)
(defconstant +building-city-ruined-house-4+ 48)
(defconstant +building-city-ruined-townhall-1+ 49)
(defconstant +building-city-ruined-townhall-2+ 50)
(defconstant +building-city-ruined-townhall-3+ 51)
(defconstant +building-city-ruined-townhall-4+ 52)
(defconstant +building-city-ruined-park-1+ 53)
(defconstant +building-city-ruined-park-2+ 54)
(defconstant +building-city-ruined-park-3+ 55)
(defconstant +building-city-ruined-park-4+ 56)
(defconstant +building-city-ruined-prison-1+ 57)
(defconstant +building-city-ruined-warehouse-1+ 58)
(defconstant +building-city-ruined-library-1+ 59)
(defconstant +building-city-ruined-warehouse-port-1+ 60)
(defconstant +building-city-ruined-warehouse-port-2+ 61)
(defconstant +building-city-ruined-mansion-1+ 62)
(defconstant +building-city-ruined-mansion-2+ 63)
(defconstant +building-city-ruined-bank-1+ 64)

(defconstant +building-city-sigil-post+ 65)

(defconstant +building-city-corrupted-house-1+ 66)
(defconstant +building-city-corrupted-house-2+ 67)
(defconstant +building-city-corrupted-house-3+ 68)
(defconstant +building-city-corrupted-house-4+ 69)
(defconstant +building-city-corrupted-townhall-1+ 70)
(defconstant +building-city-corrupted-townhall-2+ 71)
(defconstant +building-city-corrupted-townhall-3+ 72)
(defconstant +building-city-corrupted-townhall-4+ 73)
(defconstant +building-city-corrupted-park-1+ 74)
(defconstant +building-city-corrupted-park-2+ 75)
(defconstant +building-city-corrupted-park-3+ 76)
(defconstant +building-city-corrupted-park-4+ 77)
(defconstant +building-city-corrupted-prison-1+ 78)
(defconstant +building-city-corrupted-warehouse-1+ 79)
(defconstant +building-city-corrupted-library-1+ 80)
(defconstant +building-city-corrupted-warehouse-port-1+ 81)
(defconstant +building-city-corrupted-warehouse-port-2+ 82)
(defconstant +building-city-corrupted-mansion-1+ 83)
(defconstant +building-city-corrupted-mansion-2+ 84)
(defconstant +building-city-corrupted-bank-1+ 85)
(defconstant +building-city-corrupted-sigil-post+ 86)
(defconstant +building-city-corrupted-park-tiny+ 87)
(defconstant +building-city-corrupted-graveyard-1+ 88)
(defconstant +building-city-corrupted-lake-1+ 89)
(defconstant +building-city-corrupted-lake-2+ 90)

(defparameter *level-grid-size* 5)

(defvar *building-types* (make-hash-table))
(defvar *general-building-types* (make-hash-table))

(defstruct building
  (id)       ;; building id 
  (grid-dim) ;; dimensions on a grid map, type (X . Y)
  (act-dim)  ;; dimensions on an actual map, type (X . Y)
  (func)     ;; function that places the building onto the actual map
  (type +building-type-none+)
  )

(defun get-building-grid-dim (building)
  (values (car (building-grid-dim building)) 
          (cdr (building-grid-dim building))))

(defun get-building-act-dim (building)
  (values (car (building-act-dim building)) 
          (cdr (building-act-dim building))))

(defun set-building-type (building)
  (destructuring-bind (adx . ady) (building-act-dim building)
    (destructuring-bind (gdx . gdy) (building-grid-dim building)
      (when (or (> adx (* gdx *level-grid-size*))
                (> ady (* gdy *level-grid-size*)))
        (error "Grid and actual dimensions do not match!"))))
  (unless (= (building-type building) +building-type-none+)
    (setf (gethash (building-type building) *general-building-types*) t))
  (setf (gethash (building-id building) *building-types*) building))

(defun get-building-type (building-type-id)
  (gethash building-type-id *building-types*))

(defun translate-build-to-template (x y z build-template template-level)
  (loop for y1 from 0 below (length build-template) do
    (loop for c across (nth y1 build-template) 
          and x1 from 0
          for tt = (case c
                     (#\. +terrain-floor-stone+)
                     (#\# +terrain-wall-stone+)
                     (#\T +terrain-tree-birch+)
                     (#\, (if (< (random 100) 20)
                            +terrain-floor-dirt-bright+
                            +terrain-floor-dirt+))
                     (#\_ +terrain-water-liquid+)
                     (#\` +terrain-floor-grass+)
                     (#\- +terrain-wall-window+)
                     (#\h +terrain-floor-chair+)
                     (#\t +terrain-floor-table+)
                     (#\b +terrain-floor-bed+)
                     (#\c +terrain-floor-cabinet+)
                     (#\C +terrain-floor-crate+)
                     (#\B +terrain-floor-bookshelf+)
                     (#\+ +terrain-door-closed+)
                     (#\' +terrain-door-open+)
                     (#\0 +terrain-wall-earth+)
                     (#\Space +terrain-floor-air+)
                     (#\u +terrain-slope-stone-up+)
                     (#\d +terrain-slope-stone-down+)
                     (#\* +terrain-wall-bush+)
                     (#\| +terrain-wall-lantern+)
                     (#\G +terrain-wall-grave+))
          when tt
            do (setf (aref template-level (+ x x1) (+ y y1) z) tt))))

(defun translate-build-to-corrupted-template (x y z build-template template-level)
  (loop for y1 from 0 below (length build-template) do
    (loop for c across (nth y1 build-template) 
          and x1 from 0
          for tt = (case c
                     (#\. +terrain-floor-stone+)
                     (#\# +terrain-wall-stone+)
                     (#\T +terrain-tree-twintube+)
                     (#\, (if (< (random 100) 20)
                            +terrain-floor-creep-bright+
                            +terrain-floor-creep+))
                     (#\_ +terrain-water-liquid+)
                     (#\` +terrain-floor-creep+)
                     (#\- +terrain-wall-window+)
                     (#\h +terrain-floor-chair+)
                     (#\t +terrain-floor-table+)
                     (#\b +terrain-floor-bed+)
                     (#\c +terrain-floor-cabinet+)
                     (#\C +terrain-floor-crate+)
                     (#\B +terrain-floor-bookshelf+)
                     (#\+ +terrain-door-closed+)
                     (#\' +terrain-door-open+)
                     (#\0 +terrain-wall-earth+)
                     (#\Space +terrain-floor-air+)
                     (#\u +terrain-slope-stone-up+)
                     (#\d +terrain-slope-stone-down+)
                     (#\* +terrain-wall-gloomtwigs+)
                     (#\| +terrain-wall-lantern+)
                     (#\G +terrain-wall-grave+))
          when tt
            do (setf (aref template-level (+ x x1) (+ y y1) z) tt))))

(defun level-city-reserve-build-on-grid (template-building-id gx gy gz reserved-level)
  (destructuring-bind (dx . dy) (building-grid-dim (get-building-type template-building-id))
    (loop for y1 from 0 below dy do
      (loop for x1 from 0 below dx do
        (setf (aref reserved-level (+ gx x1) (+ gy y1) gz) template-building-id)))
    ))

(defun level-city-can-place-build-on-grid (template-building-id gx gy gz reserved-level)
  (destructuring-bind (dx . dy) (building-grid-dim (get-building-type template-building-id))
    ;; if the staring point of the building + its dimensions) is more than level dimensions - fail
    (when (or (> (+ gx dx) (array-dimension reserved-level 0))
              (> (+ gy dy) (array-dimension reserved-level 1)))
      (return-from level-city-can-place-build-on-grid nil))
    
    ;; if any of the grid tiles that the building is going to occupy are already reserved - fail
    (loop for y1 from 0 below dy do
      (loop for x1 from 0 below dx do
        (when (/= (aref reserved-level (+ gx x1) (+ gy y1) gz) +building-city-free+)
          (return-from level-city-can-place-build-on-grid nil))
            ))
    ;; all checks done - success
    t
    ))

(defun level-place-birch-mature-1 (template-level x y z)
  ;; (0, 0) is the top left corner
  ;; z = 2
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 0)) +terrain-tree-birch-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  
  ;; z = 3
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 1)) +terrain-floor-branches+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 1)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 1)) +terrain-tree-birch-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 1)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 2) (+ y 0) (+ z 1)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 1)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 1)) +terrain-floor-leaves+)
  
  ;; z = 4
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 2)) +terrain-floor-grass+)
  ;;(setf (aref template-level (+ x 0) (+ y 1) (+ z 2)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 2)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 2) (+ y 1) (+ z 2)) +terrain-floor-grass+)
  ;;(setf (aref template-level (+ x 2) (+ y 2) (+ z 2)) +terrain-floor-grass+)
  )

(defun level-place-birch-mature-2 (template-level x y z)
  ;; (0, 0) is the top left corner
  ;; z = 2
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 0)) +terrain-tree-birch-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  
  ;; z = 3
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 1)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 1)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 1)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 1)) +terrain-tree-birch-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 1)) +terrain-floor-branches+)
  ;;(setf (aref template-level (+ x 2) (+ y 0) (+ z 1)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 1)) +terrain-floor-leaves+)
  
  ;; z = 4
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 2)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 2)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 1) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 2)) +terrain-floor-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 2) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 2)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 2) (+ y 2) (+ z 2)) +terrain-floor-grass+)
  )

(defun level-place-birch-mature-3 (template-level x y z)
  ;; (0, 0) is the top left corner
  ;; z = 2
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 0)) +terrain-tree-birch-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  
  ;; z = 3
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 1)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 1)) +terrain-tree-birch-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 1)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 1)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 2) (+ y 2) (+ z 1)) +terrain-floor-leaves+)
  
  ;; z = 4
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 2)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 2)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 2)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 2)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 2) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 2)) +terrain-floor-branches+)
  )

(defun level-place-birch-mature-4 (template-level x y z)
  ;; (0, 0) is the top left corner
  ;; z = 2
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 0)) +terrain-tree-birch-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  
  ;; z = 3
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 1)) +terrain-floor-branches+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 1)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 1)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 1)) +terrain-tree-birch-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 1)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 2) (+ y 0) (+ z 1)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 1)) +terrain-floor-leaves+)
  
  ;; z = 4
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 2)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 2)) +terrain-tree-birch-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 2)) +terrain-floor-branches+)
  ;;(setf (aref template-level (+ x 2) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 2)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 2)) +terrain-floor-leaves+)

  ;; z = 5
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 3)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 3)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 3)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 3)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 3)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 3)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 2) (+ y 0) (+ z 3)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 3)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 2) (+ y 2) (+ z 3)) +terrain-floor-branches+)
  )

(defun level-place-oak-mature-1 (template-level x y z)
  ;; (0, 0) is the top left corner
  ;; z = 2
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 3) (+ z 0)) +terrain-floor-grass+)

  (setf (aref template-level (+ x 1) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 0)) +terrain-tree-oak-trunk-nw+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 0)) +terrain-tree-oak-trunk-sw+)
  (setf (aref template-level (+ x 1) (+ y 3) (+ z 0)) +terrain-floor-grass+)

  (setf (aref template-level (+ x 2) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 0)) +terrain-tree-oak-trunk-ne+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 0)) +terrain-tree-oak-trunk-se+)
  (setf (aref template-level (+ x 2) (+ y 3) (+ z 0)) +terrain-floor-grass+)

  (setf (aref template-level (+ x 3) (+ y 0) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 3) (+ y 1) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 3) (+ y 2) (+ z 0)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 3) (+ y 3) (+ z 0)) +terrain-floor-grass+)
  
  ;; z = 3
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 1)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 1)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 1)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 0) (+ y 3) (+ z 1)) +terrain-floor-grass+)

  (setf (aref template-level (+ x 1) (+ y 0) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 1)) +terrain-tree-oak-trunk-nw+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 1)) +terrain-tree-oak-trunk-sw+)
  (setf (aref template-level (+ x 1) (+ y 3) (+ z 1)) +terrain-floor-branches+)

  (setf (aref template-level (+ x 2) (+ y 0) (+ z 1)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 1)) +terrain-tree-oak-trunk-ne+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 1)) +terrain-tree-oak-trunk-se+)
  (setf (aref template-level (+ x 2) (+ y 3) (+ z 1)) +terrain-floor-leaves+)

  ;;(setf (aref template-level (+ x 3) (+ y 0) (+ z 1)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 3) (+ y 1) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 3) (+ y 2) (+ z 1)) +terrain-floor-branches+)
  ;;(setf (aref template-level (+ x 3) (+ y 3) (+ z 1)) +terrain-floor-grass+)
  
  ;; z = 4
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 2)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 2)) +terrain-floor-branches+)
  ;;(setf (aref template-level (+ x 0) (+ y 3) (+ z 2)) +terrain-floor-grass+)

  (setf (aref template-level (+ x 1) (+ y 0) (+ z 2)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 2)) +terrain-tree-oak-trunk-nw+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 2)) +terrain-tree-oak-trunk-sw+)
  (setf (aref template-level (+ x 1) (+ y 3) (+ z 2)) +terrain-floor-leaves+)

  (setf (aref template-level (+ x 2) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 2)) +terrain-tree-oak-trunk-ne+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 2)) +terrain-tree-oak-trunk-se+)
  (setf (aref template-level (+ x 2) (+ y 3) (+ z 2)) +terrain-floor-branches+)

  ;;(setf (aref template-level (+ x 3) (+ y 0) (+ z 2)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 3) (+ y 1) (+ z 2)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 3) (+ y 2) (+ z 2)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 3) (+ y 3) (+ z 2)) +terrain-floor-grass+)

  ;; z = 5
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 3)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 3)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 3)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 0) (+ y 3) (+ z 3)) +terrain-floor-grass+)

  (setf (aref template-level (+ x 1) (+ y 0) (+ z 3)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 3)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 3)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 1) (+ y 3) (+ z 3)) +terrain-floor-leaves+)

  (setf (aref template-level (+ x 2) (+ y 0) (+ z 3)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 3)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 3)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 2) (+ y 3) (+ z 3)) +terrain-floor-leaves+)

  ;;(setf (aref template-level (+ x 3) (+ y 0) (+ z 3)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 3) (+ y 1) (+ z 3)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 3) (+ y 2) (+ z 3)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 3) (+ y 3) (+ z 3)) +terrain-floor-grass+)
  )

(defun level-place-twintube-corrupted-1 (template-level x y z)
  ;; (0, 0) is the top left corner
  ;; z = 2
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 0)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  
  ;; z = 3
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 1)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 0) (+ y 1) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 1)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 1)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 1)) +terrain-floor-twintube-branches+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 2) (+ y 0) (+ z 1)) +terrain-floor-grass+)
  ;;(setf (aref template-level (+ x 2) (+ y 1) (+ z 1)) +terrain-floor-branches+)
  ;;(setf (aref template-level (+ x 2) (+ y 2) (+ z 1)) +terrain-floor-leaves+)
  
  ;; z = 4
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 2)) +terrain-floor-grass+)
  ;;(setf (aref template-level (+ x 0) (+ y 1) (+ z 2)) +terrain-floor-grass+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 1) (+ z 2)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 2) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 2) (+ y 1) (+ z 2)) +terrain-floor-grass+)
  ;;(setf (aref template-level (+ x 2) (+ y 2) (+ z 2)) +terrain-floor-grass+)
  )

(defun level-place-twintube-corrupted-2 (template-level x y z)
  ;; (0, 0) is the top left corner
  ;; z = 2
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 0)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  
  ;; z = 3
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 1)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 1)) +terrain-floor-grass+)
  ;;(setf (aref template-level (+ x 1) (+ y 0) (+ z 1)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 1)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 2) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 2) (+ y 0) (+ z 1)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 2) (+ y 2) (+ z 1)) +terrain-floor-leaves+)
  
  ;; z = 4
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 2)) +terrain-floor-grass+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 2)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 1) (+ y 0) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 1) (+ z 2)) +terrain-floor-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 2) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 2) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 2) (+ y 2) (+ z 2)) +terrain-floor-grass+)
  )

(defun level-place-twintube-corrupted-3 (template-level x y z)
  ;; (0, 0) is the top left corner
  ;; z = 2
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 0)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  
  ;; z = 3
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 0) (+ y 1) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 1)) +terrain-floor-grass+)
  ;;(setf (aref template-level (+ x 1) (+ y 0) (+ z 1)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 1)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 2) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 2) (+ y 0) (+ z 1)) +terrain-floor-grass+)
  ;;(setf (aref template-level (+ x 2) (+ y 1) (+ z 1)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 1)) +terrain-tree-twintube-trunk+)
  
  ;; z = 4
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 0) (+ y 1) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 2)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 1) (+ y 0) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 1) (+ z 2)) +terrain-floor-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 2) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 2) (+ y 0) (+ z 2)) +terrain-floor-leaves+)
  ;;(setf (aref template-level (+ x 2) (+ y 1) (+ z 2)) +terrain-floor-twintube-branches+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 2)) +terrain-floor-twintube-branches+)
  )

(defun level-place-twintube-corrupted-4 (template-level x y z)
  ;; (0, 0) is the top left corner
  ;; z = 2
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 0)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  
  ;; z = 3
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 0) (+ y 1) (+ z 1)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 1) (+ y 0) (+ z 1)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 1)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 2) (+ z 1)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 2) (+ y 1) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 2) (+ y 2) (+ z 1)) +terrain-tree-twintube-trunk+)
  
  ;; z = 4
  ;;(setf (aref template-level (+ x 0) (+ y 0) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 0) (+ y 1) (+ z 2)) +terrain-floor-twintube-branches+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 0) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 1) (+ z 2)) +terrain-floor-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 2) (+ z 2)) +terrain-floor-twintube-branches+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 2) (+ y 1) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 2) (+ y 2) (+ z 2)) +terrain-floor-twintube-branches+)
  )

(defun level-place-twintube-mutated-1 (template-level x y z)
   ;; (0, 0) is the top left corner
  ;; z = 2
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 0) (+ y 1) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 0) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 1) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 0)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 1) (+ z 0)) +terrain-floor-creep+)
  (setf (aref template-level (+ x 2) (+ y 2) (+ z 0)) +terrain-floor-creep+)
  
  ;; z = 3
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 0) (+ y 1) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 1) (+ y 0) (+ z 1)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 1) (+ y 1) (+ z 1)) +terrain-floor-twintube-branches+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 1)) +terrain-tree-twintube-trunk+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 2) (+ y 1) (+ z 1)) +terrain-tree-twintube-trunk+)
  ;;(setf (aref template-level (+ x 2) (+ y 2) (+ z 1)) +terrain-tree-twintube-trunk+)
  
  ;; z = 4
  (setf (aref template-level (+ x 0) (+ y 0) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 0) (+ y 1) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 0) (+ y 2) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 0) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 1) (+ y 1) (+ z 2)) +terrain-floor-branches+)
  (setf (aref template-level (+ x 1) (+ y 2) (+ z 2)) +terrain-floor-twintube-branches+)
  (setf (aref template-level (+ x 2) (+ y 0) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 2) (+ y 1) (+ z 2)) +terrain-floor-twintube-branches+)
  ;;(setf (aref template-level (+ x 2) (+ y 2) (+ z 2)) +terrain-floor-twintube-branches+)
  )
