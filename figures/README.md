# Hình minh họa

Hình được đặt tên `YYYY-ma-bai-fig-N.png`. Chú thích tiếng Việt trong chương chỉ mô tả nội dung hình; PDF nguồn, trang vật lý và tọa độ crop được lưu tại đây để có thể tái tạo và kiểm tra.

PDF dùng hình vẽ vector nằm trong nội dung trang, nên `pdfimages` không thể tách chúng. Dùng:

```sh
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf PAGE X Y W H figures/OUTPUT.png
```

Tọa độ là pixel trên trang dựng ở 300 DPI, tính từ góc trên trái.

## Các hình năm 2011

### Problem 2011 `ary`

```sh
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 18 500 1810 850 230 figures/2011-ary-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 19 520 220 820 170 figures/2011-ary-fig-2.png
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 19 680 1560 470 450 figures/2011-ary-fig-3.png
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 20 680 405 470 430 figures/2011-ary-fig-4.png
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 21 680 400 470 470 figures/2011-ary-fig-5.png
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 22 680 220 470 450 figures/2011-ary-fig-6.png
```

### Problem 2011 `drz`

```sh
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 33 700 570 480 710 figures/2011-drz-fig-1.png
```

### Problem 2011 `gen`

```sh
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 45 500 1040 850 270 figures/2011-gen-fig-1.png
```

### Problem 2011 `ilo`

```sh
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 55 210 470 1420 230 figures/2011-ilo-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 56 210 1020 1420 600 figures/2011-ilo-fig-2.png
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 57 560 760 720 600 figures/2011-ilo-fig-3.png
```

## Problem 2011 `baj`

```sh
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 25 280 590 1280 700 figures/2011-baj-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 26 260 70 1330 890 figures/2011-baj-fig-2.png
scripts/crop-figure.sh looking-for-a-challenge-2-en.pdf 27 430 1700 1050 610 figures/2011-baj-fig-3.png
```

## Các hình năm 2014

Các lệnh dưới đây trích hình từ bản tiếng Ba Lan; chú thích tiếng Việt nằm trong từng chương.

```sh
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 186 475 830 725 270 figures/2014-fil-fig-example.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 187 475 235 710 230 figures/2014-fil-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 187 490 610 680 250 figures/2014-fil-fig-2.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 187 245 1780 1340 500 figures/2014-fil-fig-3.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 190 210 135 1395 450 figures/2014-glo-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 204 475 135 770 760 figures/2014-jas-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 206 705 560 450 640 figures/2014-kap-fig-example.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 207 735 190 365 395 figures/2014-kap-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 207 665 1050 510 460 figures/2014-kap-fig-2.png
```

## Các hình năm 2012

Các crop chỉ lấy phần sơ đồ, không lấy chú thích tiếng Ba Lan. Chú thích tiếng Việt nằm trong từng chương.

```sh
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 74 790 960 820 680 figures/2012-biu-fig-example.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 79 450 560 950 210 figures/2012-cia-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 79 300 1450 1250 250 figures/2012-cia-fig-2.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 85 650 1580 560 500 figures/2012-ewa-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 98 240 160 1380 760 figures/2012-gen-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 103 710 950 500 140 figures/2012-inw-fig-example.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 107 470 2000 940 280 figures/2012-jut-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 111 670 1700 560 600 figures/2012-kro-fig-1.png
```

## Các hình năm 2013

Các lệnh dưới đây trích riêng phần nét vẽ từ bản tiếng Ba Lan; chú thích tiếng Việt nằm trong từng chương.

```sh
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 119 560 230 740 420 figures/2013-aut-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 120 540 220 800 680 figures/2013-aut-fig-2.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 124 750 1770 370 400 figures/2013-baj-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 128 270 235 1300 500 figures/2013-cie-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 132 280 1600 1300 330 figures/2013-dem-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 138 690 1090 470 475 figures/2013-fot-fig-1.png
scripts/crop-figure.sh looking-for-a-challenge-2-pl.pdf 140 640 220 520 520 figures/2013-fot-fig-2.png
```
