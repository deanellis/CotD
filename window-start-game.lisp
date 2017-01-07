(in-package :cotd)

(defclass start-game-window (window)
  ((cur-sel :initform 0 :accessor cur-sel)
   (menu-items :initform () :initarg :menu-items :accessor menu-items)
   (menu-funcs :initform () :initarg :menu-funcs :accessor menu-funcs)))

(defmethod make-output ((win start-game-window))
  (sdl:with-rectangle (a-rect (sdl:rectangle :x 0 :y 0 :w *window-width* :h *window-height*))
    (sdl:fill-surface sdl:*black* :template a-rect))
  
  (let ((font (sdl:initialise-default-font sdl:*font-6x13*)) (str "City of the Damned"))
    (sdl:draw-string-solid-* str (- (truncate *window-width* 2) (truncate (* (sdl:char-width font) (length str)) 2)) 10 :color sdl:*white* :font font))
  
  ;; drawing selection list
  (let ((cur-str) (color-list nil))
    (setf cur-str (cur-sel win))
    (dotimes (i (length (menu-items win)))
      ;; choose the description
      ;;(setf lst (append lst (list (aref (line-array win) i))))
      
      (if (= i cur-str) 
        (setf color-list (append color-list (list sdl:*yellow*)))
        (setf color-list (append color-list (list sdl:*white*)))))
    (draw-selection-list (menu-items win) cur-str (length (menu-items win)) 20 (+ 10 10) color-list))
  
  (sdl:update-display))

(defmethod run-window ((win start-game-window))
  (tagbody
     (sdl:with-events ()
       (:quit-event () (funcall (quit-func win)) t)
       (:key-down-event (:key key :mod mod :unicode unicode)
			
			(setf (cur-sel win) (run-selection-list key mod unicode (cur-sel win)))
                        (setf (cur-sel win) (adjust-selection-list (cur-sel win) (length (menu-items win))))
                        
                        (cond
			  ;; escape - quit
			  ((sdl:key= key :sdl-key-escape) 
			   (funcall (quit-func win)))
			  ;; enter - select
			  ((or (sdl:key= key :sdl-key-return) (sdl:key= key :sdl-key-kp-enter))
                           (when (and (menu-funcs win) (nth (cur-sel win) (menu-funcs win)))
                             (funcall (nth (cur-sel win) (menu-funcs win)) (cur-sel win)))
			   (go exit-func)))
			(go exit-func))
       (:video-expose-event () (make-output *current-window*)))
     exit-func (make-output *current-window*)))
