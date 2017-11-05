(in-package :cotd)

;;--------------------
;; FEATURE-TYPE Declarations
;;-------------------- 

(set-feature-type (make-instance 'feature-type :id +feature-blood-old+ :glyph-idx nil :glyph-color (sdl:color :r 100 :b 0 :b 0) :back-color nil :name "Bloodstain"
                                               :can-merge-func #'(lambda (level feature-new)
                                                                   (let ((result nil))
                                                                     (loop for feature-old-id in (aref (features level) (x feature-new) (y feature-new) (z feature-new))
                                                                           for feature-old = (get-feature-by-id feature-old-id)
                                                                           when (or (= (feature-type feature-new) (feature-type feature-old))
                                                                                    (= (feature-type feature-old) +feature-blood-fresh+)
                                                                                    (= (feature-type feature-old) +feature-blood-stain+))
                                                                             do
                                                                                (setf result t)
                                                                                (loop-finish)
                                                                           )
                                                                     result))))

(set-feature-type (make-instance 'feature-type :id +feature-blood-fresh+ :glyph-idx nil :glyph-color (sdl:color :r 250 :b 0 :b 0) :back-color nil :name "Bloodstain"
                                               :can-merge-func #'(lambda (level feature-new)
                                                                   (let ((result nil))
                                                                     (loop for feature-old-id in (aref (features level) (x feature-new) (y feature-new) (z feature-new))
                                                                           for feature-old = (get-feature-by-id feature-old-id)
                                                                           when (or (= (feature-type feature-new) (feature-type feature-old))
                                                                                    (= (feature-type feature-old) +feature-blood-old+)
                                                                                    (= (feature-type feature-old) +feature-blood-stain+))
                                                                             do
                                                                                (setf result t)
                                                                                (loop-finish)
                                                                           )
                                                                     result))
                                               :merge-func #'(lambda (level feature-new)
                                                               (loop for feature-old-id in (aref (features level) (x feature-new) (y feature-new) (z feature-new))
                                                                     for feature-old = (get-feature-by-id feature-old-id)
                                                                     when (or (= (feature-type feature-new) (feature-type feature-old))
                                                                              (= (feature-type feature-old) +feature-blood-stain+))
                                                                       do
                                                                          (remove-feature-from-level-list level feature-new)
                                                                          (remove-feature-from-world feature-new)
                                                                          (loop-finish)
                                                                     when (= (feature-type feature-old) +feature-blood-old+)
                                                                       do
                                                                          (remove-feature-from-level-list level feature-old)
                                                                          (remove-feature-from-world feature-old)
                                                                          (add-feature-to-level-list level feature-new)
                                                                          (loop-finish)
                                                                     )
                                                               )))

(set-feature-type (make-instance 'feature-type :id +feature-blood-stain+ :glyph-idx 97 :glyph-color (sdl:color :r 250 :b 0 :b 0) :back-color sdl:*black* :name "Bloodstain"
                                               :can-merge-func #'(lambda (level feature-new)
                                                                   (let ((result nil))
                                                                     (loop for feature-old-id in (aref (features level) (x feature-new) (y feature-new) (z feature-new))
                                                                           for feature-old = (get-feature-by-id feature-old-id)
                                                                           when (or (= (feature-type feature-new) (feature-type feature-old))
                                                                                    (= (feature-type feature-old) +feature-blood-old+)
                                                                                    (= (feature-type feature-old) +feature-blood-fresh+))
                                                                             do
                                                                                (setf result t)
                                                                                (loop-finish)
                                                                           )
                                                                     result))
                                               :merge-func #'(lambda (level feature-new)
                                                               (loop for feature-old-id in (aref (features level) (x feature-new) (y feature-new) (z feature-new))
                                                                     for feature-old = (get-feature-by-id feature-old-id)
                                                                     when (= (feature-type feature-new) (feature-type feature-old))
                                                                       do
                                                                          (remove-feature-from-level-list level feature-new)
                                                                          (remove-feature-from-world feature-new)
                                                                          (loop-finish)
                                                                     when (or (= (feature-type feature-old) +feature-blood-old+)
                                                                              (= (feature-type feature-old) +feature-blood-fresh+))
                                                                       do
                                                                          (remove-feature-from-level-list level feature-old)
                                                                          (remove-feature-from-world feature-old)
                                                                          (add-feature-to-level-list level feature-new)
                                                                          (loop-finish)
                                                                     )
                                                               )))

