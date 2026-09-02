# Luật sư ★

**Tác giả đề:** Jakub Łącki  
**Tác giả lời giải:** Jakub Łącki  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `adw`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2014/adw>


## Đề bài

Luật sư Byteasar, đồng sở hữu văn phòng luật Byteasar và Cộng sự, là một trong những thành viên được săn đón nhất của đoàn luật sư Byteotia. Vì thế, chẳng có gì lạ khi ông luôn vô cùng bận rộn. Mỗi ngày ông có rất nhiều cuộc họp và từ lâu đã không còn kiểm soát được liệu mình có thể tham dự tất cả hay không. Do đó, ông thuê một thư ký để giúp mình sắp xếp mớ hỗn độn này.

Byteasar quyết định rằng mỗi ngày ông sẽ chỉ tham dự hai cuộc họp, nhưng phải tham dự trọn vẹn từ đầu đến cuối. Những cuộc họp còn lại sẽ do các trợ lý đảm nhiệm; văn phòng của ông không hề thiếu trợ lý.

Đáng tiếc là đôi khi, ngay cả việc tìm hai cuộc họp không trùng thời gian trong lịch trình dày đặc của Byteasar cũng rất khó. Ta quy ước hai cuộc họp không trùng thời gian nếu một cuộc bắt đầu **sau khi** cuộc kia đã kết thúc. Hãy giúp thư ký của Byteasar giải quyết vấn đề này.

### Dữ liệu vào

Dòng đầu chứa hai số nguyên \(n,m\)

\[
2\le n\le500\,000,\qquad 1\le m\le20,
\]

lần lượt là số cuộc họp trong lịch trình của Byteasar và số ngày mà lịch trình bao gồm.

Mỗi dòng trong \(n\) dòng tiếp theo mô tả một cuộc họp bằng ba số nguyên \(a_i,b_i,d_i\)

\[
1\le a_i<b_i\le80\,000\,000,\qquad 1\le d_i\le m.
\]

Các số này cho biết vào ngày \(d_i\), Byteasar có một cuộc họp bắt đầu đúng \(a_i\) mili giây sau nửa đêm và kết thúc \(b_i\) mili giây sau nửa đêm.

### Dữ liệu ra

In \(m\) dòng. Dòng thứ \(i\) cho biết Byteasar có thể tham dự hai cuộc họp trong ngày thứ \(i\) hay không.

Nếu không thể, in một từ `NIE` (nghĩa là “không” trong tiếng Ba Lan). Nếu có thể, in từ `TAK` (nghĩa là “có” trong tiếng Ba Lan), theo sau là chỉ số của hai cuộc họp mà Byteasar có thể tham dự. Các cuộc họp được đánh số từ \(1\) đến \(n\) theo thứ tự xuất hiện trong dữ liệu vào.

Cuộc họp được in trước phải bắt đầu sớm hơn. Cuộc họp thứ hai phải bắt đầu ít nhất một mili giây sau khi cuộc họp thứ nhất kết thúc.

Nếu có nhiều đáp án đúng, được phép in bất kỳ đáp án nào.

### Ví dụ

**Dữ liệu vào**

```text
6 3
3 5 1
2 4 2
1 8 1
6 7 3
3 5 2
7 12 1
```

**Dữ liệu ra**

```text
TAK 1 6
NIE
NIE
```

## Lời giải

Xét riêng từng ngày trong \(m\) ngày. Với một ngày cố định, bài toán có thể phát biểu ngắn gọn như sau: cho một tập các đoạn, cần tìm hai đoạn sao cho đầu mút phải của đoạn thứ nhất nhỏ hơn hẳn đầu mút trái của đoạn thứ hai. Nếu tồn tại hai đoạn như vậy, ta in `TAK` cùng chỉ số của chúng; nếu không, ta in `NIE`.

Một cách trực tiếp là duyệt mọi cặp đoạn. Với mỗi cặp \([a_i,b_i]\) và \([a_j,b_j]\), ta kiểm tra xem \(b_i<a_j\) hay không. Ngay khi tìm thấy một cặp thỏa mãn, ta dừng và in đáp án.

Vấn đề là số cặp có thể rất lớn. Trong trường hợp xấu nhất, có \(500\,000\) đoạn và mọi cặp đoạn đều giao nhau, chẳng hạn khi tất cả các đoạn giống hệt nhau. Khi ấy ta phải xét khoảng

\[
500\,000^2=2{,}5\cdot10^{11}
\]

cặp. Ngay cả với giả định khá lạc quan rằng có thể kiểm tra nửa tỉ cặp mỗi giây, chương trình vẫn chạy hơn tám phút.

Ta có thể chọn hai ứng viên cực trị thay vì duyệt mọi cặp. Gọi \(p\) là đoạn có **đầu mút phải nhỏ nhất**, và gọi \(q\) là đoạn có **đầu mút trái lớn nhất**. Nói cách khác,

\[
b_p=\min_i b_i,
\qquad
a_q=\max_i a_i.
\]

Nếu

\[
b_p<a_q,
\]

thì \(p,q\) chính là một đáp án: cuộc họp \(p\) kết thúc trước khi cuộc họp \(q\) bắt đầu. Hơn nữa, vì \(a_p<b_p<a_q\), cuộc họp \(p\) cũng bắt đầu sớm hơn cuộc họp \(q\), đúng với thứ tự đầu ra yêu cầu.

Ngược lại, giả sử \(b_p\ge a_q\). Do \(a_q\) là đầu mút trái lớn nhất, mọi đoạn đều có đầu mút trái không vượt quá \(a_q\). Do \(b_p\) là đầu mút phải nhỏ nhất, mọi đoạn đều có đầu mút phải không nhỏ hơn \(b_p\). Vì vậy, mọi đoạn đều chứa toàn bộ đoạn

\[
[a_q,b_p].
\]

Đặc biệt, mọi hai đoạn đều giao nhau, nên không thể tồn tại hai cuộc họp cần tìm.

Như vậy, điều kiện \(b_p<a_q\) vừa đủ vừa cần. Để tìm \(p\) và \(q\), chỉ cần duyệt danh sách các cuộc họp của ngày đó đúng một lần.

### Thuật toán

Với mỗi ngày, duy trì:

- cuộc họp \(p\) có thời điểm kết thúc nhỏ nhất;
- cuộc họp \(q\) có thời điểm bắt đầu lớn nhất.

Khi đọc mỗi cuộc họp, cập nhật hai ứng viên của ngày tương ứng. Sau khi đọc xong:

- nếu ngày nào có \(b_p<a_q\), in `TAK`, rồi in chỉ số của \(p\) và \(q\);
- nếu không, in `NIE`.

Không cần xử lý riêng trường hợp \(p=q\): nếu đó là cùng một cuộc họp thì \(a_p<b_p\), nên bất đẳng thức \(b_p<a_q=a_p\) không thể đúng.

### Độ phức tạp

Mỗi cuộc họp được xử lý đúng một lần. Vì vậy, tổng thời gian là

\[
O(n+m),
\]

trong đó \(O(m)\) là thời gian xuất kết quả cho \(m\) ngày. Nếu chỉ lưu hai ứng viên cho mỗi ngày, thuật toán dùng \(O(m)\) bộ nhớ phụ.
