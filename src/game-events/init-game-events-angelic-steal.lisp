(in-package :cotd)

;;===========================
;; WIN EVENTS
;;===========================

(set-game-event (make-instance 'game-event :id +game-event-angelic-steal-win-for-angels+
                                           :descr-func #'(lambda ()
                                                           "To win, capture the relic in the corrupted shrine and get to the edge of the map with it. To lose, have all angels killed.")
                                           :disabled nil
                                           :on-check #'(lambda (world)
                                                         (if (and (get-angel-steal-angel-with-relic world)
                                                                  (or (<= (x (get-angel-steal-angel-with-relic world)) 1)
                                                                      (>= (x (get-angel-steal-angel-with-relic world)) (- (array-dimension (terrain (level world)) 0) 2))
                                                                      (<= (y (get-angel-steal-angel-with-relic world)) 1)
                                                                      (>= (y (get-angel-steal-angel-with-relic world)) (- (array-dimension (terrain (level world)) 1) 2))))
                                                           t
                                                           nil))
                                           :on-trigger #'(lambda (world)
                                                           ;; write highscores
                                                           (let* ((final-str "Relic sucessfully returned.")
                                                                  (score (calculate-player-score (+ 1400 (if (not (mimic-id-list *player*))
                                                                                                           0
                                                                                                           (loop for mimic-id in (mimic-id-list *player*)
                                                                                                                 for mimic = (get-mob-by-id mimic-id)
                                                                                                                 with cur-score = 0
                                                                                                                 when (not (eq mimic *player*))
                                                                                                                   do
                                                                                                                      (incf cur-score (cur-score mimic))
                                                                                                                 finally (return cur-score))))))
                                                                  (highscores-place)
                                                                  (player-faction (if (or (= (loyal-faction *player*) +faction-type-angels+)
                                                                                          (= (loyal-faction *player*) +faction-type-church+))
                                                                                    t
                                                                                    nil))
                                                                  (player-died (player-check-dead)))

                                                             (when player-died
                                                               (multiple-value-setq (final-str score) (dump-when-dead)))

                                                             (setf highscores-place (add-highscore-record (make-highscore-record (name *player*)
                                                                                                                                 score
                                                                                                                                 (if (mimic-id-list *player*)
                                                                                                                                   (faction-name *player*)
                                                                                                                                   (capitalize-name (name (get-mob-type-by-id (mob-type *player*)))))
                                                                                                                                 (real-game-time world)
                                                                                                                                 final-str
                                                                                                                                 (level-layout (level world)))
                                                                                                          *highscores*))
                                                           
                                                             (write-highscores-to-file *highscores*)
                                                             (dump-character-on-game-over (name *player*) score (real-game-time world) (sf-name (get-scenario-feature-by-id (level-layout (level world))))
                                                                                          final-str (return-scenario-stats nil))

                                                             (if player-faction
                                                               (progn
                                                                 (add-message (format nil "~%"))
                                                                 (add-message (format nil "Congratulations! Your faction has won!~%"))
                                                                 (add-message (format nil "~%Press any key...~%")))
                                                               (progn
                                                                 (add-message (format nil "~%"))
                                                                 (add-message (format nil "Curses! Your faction has lost!~%"))
                                                                 (add-message (format nil "~%Press any key...~%"))))
                                                             
                                                             (setf *current-window* (make-instance 'cell-window))
                                                             (make-output *current-window*)
                                                             (sdl:with-events ()
                                                               (:quit-event () (funcall (quit-func *current-window*)) t)
                                                               (:key-down-event () 
                                                                                (setf *current-window* (make-instance 'final-stats-window :game-over-type +game-over-angels-won+ :highscores-place highscores-place
                                                                                                                                          :player-won player-faction :player-died player-died))
                                                                                (make-output *current-window*)
                                                                                (run-window *current-window*))
                                                               (:video-expose-event () (make-output *current-window*)))))))

(set-game-event (make-instance 'game-event :id +game-event-angelic-steal-win-for-demons+
                                           :descr-func #'(lambda ()
                                                           "To win, destroy all angels in the district. To lose, have all demons killed or let the angels take the relic and escape with it.")
                                           :disabled nil
                                           :on-check #'(lambda (world)
                                                         (if (or (and (= (loyal-faction *player*) +faction-type-demons+)
                                                                      (> (total-demons world) 0)
                                                                      (zerop (total-angels world)))
                                                                 (and (/= (loyal-faction *player*) +faction-type-demons+)
                                                                      (> (total-demons world) 0)
                                                                      (zerop (nth +faction-type-military+ (total-faction-list world)))
                                                                      (zerop (nth +faction-type-church+ (total-faction-list world)))
                                                                      (zerop (total-angels world))))
                                                           t
                                                           nil))
                                           :on-trigger #'(lambda (world)
                                                           ;; write highscores
                                                           (let* ((final-str "Angelic retrieval attempt prevented.")
                                                                  (score (calculate-player-score 1350))
                                                                  (highscores-place)
                                                                  (player-faction (if (or (= (loyal-faction *player*) +faction-type-demons+)
                                                                                          (= (loyal-faction *player*) +faction-type-satanists+))
                                                                                    t
                                                                                    nil))
                                                                  (player-died (player-check-dead)))

                                                             (when player-died
                                                               (multiple-value-setq (final-str score) (dump-when-dead)))

                                                             (setf highscores-place (add-highscore-record (make-highscore-record (name *player*)
                                                                                                                                score
                                                                                                                                (if (mimic-id-list *player*)
                                                                                                                                  (faction-name *player*)
                                                                                                                                  (capitalize-name (name (get-mob-type-by-id (mob-type *player*)))))
                                                                                                                                (real-game-time world)
                                                                                                                                final-str
                                                                                                                                (level-layout (level world)))
                                                                                                          *highscores*))
                                                             
                                                             (write-highscores-to-file *highscores*)
                                                             (dump-character-on-game-over (name *player*) score (real-game-time world) (sf-name (get-scenario-feature-by-id (level-layout (level world))))
                                                                                          final-str (return-scenario-stats nil))
                                                             
                                                             (if player-faction
                                                               (progn
                                                                 (add-message (format nil "~%"))
                                                                 (add-message (format nil "Congratulations! Your faction has won!~%"))
                                                                 (add-message (format nil "~%Press any key...~%")))
                                                               (progn
                                                                 (add-message (format nil "~%"))
                                                                 (add-message (format nil "Curses! Your faction has lost!~%"))
                                                                 (add-message (format nil "~%Press any key...~%"))))
                                                             (setf *current-window* (make-instance 'cell-window))
                                                             (make-output *current-window*)
                                                             (sdl:with-events ()
                                                               (:quit-event () (funcall (quit-func *current-window*)) t)
                                                               (:key-down-event () 
                                                                                (setf *current-window* (make-instance 'final-stats-window :game-over-type +game-over-demons-won+ :highscores-place highscores-place
                                                                                                                      :player-won player-faction :player-died player-died))
                                                                                (make-output *current-window*)
                                                                                (run-window *current-window*))
                                                               (:video-expose-event () (make-output *current-window*)))))))







;;===========================
;; ARRIVAL EVENTS
;;===========================




