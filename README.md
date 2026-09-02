# Đi tìm thử thách 2 — bản dịch tiếng Việt

Bản dịch tiếng Việt dùng cho mục đích giáo dục.

Nguồn đối chiếu:

- *Looking for a Challenge 2* (bản tiếng Anh, 2019): toàn bộ 44 đề bài và lời giải năm 2011.
- *W poszukiwaniu wyzwań 2* (bản tiếng Ba Lan, 2019, phiên bản 2.1): toàn bộ đề bài và lời giải gốc.

Ưu tiên dịch từ tiếng Anh. Những lời giải không có trong bản tiếng Anh được dịch từ tiếng Ba Lan. Hình minh họa được trích từ PDF gốc và ghi rõ nguồn theo trang.

## Quy ước biên tập

- Tên thuật toán/cấu trúc dữ liệu dùng thuật ngữ tiếng Việt, kèm thuật ngữ tiếng Anh ở lần xuất hiện đầu tiên nếu hữu ích.
- Mã nguồn, ký hiệu toán học, tên biến, dữ liệu vào/ra và giới hạn được giữ nguyên về ngữ nghĩa.
- `TODO[PL]` đánh dấu đoạn cần dịch từ bản tiếng Ba Lan; `TODO[CHECK]` đánh dấu chỗ cần soát lại.
- Mỗi chương ghi rõ trang nguồn để người soát có thể đối chiếu.

## Cấu trúc

- `sources/`: văn bản trích xuất theo bố cục từ hai PDF.
- `book/`: nguồn bản dịch tiếng Việt.
- `figures/`: hình trích từ PDF, đặt tên theo chương/hình.
- `scripts/`: công cụ trích xuất và dựng bản thảo.

Tiến độ chi tiết được duy trì tại [`CHECKLIST.md`](CHECKLIST.md); ánh xạ có cấu trúc cho công cụ tự động nằm trong `book/problems.csv`.

Không phát hành công khai.

## Dựng PDF xem trước

```sh
scripts/build-preview.sh
```

Lệnh tạo `LFAC2-vi-preview-4-problems.pdf` từ bốn chương đầu tiên.

Để dựng bản thảo đủ 44 bài:

```sh
scripts/build-book.sh
```