(set-feature-type (make-instance 'feature-type :id +feature-start-satanist-player+ :glyph-idx 0 :glyph-color sdl:*black* :back-color sdl:*black* :name "Player Satanist Starting Position" :trait-remove-on-dungeon-generation t))

(set-feature-type (make-instance 'feature-type :id +feature-start-gold-small+ :glyph-idx 0 :glyph-color sdl:*black* :back-color sdl:*black* :name "Small Gold Pile Placeholder"))

(set-feature-type (make-instance 'feature-type :id +feature-start-gold-big+ :glyph-idx 0 :glyph-color sdl:*black* :back-color sdl:*black* :name "Big Gold Pile Placeholder"))

(set-feature-type (make-instance 'feature-type :id +feature-smoke-thin+ :glyph-idx 98 :glyph-color (sdl:color :r 200 :g 200 :b 200) :back-color sdl:*black* :name "Smoke"
                                               :trait-blocks-vision 60 :trait-smoke +feature-smoke-thin+ :trait-no-gravity t
                                               :can-merge-func #'(lambda (level feature-new)
                                                                   (let ((result nil))
                                                                     (loop for feature-old-id in (aref (features level) (x feature-new) (y feature-new) (z feature-new))
                                                                           for feature-old = (get-feature-by-id feature-old-id)
                                                                           when (or (= (feature-type feature-new) (feature-type feature-old))
                                                                                    (= (feature-type feature-old) +feature-smoke-thick+))
                                                                             do
                                                                                (setf result t)
                                                                                (loop-finish)
                                                                           )
                                                                     result))
                                               :merge-func #'(lambda (level feature-new)
                                                               (loop for feature-old-id in (aref (features level) (x feature-new) (y feature-new) (z feature-new))
                                                                     for feature-old = (get-feature-by-id feature-old-id)
                                                                     when (= (feature-type feature-new) (feature-type feature-old))
                                                                       do
                                                                          (remove-feature-from-level-list level feature-new)
                                                                          (remove-feature-from-world feature-new)
                                                                          (incf (counter feature-old))
                                                                          (when (> (counter feature-old) 4)
                                                                            (setf (feature-type feature-old) +feature-smoke-thick+))
                                                                          (loop-finish)
                                                                     when (= (feature-type feature-old) +feature-smoke-thick+)
                                                                       do
                                                                          (remove-feature-from-level-list level feature-new)
                                                                          (remove-feature-from-world feature-new)
                                                                          (incf (counter feature-old))
                                                                          (loop-finish)
                                                                     )
                                                               )
                                               :on-tick-func #'feature-smoke-on-tick))

(set-feature-type (make-instance 'feature-type :id +feature-smoke-thick+ :glyph-idx 98 :glyph-color (sdl:color :r 200 :g 200 :b 200) :back-color sdl:*black* :name "Smoke"
                                               :trait-blocks-vision 80 :trait-smoke +feature-smoke-thin+ :trait-no-gravity t
                                               :can-merge-func #'(lambda (level feature-new)
                                                                   (let ((result nil))
                                                                     (loop for feature-old-id in (aref (features level) (x feature-new) (y feature-new) (z feature-new))
                                                                           for feature-old = (get-feature-by-id feature-old-id)
                                                                           when (or (= (feature-type feature-new) (feature-type feature-old))
                                                                                    (= (feature-type feature-old) +feature-smoke-thin+))
                                                                             do
                                                                                (setf result t)
                                                                                (loop-finish)
                                                                           )
                                                                     result))
                                               :merge-func #'(lambda (level feature-new)
                                                               (loop for feature-old-id in (aref (features level) (x feature-new) (y feature-new) (z feature-new))
                                                                     for feature-old = (get-feature-by-id feature-old-id)
                                                                     when (or (= (feature-type feature-new) (feature-type feature-old))
                                                                              (= (feature-type feature-old) +feature-smoke-thin+))
                                                                       do
                                                                          (remove-feature-from-level-list level feature-new)
                                                                          (remove-feature-from-world feature-new)
                                                                          (incf (counter feature-old))
                                                                          (loop-finish)
                                                                     )
                                                               )
                                               :on-tick-func #'feature-smoke-on-tick))

(set-feature-type (make-instance 'feature-type :id +feature-fire+ :glyph-idx 120 :glyph-color (sdl:color :r 255 :g 69 :b 0) :back-color sdl:*black* :name "Fire" :trait-fire t
                                               :merge-func #'(lambda (level feature-new)
                                                               (loop for feature-old-id in (aref (features level) (x feature-new) (y feature-new) (z feature-new))
                                                                     for feature-old = (get-feature-by-id feature-old-id)
                                                                     when (= (feature-type feature-new) (feature-type feature-old))
                                                                       do
                                                                          (remove-feature-from-level-list level feature-new)
                                                                          (remove-feature-from-world feature-new)
                                                                          (incf (counter feature-old))
                                                                          (loop-finish)
                                                                     )
                                                               )
                                               :on-tick-func #'(lambda (level feature)
                                                                 ;; damage mobs
                                                                 (when (get-mob-* level (x feature) (y feature) (z feature))
                                                                   (let ((target (get-mob-* level (x feature) (y feature) (z feature))))

                                                                     (inflict-damage target :min-dmg 1 :max-dmg (counter feature) :dmg-type +weapon-dmg-fire+
                                                                                            :att-spd nil :weapon-aux '(:is-fire) :acc 100 :add-blood nil :no-dodge t
                                                                                            :actor nil
                                                                                            :specific-hit-string-func #'(lambda (cur-dmg)
                                                                                                                          (format nil "~A takes ~A fire damage. " (capitalize-name (name target)) cur-dmg))
                                                                                            :specific-no-dmg-string-func #'(lambda ()
                                                                                                                             (format nil "~A takes no damage from fire. " (capitalize-name (name target)))))

                                                                     (when (check-dead target)
                                                                       (when (eq target *player*)
                                                                         (setf (killed-by *player*) "fire")))
                                                                     ))
                                                                 ;; spread fire
                                                                 (let ((dir (1+ (random 9)))
                                                                       (dx) (dy))
                                                                   (multiple-value-setq (dx dy) (x-y-dir dir))
                                                                   (setf dx (+ (x feature) dx) dy (+ (y feature) dy))
                                                                   (ignite-tile level dx dy (z feature) (x feature) (y feature) (z feature)))
                                                                 ;; produce smoke
                                                                 (when (<= (random 3) 1)
                                                                   (add-feature-to-level-list level (make-instance 'feature :feature-type +feature-smoke-thin+ :x (x feature) :y (y feature) :z (z feature))))
                                                                 ;; decrease counter and die out
                                                                 (decf (counter feature))
                                                                 (when (<= (counter feature) 0)
                                                                   (remove-feature-from-level-list level feature)
                                                                   (remove-feature-from-world feature))
                                                                 )))
								
(set-feature-type (make-instance 'feature-type :id +feature-start-church-player+ :glyph-idx 0 :glyph-color sdl:*black* :back-color sdl:*black* :name "Player Church Starting Position" :trait-remove-on-dungeon-generation t))

(set-feature-type (make-instance 'feature-type :id +feature-start-repel-demons+ :glyph-idx 0 :glyph-color sdl:*black* :back-color sdl:*black* :name "Repel Demons Starting Location" :trait-remove-on-dungeon-generation t))

(set-feature-type (make-instance 'feature-type :id +feature-smoke-flare+ :glyph-idx 98 :glyph-color sdl:*magenta* :back-color sdl:*black* :name "Smoke"
                                               :trait-blocks-vision 60 :trait-smoke +feature-smoke-flare+ :trait-no-gravity t
                                               :can-merge-func #'(lambda (level feature-new)
                                                                   (let ((result nil))
                                                                     (loop for feature-old-id in (aref (features level) (x feature-new) (y feature-new) (z feature-new))
                                                                           for feature-old = (get-feature-by-id feature-old-id)
                                                                           when (or (= (feature-type feature-new) (feature-type feature-old))
                                                                                    )
                                                                             do
                                                                                (setf result t)
                                                                                (loop-finish)
                                                                           )
                                                                     result))
                                               :merge-func #'(lambda (level feature-new)
                                                               (loop for feature-old-id in (aref (features level) (x feature-new) (y feature-new) (z feature-new))
                                                                     for feature-old = (get-feature-by-id feature-old-id)
                                                                     when (= (feature-type feature-new) (feature-type feature-old))
                                                                       do
                                                                          (remove-feature-from-level-list level feature-new)
                                                                          (remove-feature-from-world feature-new)
                                                                          (incf (counter feature-old))
                                                                          (loop-finish)
                                                                     )
                                                               )
                                               :on-tick-func #'feature-smoke-on-tick))

(set-feature-type (make-instance 'feature-type :id +feature-smoke-flare-final+ :glyph-idx 98 :glyph-color sdl:*magenta* :back-color sdl:*black* :name "Smoke"
                                               :trait-blocks-vision 60 :trait-smoke +feature-smoke-flare-final+ :trait-no-gravity t
                                               :on-tick-func #'(lambda (level feature)
                                                                 (decf (counter feature))

                                                                 (when (zerop (counter feature))

                                                                   (print-visible-message (x feature) (y feature) (z feature) (level *world*) 
                                                                                          (format nil "Artillery shoots. "))
                                                                   
                                                                   (let ((targets nil)
                                                                         (max-range 2))
                                                                     (draw-fov (x feature) (y feature) (z feature) max-range
                                                                               #'(lambda (dx dy dz prev-cell)
                                                                                   (let ((exit-result t))
                                                                                     (block nil
                                                                                       (when (> (get-distance-3d (x feature) (y feature) (z feature) dx dy dz) (1+ max-range))
                                                                                         (setf exit-result 'exit)
                                                                                         (return))
                                                                                       
                                                                                       (when (eq (check-LOS-propagate dx dy dz prev-cell :check-move t) nil)
                                                                                         (setf exit-result 'exit)
                                                                                         (return))

                                                                                       (place-animation dx dy dz +anim-type-fire-dot+ :params ())
                                                                                       
                                                                                       (when (and (get-mob-* level dx dy dz) 
                                                                                                  )
                                                                                         (pushnew (get-mob-* level dx dy dz) targets)
                                                                                         )
                                                                                       )
                                                                                     exit-result)))

                                                                     (loop for target in targets
                                                                           for cur-dmg = 0
                                                                           do
                                                                              (incf cur-dmg (inflict-damage target :min-dmg 3 :max-dmg 6 :dmg-type +weapon-dmg-fire+
                                                                                                                   :att-spd nil :weapon-aux (list :is-fire) :acc 100 :add-blood t :no-dodge t :no-hit-message t :no-check-dead t
                                                                                                                   :actor (get-mob-by-id (param1 feature))))
                                                                              (incf cur-dmg (inflict-damage target :min-dmg 5 :max-dmg 7 :dmg-type +weapon-dmg-iron+
                                                                                                                   :att-spd nil :weapon-aux (list :is-fire) :acc 100 :add-blood t :no-dodge t :no-hit-message t :no-check-dead t
                                                                                                                   :actor (get-mob-by-id (param1 feature))))
                                                                              
                                                                              (if (zerop cur-dmg)
                                                                                (print-visible-message (x feature) (y feature) (z feature) (level *world*) 
                                                                                                       (format nil "~A is not hurt. " (capitalize-name (prepend-article +article-the+ (visible-name target)))))
                                                                                (print-visible-message (x feature) (y feature) (z feature) (level *world*) 
                                                                                                       (format nil "~A takes ~A damage. " (capitalize-name (prepend-article +article-the+ (visible-name target))) cur-dmg)))
                                                                              (when (check-dead target)
                                                                                (make-dead target :splatter t :msg t :msg-newline nil :killer (get-mob-by-id (param1 feature)) :corpse t :aux-params (list :is-fire))
                                                                                
                                                                                (when (mob-effect-p target +mob-effect-possessed+)
                                                                                  (setf (cur-hp (get-mob-by-id (slave-mob-id target))) 0)
                                                                                  (setf (x (get-mob-by-id (slave-mob-id target))) (x target)
                                                                                        (y (get-mob-by-id (slave-mob-id target))) (y target)
                                                                                        (z (get-mob-by-id (slave-mob-id target))) (z target))
                                                                                  (make-dead (get-mob-by-id (slave-mob-id target)) :splatter nil :msg nil :msg-newline nil :corpse nil :aux-params ()))))

                                                                     (remove-feature-from-level-list level feature)
                                                                     (remove-feature-from-world feature)
                                                                     
                                                                     ;; process animations for this turn if any
                                                                     (when (animation-queue *world*)
                                                                       
                                                                       (loop for animation in (animation-queue *world*)
                                                                             do
                                                                                (play-animation animation))
                                                                       (sdl:update-display)
                                                                       (sdl-cffi::sdl-delay 100)
                                                                       (setf (animation-queue *world*) nil)
                                                                       (update-map-area))
                                                                   
                                                                   ))
                                                                 )))

(set-feature-type (make-instance 'feature-type :id +feature-corrosive-bile-target+ :glyph-idx 99 :glyph-color sdl:*yellow* :back-color sdl:*black* :name "Bile destination"
                                               :trait-no-gravity t
                                               :on-tick-func #'(lambda (level feature)
                                                                 (decf (counter feature))

                                                                 (when (zerop (counter feature))

                                                                   (print-visible-message (x feature) (y feature) (z feature) (level *world*) 
                                                                                          (format nil "Corrosive bile lands. "))
                                                                   
                                                                   (let ((targets nil)
                                                                         (max-range 1))
                                                                     (draw-fov (x feature) (y feature) (z feature) max-range
                                                                               #'(lambda (dx dy dz prev-cell)
                                                                                   (let ((exit-result t))
                                                                                     (block nil
                                                                                       (when (> (get-distance-3d (x feature) (y feature) (z feature) dx dy dz) (1+ max-range))
                                                                                         (setf exit-result 'exit)
                                                                                         (return))
                                                                                       
                                                                                       (when (eq (check-LOS-propagate dx dy dz prev-cell :check-move t) nil)
                                                                                         (setf exit-result 'exit)
                                                                                         (return))

                                                                                       (place-animation dx dy dz +anim-type-fire-dot+ :params ())
                                                                                       
                                                                                       (when (and (get-mob-* level dx dy dz) 
                                                                                                  )
                                                                                         (pushnew (get-mob-* level dx dy dz) targets)
                                                                                         )
                                                                                       )
                                                                                     exit-result)))

                                                                     (loop for target in targets
                                                                           for cur-dmg = 0
                                                                           do
                                                                              (incf cur-dmg (inflict-damage target :min-dmg 4 :max-dmg 8 :dmg-type +weapon-dmg-acid+
                                                                                                                   :att-spd nil :weapon-aux () :acc 100 :add-blood t :no-dodge t :no-hit-message t :no-check-dead t
                                                                                                                   :actor (get-mob-by-id (param1 feature))))
                                                                              (if (zerop cur-dmg)
                                                                                (print-visible-message (x feature) (y feature) (z feature) (level *world*) 
                                                                                                       (format nil "~A is not hurt. " (capitalize-name (prepend-article +article-the+ (visible-name target)))))
                                                                                (print-visible-message (x feature) (y feature) (z feature) (level *world*) 
                                                                                                       (format nil "~A takes ~A damage. " (capitalize-name (prepend-article +article-the+ (visible-name target))) cur-dmg)))
                                                                              (when (check-dead target)
                                                                                (make-dead target :splatter t :msg t :msg-newline nil :killer (get-mob-by-id (param1 feature)) :corpse t :aux-params (list :is-fire))
                                                                                
                                                                                (when (mob-effect-p target +mob-effect-possessed+)
                                                                                  (setf (cur-hp (get-mob-by-id (slave-mob-id target))) 0)
                                                                                  (setf (x (get-mob-by-id (slave-mob-id target))) (x target)
                                                                                        (y (get-mob-by-id (slave-mob-id target))) (y target)
                                                                                        (z (get-mob-by-id (slave-mob-id target))) (z target))
                                                                                  (make-dead (get-mob-by-id (slave-mob-id target)) :splatter nil :msg nil :msg-newline nil :corpse nil :aux-params ()))))

                                                                     (remove-feature-from-level-list level feature)
                                                                     (remove-feature-from-world feature)
                                                                     
                                                                     ;; process animations for this turn if any
                                                                     (when (animation-queue *world*)
                                                                       
                                                                       (loop for animation in (animation-queue *world*)
                                                                             do
                                                                                (play-animation animation))
                                                                       (sdl:update-display)
                                                                       (sdl-cffi::sdl-delay 100)
                                                                       (setf (animation-queue *world*) nil)
                                                                       (update-map-area))
                                                                   
                                                                   ))
                                                                 )))
