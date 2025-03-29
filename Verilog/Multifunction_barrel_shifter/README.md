# Overview
* reverse8 -> 8-bit reversal circuit
* rotate_leftx -> x-bit rotate left circuit (where x can be 8, 16 or 32)
* rotate_rightx -> x-bit rotate right circuit (where x can be 8, 16 or 32)
* bshifterx -> x-bit barrel shifter that can perform left or right rotation, implemented using one rotate left and one rotate right circuits (where x can be 8, 16 or 32)
* bshifterx_r -> x-bit barrel shifter that can perform left or right rotation, implemented using one rotate right circuit with pre- and post-reversing ciruits (where x can be 8, 16 or 32)