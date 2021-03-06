(in-package :cotd)

(defconstant +game-over-player-dead+ 0)
(defconstant +game-over-demons-won+ 1)
(defconstant +game-over-angels-won+ 2)
(defconstant +game-over-military-won+ 3)
(defconstant +game-over-player-possessed+ 4)
(defconstant +game-over-thief-won+ 5)
(defconstant +game-over-eater-won+ 6)
(defconstant +game-over-ghost-won+ 7)
(defconstant +game-over-church-won+ 8)
(defconstant +game-over-satanists-won+ 9)

(defclass final-stats-window (window)
  ((game-over-type :initarg :game-over-type :accessor game-over-type)
   (highscores-place :initform nil :initarg :highscores-place :accessor highscores-place)
   (player-died :initform nil :initarg :player-died :accessor player-died)
   (player-won :initform nil :initarg :player-won :accessor player-won)))

(defmethod make-output ((win final-stats-window))
  ;; fill the screen black
  (sdl:with-rectangle (a-rect (sdl:rectangle :x 0 :y 0 :w *window-width* :h *window-height*))
    (sdl:fill-surface sdl:*black* :template a-rect))
 
  ;; displaying the type of game over
  (let ((str (create-string)) (color))
    (if (player-won win)
      (progn
        (format str "VICTORY! ")
        (setf color sdl:*green*))
      (progn
        (format str "DEFEAT! ")
        (setf color sdl:*red*)))
    (when (player-died win)
      (format str "YOU DIED, AND "))
    (cond
      ((= (game-over-type win) +game-over-player-dead+) (setf str (format nil "YOU ARE DEAD")))
      ((= (game-over-type win) +game-over-demons-won+) (format str "THE PANDEMONIUM HIERARCHY WON"))
      ((= (game-over-type win) +game-over-angels-won+) (format str "THE CELESTIAL COMMUNION WON"))
      ((= (game-over-type win) +game-over-military-won+) (format str "THE MILITARY WON"))
      ((= (game-over-type win) +game-over-church-won+) (format str "THE CHURCH WON"))
      ((= (game-over-type win) +game-over-satanists-won+) (format str "THE SATANISTS WON"))
      ((= (game-over-type win) +game-over-player-possessed+) (setf str (format nil "YOU ARE POSSESSED")))
      ((= (game-over-type win) +game-over-thief-won+) (setf str (format nil "YOU HAVE COLLECTED ENOUGH VALUABLES AND MANAGED TO ESCAPE THE CITY")))
      ((= (game-over-type win) +game-over-eater-won+) (setf str (format nil "YOU HAVE KILLED ALL OUTSIDERS")))
      ((= (game-over-type win) +game-over-ghost-won+) (setf str (format nil "YOU HAVE PUT YOURSELF TO REST"))))
    
    (sdl:draw-string-solid-* str  (truncate *window-width* 2) 10 :justify :center :color color)
    )
  
  ;; display scenario stats
  (let* ((str (return-scenario-stats))
         (max-lines))
    
    (sdl:with-rectangle (a-rect (sdl:rectangle :x 0 :y 30 :w *window-width* :h (* 1 (sdl:get-font-height))))
      (setf max-lines (write-text str a-rect :count-only t)))
    
    (sdl:with-rectangle (a-rect (sdl:rectangle :x 0 :y 30 :w *window-width* :h (* max-lines (sdl:get-font-height))))
      (write-text str a-rect))

    (show-message-box 6 (+ 40 (* max-lines (sdl:get-font-height))) *window-width* (- *window-height* 40 10 (sdl:char-height sdl:*default-font*) (* (1+ max-lines) (sdl:get-font-height))) *full-message-box*)
    
    (sdl:draw-string-solid-* (format nil "[m] Main menu  [Esc] High Scores")
                             10 (- *window-height* 13 (sdl:char-height sdl:*default-font*))))
  
  (sdl:update-display))

(defmethod run-window ((win final-stats-window))
  (tagbody
     (sdl:with-events ()
       (:quit-event () (funcall (quit-func win)) t)
       (:key-down-event (:key key :mod mod :unicode unicode)
                        (declare (ignore mod unicode))
                        (cond
			  ;; escape - high scores
			  ((sdl:key= key :sdl-key-escape) 
                           (setf *current-window* (make-instance 'highscores-window :highscores-place (highscores-place win)))
                           (make-output *current-window*)
                           (run-window *current-window*)
                           (funcall *start-func*))
                          ;; m - main menu
                          ((sdl:key= key :sdl-key-m) 
                           (funcall *start-func*))
                          )
                        )
       (:video-expose-event () (make-output *current-window*)))
     exit-func (make-output *current-window*)))

