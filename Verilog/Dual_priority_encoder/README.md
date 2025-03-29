# Overview
* prio_enc -> 12-to-4 binary priority encoder
* bin_dec -> 4-to-12 binary decoder
* dual_prio_enc -> Dual-priority encoder, it returns highest and second highest priority requests, implemented using two priority encoders and one decoder
* hex_to_sseg -> Hexadecimal digit to seven-segment LED decoder
* sseg_disp_mux -> Seven-segment display time-multiplexing circuit, it supports three digits
* dual_prio_enc_test -> Dual-priority encoder testing citcuit, can be launched on the Mimas v2 board using provided constraint file