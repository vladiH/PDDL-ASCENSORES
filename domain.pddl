(define (domain LIFT)
  (:requirements :strips :typing)
  (:types integer - object
		  passenger - object
		  lift - object
		  slow fast - lift)
  (:predicates 
    (next ?x - integer ?y - integer) 
	(above ?x - integer ?y - integer)
	(can-go ?x - lift ?y - integer)
	(can-hold ?x - lift ?y  - passengers)
	(passenger-at ?x - passenger ?y - integer)
	(lift-at ?x - lift ?y - integer)
	(boarded ?y - passenger ?x - lift)
	(on-board ?x - lift ?y - passengers)
  )

   (:action get-on
    	     :parameters (?l - lift ?p - passenger ?f - integer ?bn - integer ?an - integer)
    	     :precondition (and (passenger-at ?p ?f) (lift-at ?l ?f) (on-board ?l ?bn) (can-hold ?l ?an)  (next ?bn ?an))
    	     :effect
    	     (and (not (passenger-at ?p ?f)) (not (lift-at ?l ?f)) (boarded ?p ?l) (on-board ?l ?an)))

   (:action get-down
    	     :parameters (?l - lift ?p - passenger ?f - integer ?bn - integer ?an - integer)
    	     :precondition (and  (lift-at ?l ?f) (boarded ?p ?l) (on-board ?l ?bn) (next?an ?bn))
    	     :effect
    	     (and (not(boarded ?p ?l)) (passenger-at ?p ?f) (on-board ?l ?an)))

   (:action move-up
	     :parameters (?l - lift ?f1 - integer ?f2 - integer)
	     :precondition (and (lift-at ?l ?f1) (can-go ?f1 ?f2) (above ?f1 ?f2))
	     :effect
	     (and (not (lift-at ?l ?f1)) (lift-at ?l ?f2) ))

    (:action move-down
    	        :parameters (?l - lift ?f1 - integer ?f2 - integer)
    	        :precondition (and (lift-at ?l ?f1) (can-go ?l ?f2) (above ?f2 ?f1))
    	        :effect
	     (and (not (lift-at ?l ?f1)) (lift-at ?l ?f2) ))
)    