;./lpg-td-1.0 -o domain.pddl -f problem.pddl -n 1 -out out
(define (domain LIFT)
  (:requirements :strips :typing :durative-actions :fluents)
  (:types integer - object
		  passenger - object
		  lift - object
		  lift-slow lift-fast - lift)
  (:predicates 
    (next ?x - integer ?y - integer) 
	(above ?x - integer ?y - integer)
	(can-go ?x - lift ?y - integer)
	(can-hold ?x - lift ?y  - integer)
	(passenger-at ?x - passenger ?y - integer)
	(lift-at ?x - lift ?y - integer)
	(boarded ?y - passenger ?x - lift)
	(on-board ?x - lift ?y - integer)
  )

  (:functions 
            (travel-slow ?f1 - integer ?f2 - integer) - number
            (travel-fast ?f1 - integer ?f2 - integer) - number 
  )

   (:durative-action get-on
    	     :parameters (?l - lift ?p - passenger ?f - integer ?bn - integer ?an - integer)
			 :duration (= ?duration 2)
    	     :condition (and (at start (passenger-at ?p ?f)) (over all (lift-at ?l ?f))
			 (at start (on-board ?l ?bn))(at start (can-hold ?l ?an))  (at start (next ?bn ?an)))
    	     :effect (and (at start (not (passenger-at ?p ?f))) (at end (boarded ?p ?l))
			 (at start (not (on-board ?l ?bn) )) (at end (on-board ?l ?an))))

   (:durative-action get-down
    	     :parameters (?l - lift ?p - passenger ?f - integer ?bn - integer ?an - integer)
			 :duration (= ?duration 2)
    	     :condition (and  (over all (lift-at ?l ?f)) (at start (boarded ?p ?l)) 
			 (at start (on-board ?l ?bn)) (at start (next?an ?bn)))
    	     :effect
    	     (and (at start (not(boarded ?p ?l))) (at end (passenger-at ?p ?f))
			 (at start (not (on-board ?l ?bn) )) (at end (on-board ?l ?an))))
   
   ;=========================================ascensor lento==================================
   (:durative-action move-up-slow
	     :parameters (?l - lift-slow ?f1 - integer ?f2 - integer)
		 :duration (= ?duration (travel-slow ?f1 ?f2))
	     :condition (and (at start(lift-at ?l ?f1)) (at start(can-go ?l ?f2)) (at start(above ?f1 ?f2)))
	     :effect
	     (and (at start (not (lift-at ?l ?f1))) (at end  (lift-at ?l ?f2))))

    (:durative-action move-down-slow
    	        :parameters (?l - lift-slow ?f1 - integer ?f2 - integer)
				:duration (= ?duration (travel-slow ?f2 ?f1))
    	        :condition (and (at start(lift-at ?l ?f1)) (at start(can-go ?l ?f2)) (at start(above ?f2 ?f1)))
    	        :effect
	     (and (at start (not (lift-at ?l ?f1))) (at end (lift-at ?l ?f2)) ))

	;=====================================ascensor rapido========================================
	(:durative-action move-up-fast
	     :parameters (?l - lift-fast ?f1 - integer ?f2 - integer)
		 :duration (= ?duration (travel-fast ?f1 ?f2))
	     :condition (and (at start(lift-at ?l ?f1)) (at start(can-go ?l ?f2)) (at start(above ?f1 ?f2)))
	     :effect
	     (and (at start (not (lift-at ?l ?f1))) (at end  (lift-at ?l ?f2))))

    (:durative-action move-down-fast
    	        :parameters (?l - lift-fast ?f1 - integer ?f2 - integer)
				:duration (= ?duration (travel-fast ?f1 ?f2))
    	        :condition (and (at start(lift-at ?l ?f1)) (at start(can-go ?l ?f2)) (at start(above ?f2 ?f1)))
    	        :effect
	     (and (at start (not (lift-at ?l ?f1))) (at end (lift-at ?l ?f2)) ))
)    