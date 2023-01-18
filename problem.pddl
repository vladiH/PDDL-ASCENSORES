(define (problem LIFT-PROBLEM)
(:domain LIFT)
    (:objects
        n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12  - integer ; contadores (capacidad en el ascensor y secuencia de pisos)
        p0 p1 p2 p3 p4 p5 - passenger ; pasajeros
        slow fast - lift ; tipos de ascensores
        lift1 lift2 lift3 lift4 - slow ; ascensores lentos
        lift5 - fast ; ascensores rapidos
    )
    (:init
        ;=============================incremento=================================================
        (next n0 n1) (next n1 n2) (next n2 n3)
        
        ;==========================distribucion de pisos===================================
        (above n0 n1) (above n0 n2) (above n0 n3) (above n0 n4) (above n0 n5) (above n0 n6) (above n0 n7) (above n0 n8) (above n0 n9) (above n0 n10) (above n0 n11) (above n0 n12)
        (above n1 n2) (above n1 n3) (above n1 n4) (above n1 n5) (above n1 n6) (above n1 n7) (above n1 n8) (above n1 n9) (above n1 n10) (above n1 n11) (above n1 n12) 
        (above n2 n3) (above n2 n4) (above n2 n5) (above n2 n6) (above n2 n7) (above n2 n8) (above n2 n9) (above n2 n10) (above n2 n11) (above n2 n12) 
        (above n3 n4) (above n3 n5) (above n3 n6) (above n3 n7) (above n3 n8) (above n3 n9) (above n3 n10) (above n3 n11) (above n3 n12) 
        (above n4 n5) (above n4 n6) (above n4 n7) (above n4 n8) (above n4 n9) (above n4 n10) (above n4 n11) (above n4 n12) 
        (above n5 n6) (above n5 n7) (above n5 n8) (above n5 n9) (above n5 n10) (above n5 n11) (above n5 n12) 
        (above n6 n7) (above n6 n8) (above n6 n9) (above n6 n10) (above n6 n11) (above n6 n12) 
        (above n7 n8) (above n7 n9) (above n7 n10) (above n7 n11) (above n7 n12) 
        (above n8 n9) (above n8 n10) (above n8 n11) (above n8 n12) 
        (above n9 n10) (above n9 n11) (above n9 n12) 
        (above n10 n11) (above n10 n12) 
        (above n11 n12) 
        ;=================== estados iniciales del ascensor 1 lento =========================
        (can-go lift1 n0) (can-go lift1 n1)  (can-go lift1 n2) (can-go lift1 n3) (can-go lift1 n4); a que pisos puede ir?
        (can-hold lift1 n0) (can-hold lift1 n1) (can-hold lift1 n2); cuantas personas soporta el ascensor?
        (on-board lift1 n0); cuantos estan dentro del ascensor
        (lift-at lift1 n0); donde se encuentra el ascensor?

        ;=================== estados iniciales del ascensor 2 lento =========================
        (can-go lift2 n4) (can-go lift2 n5)  (can-go lift2 n6) (can-go lift2 n7) (can-go lift2 n8)
        (can-hold lift2 n0) (can-hold lift2 n1) (can-hold lift2 n2)
        (on-board lift2 n0)
        (lift-at lift2 n5)

        ;=================== estados iniciales del ascensor 3 lento  =========================
        (can-go lift3 n4) (can-go lift3 n5)  (can-go lift3 n6) (can-go lift3 n7) (can-go lift3 n8)
        (can-hold lift3 n0) (can-hold lift3 n1) (can-hold lift3 n2)
        (on-board lift3 n0)
        (lift-at lift3 n5)

        ;=================== estados iniciales del ascensor 4 lento =========================
        (can-go lift4 n8) (can-go lift4 n9)  (can-go lift4 n10) (can-go lift4 n11) (can-go lift4 n12)
        (can-hold lift4 n0) (can-hold lift4 n1) (can-hold lift4 n2)
        (on-board lift4 n0)
        (lift-at lift4 n9)

        ;=================== estados iniciales del ascensor 5 rapido =========================
        (can-go lift5 n0) (can-go lift5 n2)  (can-go lift5 n4) (can-go lift5 n6) (can-go lift5 n8) (can-go lift5 n10) (can-go lift5 n12)
        (can-hold lift5 n0) (can-hold lift5 n1) (can-hold lift5 n2) (can-hold lift5 n3)
        (on-board lift5 n0)
        (lift-at lift5 n0)
    )
)
(:goal 
    (and 
        (passenger-at p0 n3) (passenger-at p1 n11) (passenger-at p2 n12) (passenger-at p3 n1) (passenger-at p4 n9)
    )
)
