(in-package :cotd)

(defclass effect-type ()
  ((id :initarg :id :accessor id)
   (name :initarg :name :accessor name)
   (color-func :initform #'(lambda (effect actor)
                             (declare (ignore effect actor))
                             nil)
               :initarg :color-func :accessor color-func)
   (on-add :initform #'(lambda (effect actor)
                         (declare (ignore effect actor))
                         nil)
           :initarg :on-add :accessor on-add)
   (on-remove :initform #'(lambda (effect actor)
                            (declare (ignore effect actor))
                            nil)
              :initarg :on-remove :accessor on-remove)
   (on-tick :initform #'(lambda (effect actor)
                          (declare (ignore effect actor))
                          nil)
            :initarg :on-tick :accessor on-tick)
   ))

(defun set-effect-type (effect-type)
  (when (>= (id effect-type) (length *effect-types*))
    (adjust-array *effect-types* (list (1+ (id effect-type)))))
  (setf (aref *effect-types* (id effect-type)) effect-type))

(defun get-effect-type-by-id (effect-type-id)
  (aref *effect-types* effect-type-id)) 

(defclass effect ()
  ((id :initform 0 :accessor id :type fixnum)
   (effect-type :initarg :effect-type :accessor effect-type :type fixnum)
   (actor-id :initform nil :initarg :actor-id :accessor actor-id)
   (target-id :initform nil :initarg :target-id :accessor target-id)
   (cd :initform 0 :initarg :cd :accessor cd)
   (param1 :initform nil :initarg :param1 :accessor param1)
   ))

(defmethod initialize-instance :after ((effect effect) &key)
  (setf (id effect) (find-free-id *effects*))
  (setf (aref *effects* (id effect)) effect)

  )

(defun get-effect-by-id (effect-id)
  (aref *effects* effect-id))

(defun remove-effect-from-world (effect)
  (setf (aref *effects* (id effect)) nil))
