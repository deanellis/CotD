(in-package :cotd)

(defun create-template-test-city (max-x max-y entrance)
  (declare (ignore entrance))
  
  (format t "CREATE-TEMPLATE-TEST-CITY~%")

  (setf max-x *max-x-level*)
  (setf max-y *max-y-level*)

  (let ((template-level (make-array (list max-x max-y) :element-type 'fixnum :initial-element +terrain-border-floor+))
	(feature-list)
        (level-template (list ".............................................................................."
                              ".............................................................................."
                              "...#######..#######.############..........................######.....######..."
                              "...#.....#..#.....#.#....#.....#..........................#....#.....#....#..."
                              "...#.....#..#.....#.#..........#..........................#...............#..."
                              "...#.....#..#.....#.#....#.....#..........................#....#.....#....#..."
                              "...###.###..###.###.########.###..........................######.....######..."
                              ".............................................................................."
                              "..........................................................######.....######..."
                              "..........................................................#....#.....#....#..."
                              "...###.###................................................#...............#..."
                              "...#.....#................................................#....#.....#....#..."
                              "...#.....#................................................######.....######..."
                              "...#.....#............#####.......#####......................................."
                              "...#######............#...............#......................................."
                              "......................#...............#......................................."
                              "...#######............########.########...................######.....######..."
                              "...#.....#............#....#.....#....#...................#...............#..."
                              "...#..................#...............#...................#...............#..."
                              "...#.....#............#....#.....#....#...................#...............#..."
                              "...#######............#################...................#################..."
                              ".............................................................................."
                              ".............................................................................."))
        )
    
    (loop for y from 1 below (1- max-y) do
      (loop for x from 1 below (1- max-y) do
        (setf (aref template-level x y) +terrain-floor-stone+)))
    
    (loop for y from 0 below (length level-template) do
      (loop for c across (nth y level-template) 
            with x = 0
            do
               (cond
                 ((char= c #\.) (setf (aref template-level (1+ x) (1+ y)) +terrain-floor-stone+))
                 ((char= c #\#) (setf (aref template-level (1+ x) (1+ y)) +terrain-wall-stone+))
                 )
               (incf x)
            ))
    
    
    (values template-level feature-list nil)
    ))
