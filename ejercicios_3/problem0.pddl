(define (problem LIFT-PROBLEM)
    (:domain LIFT)
        (:objects
            n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12  - integer ; contadores (capacidad en el ascensor y secuencia de pisos)
            p0 p1 p2 p3 p4 p5 - passenger ; pasajeros
            lift-slow lift-fast - lift ; tipos de ascensores
            lift1 lift2 lift3 lift4 - lift-slow ; ascensores lentos
            lift5 - lift-fast ; ascensores rapidos
        )
        (:init
            ;=============================incremento=================================================
            (next n0 n1) (next n1 n2) (next n2 n3)

            ;==========================valor de cada pisos===================================
            (=(floor n0) 0) (=(floor n1) 1) (=(floor n2) 2) (=(floor n3) 3) (=(floor n4) 4) (=(floor n5) 5) (=(floor n6) 6)
            (=(floor n7) 7) (=(floor n8) 8) (=(floor n9) 9) (=(floor n10) 10) (=(floor n11) 11) (=(floor n12) 12)

            ;============================tiempo necesario para alcanzar un piso realizado por el ascensor lento ==============
            (= (travel-slow n0 n1) 12) (= (travel-slow n0 n2) 20) (= (travel-slow n0 n3) 28) (= (travel-slow n0 n4) 36) 
            (= (travel-slow n1 n2) 12) (= (travel-slow n1 n3) 20) (= (travel-slow n1 n4) 28)
            (= (travel-slow n2 n3) 12) (= (travel-slow n2 n4) 20)
            (= (travel-slow n3 n4) 12)
            (= (travel-slow n4 n5) 12) (= (travel-slow n4 n6) 20) (= (travel-slow n4 n7) 28) (= (travel-slow n4 n8) 36)
            (= (travel-slow n5 n6) 12) (= (travel-slow n5 n7) 20) (= (travel-slow n5 n8) 28)
            (= (travel-slow n6 n7) 12) (= (travel-slow n6 n8) 20)
            (= (travel-slow n7 n8) 12)
            (= (travel-slow n8 n9) 12) (= (travel-slow n8 n10) 20) (= (travel-slow n8 n11) 28) (= (travel-slow n8 n12) 36)
            (= (travel-slow n9 n10) 12) (= (travel-slow n9 n11) 20) (= (travel-slow n9 n12) 28)
            (= (travel-slow n10 n11) 12) (= (travel-slow n10 n12) 20)
            (= (travel-slow n11 n12) 12)

            ;============================tiempo necesario para alcanzar un piso realizado por el ascensor rapido ==============
            (= (travel-fast n0 n2) 11) (= (travel-fast n0 n4) 13) (= (travel-fast n0 n6) 15) (= (travel-fast n0 n8) 17) (= (travel-fast n0 n10) 19) (= (travel-fast n0 n12) 21)
            (= (travel-fast n2 n4) 11) (= (travel-fast n2 n6) 13) (= (travel-fast n2 n8) 15) (= (travel-fast n2 n10) 17) (= (travel-fast n2 n12) 19)
            (= (travel-fast n4 n6) 11) (= (travel-fast n4 n8) 13) (= (travel-fast n4 n10) 15) (= (travel-fast n4 n12) 17)
            (= (travel-fast n6 n8) 11) (= (travel-fast n6 n10) 13) (= (travel-fast n6 n12) 15)
            (= (travel-fast n8 n10) 11) (= (travel-fast n8 n12) 13)
            (= (travel-fast n10 n12) 11)

            (= (travel-fast n12 n10) 10) (= (travel-fast n12 n8) 12) (= (travel-fast n12 n6) 14) (= (travel-fast n12 n4) 16) (= (travel-fast n12 n2) 18) (= (travel-fast n12 n0) 20)
            (= (travel-fast n10 n8) 10) (= (travel-fast n10 n6) 12) (= (travel-fast n10 n4) 14) (= (travel-fast n10 n2) 16) (= (travel-fast n10 n0) 18)
            (= (travel-fast n8 n6) 10) (= (travel-fast n8 n4) 12) (= (travel-fast n8 n2) 14) (= (travel-fast n8 n0) 16)
            (= (travel-fast n6 n4) 10) (= (travel-fast n6 n2) 12) (= (travel-fast n6 n0) 14)
            (= (travel-fast n4 n2) 10) (= (travel-fast n4 n0) 12)
            (= (travel-fast n2 n0) 10)

            ;============================ nivel de bateria asencores ==============
            (= (battery-level lift1) 500) (= (battery-level lift2) 500) (= (battery-level lift3) 500) (= (battery-level lift4) 500) (= (battery-level lift5) 500)
            
            ;============================ uncharge voleres ==============
            (= (uncharge lift1) 0.2 ) (= (uncharge lift2) 0.2 ) (= (uncharge lift3) 0.2 ) (= (uncharge lift4) 0.2 ) (= (uncharge lift5) 0.2 )
            

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

            (passenger-at p0 n2)
            (passenger-at p1 n4)
            (passenger-at p2 n1)
            (passenger-at p3 n8)
            (passenger-at p4 n1)

            (= (total-energy-used) 0)
        )
    (:goal (and 
            (passenger-at p0 n3) (passenger-at p1 n11) (passenger-at p2 n12) (passenger-at p3 n1) (passenger-at p4 n9)
        )
    )
    (:metric minimize (total-energy-used))
)


; ./lpg-td-1.0 -o domain.pddl -f problem.pddl -n 1 -out sol.txt   ;; fichero para la solución

; sudo apt-get install cmake coinor-libcbc-dev coinor-libclp-dev \coinor-libcoinutils-dev libbz2-dev bison flex