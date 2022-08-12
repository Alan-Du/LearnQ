/+ want to convert a Arabic number into Roman numbers
/+ 1->A, 99->XCIX
/+ then convert Roman number into Caesar cipher
/+ A->1, C->3,...
num:1 4 5 9 10 40 50 90 100 400 500 900 1000;
sym:`I`IV`V`IX`X`XL`L`XC`C`CD`D`CM`M;

toRoman:{[x]
loc:12; ans:"";
while[x>0;
dd:x div num[loc]; x:x mod num[loc];
while[dd>0; ans,:string sym[loc]; dd-:1;];
loc-:1;];
:ans;}

toInt:{[arr]
ans:enlist 0;
ans,:{[x]((`int$x)-(`int$"A"))+1} each arr;
:sum ans;}

inputs:"14 65 32 46 40 28 68 96 95 83 66 16 45 61 87 64 27 16 1 8 24 29 70 13 49 32 73 90 88 5 24 72 54 42 34 20 26 27 62 43 13 54 44 43 94 65 11 53 4 95 9 1 43 47 59 77 58 56 43 46 89 42 26 40 11 66 26 93 77 59 31 9 15 40 18 45 36 45 85 26 84 51 71 54 92 6 39 63 32 57 43 58 28 81 83 89 50 44 34 46 3580 54 1914 3212 1976 430 2881 3249 3478 2436 3929 3787 3697 2703 881 2809 901 3832 2665 2479 3966 622 2721 3827 2556 1337 135 3689 3310 1722 2881 1267 263 901 2008 2672 1002 3979 3715 1325 2349 3135 2303 3745 3885 1953 1032 455 216 1829 661 3401 2019 2184 2521 3198 2970 1819 1324 1337 3575 1573 1988 268 17 1210 534 2482 1882 2127 3542 498 1482 2350 381 2345 911 2443 93 3956 998 838 2889 3914 3122 763 2094 3875 1724 2172 3932 3745 2170 2697 2016 2276 852 1288 3528 3344 490 2230 3517 769 1544 3101 790 664 2426 726 263 752 725 1879 1614 2963 831 1750 1354 2809 713 2494 1248 3346 37 483 3423 658 2366 2472 1167 1757 383 2126 2235 2326 426 1417 3787 1161 3902 1485 1066 3956 1582 2185 2575 1476 2455 2440 3045 652 2200 3830 3078 2424 2212 1317 672 2085 3123 2280 2399 3085 870 897 1182 901 1222 814 592 3490 2060 1082 2019 2585 1523 990 3943 2562 3681 2932 3513 757 380 3350 3893 1859 278 3698 67 1349 296 282 2349 2848 2167 978 2641 496 3628 1291 946 3215 2058 1150 2756 2467 1387 2682 3261 3547 784 1620 474 2410 519 1214 473 1807 3977 1829 3223 287 1512 3783 3002 40 332 3005 3536 2610 1380 2976 1382 2934 1613 195 171 1236 508 2067 1133 1391 2925 1927 2279 772 427 3241 1039 958 3500 3466 939 1414 3810 1060 3407 662 950 2843 2299 3143 1804 3554 1571 2125 1262 3225 1921 1665 586 3594 1870 2309 805 2044 2353 2325 1497 583 546 2260 207 3356 2585 2698 3025 1892 3090 301 1389 3458 844 972 457 1499 1052 1411 205 1016 628 848 2880 3189 1938 1494 446 1779 2248 2037 3408 700 602 1551 3608 904 708 2717 1483 797 3744 413 1279 2276 246 3503 1772 372 2901 1660 3852 3463 2620 98 1997 2993 3956 590 270 2306 3710 1699 841 3746 1090 1680 656 2751 1319 3868 641 2159 1261 811 2452 380 1565 3845 2250 299 3849 2742 2507 400 2170 3711 394 997 2340 1509 2557 874 53 680 1570 1969 2080 1659 2731 917 2928 299 660 2086 2399 2573 2136 1891 1317 2333 1131 2011 2449 766 3469 2152 1889 1695";

inputs:-6h$(" " vs inputs);
allRoman,:toRoman each inputs;
show sum toInt each raze allRoman;


/+ kdb solution
/build a dictionary of "base" states which can be indexed into "IVXLCDM"
/after stringing the input number, each successive digit gets a numerical offset along the above numeral list

sum 1+.Q.A?{"IVXLCDM"raze(neg[count s]#6 4 2 0)+x s:string y}[.Q.n!(0#0;0;0 0;0 0 0;0 1;1;1 0;1 0 0;1 0 0 0;0 2)] each [input]