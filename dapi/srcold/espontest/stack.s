;;; Copyright ARM Ltd 2001. All rights reserved.

        AREA    Stacks, DATA, NOINIT

        EXPORT top_of_stacks

; Create dummy variable used to locate stacks in memory

top_of_stacks    SPACE   1

        END
