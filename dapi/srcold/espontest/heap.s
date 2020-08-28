;;; Copyright ARM Ltd 2001. All rights reserved.

        AREA    Heap, DATA, NOINIT

        EXPORT bottom_of_heap

; Create dummy variable used to locate bottom of heap

bottom_of_heap    SPACE   1

        END
