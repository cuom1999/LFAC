# Kỳ thi ★

**Tác giả đề:** Jakub Łącki  
**Tác giả lời giải:** Tomasz Idziaszek  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `egz`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2013/egz>


## Đề bài

Giáo sư Bajtoni đang chuẩn bị một kỳ thi về Lý thuyết bit và byte. Ông đã chuẩn bị \(n\) câu hỏi. Mỗi câu được giáo sư gán một hệ số độ khó dự kiến, là một số tự nhiên trong khoảng từ \(1\) đến \(n\). Mọi câu hỏi đều có hệ số độ khó khác nhau.

Giờ đây giáo sư đang cân nhắc thứ tự các câu hỏi trong đề thi. Ông muốn kiểm tra xem sinh viên của mình có thể tự đánh giá độ khó của câu hỏi hay không. Vì vậy, ông định sắp các câu hỏi sao cho hệ số độ khó của mọi hai câu liên tiếp chênh nhau ít nhất \(k\). Hãy giúp giáo sư tìm một thứ tự như thế.

### Dữ liệu vào

Dòng duy nhất của dữ liệu vào chứa hai số nguyên \(n,k\) 

\[
2\le n\le1\,000\,000,\qquad 1\le k\le n,
\]

lần lượt là số câu hỏi giáo sư đã chuẩn bị và cận dưới cho chênh lệch độ khó của hai câu liên tiếp trong đề thi.

### Dữ liệu ra

In một dòng chứa thứ tự các hệ số độ khó cần tìm: một dãy gồm \(n\) số tự nhiên đôi một khác nhau trong khoảng từ \(1\) đến \(n\), sao cho mọi hai số liên tiếp chênh nhau ít nhất \(k\).

Nếu có nhiều đáp án đúng, in bất kỳ một đáp án nào. Nếu không tồn tại thứ tự cần tìm, chỉ in từ `NIE` (nghĩa là “không” trong tiếng Ba Lan).

### Ví dụ

**Dữ liệu vào**

```text
5 2
```

**Một dữ liệu ra đúng có thể là**

```text
2 4 1 5 3
```

Trong khi đó, với dữ liệu vào

```text
5 4
```

thì dữ liệu ra đúng là

```text
NIE
```

## Lời giải

Trong bài dễ nhất của kỳ thi năm 2013, ta cần tìm một hoán vị của các số từ \(1\) đến \(n\), sao cho hiệu của mọi hai số kề nhau có giá trị tuyệt đối ít nhất \(k\); hoặc kết luận rằng hoán vị đó không tồn tại.

Trước hết, với một giá trị \(n\) cố định, không cần chuẩn bị các hoán vị riêng cho mọi giá trị có thể của \(k\). Một hoán vị thỏa yêu cầu với tham số \(k\) cũng thỏa yêu cầu với mọi tham số nhỏ hơn. Do đó, chỉ cần tìm giá trị lớn nhất \(k_n\) mà tại đó một hoán vị tồn tại, rồi in cùng hoán vị ấy cho mọi \(k\le k_n\). Với \(k>k_n\), in `NIE`.

Hãy thử vài hoán vị cho các giá trị \(n\) nhỏ. Ta sẽ nhận ra một cách tạo hoán vị có hiệu giữa các phần tử kề nhau lớn: chia các số từ \(1\) đến \(n\) thành hai dãy gần bằng nhau, một dãy gồm các số nhỏ và dãy kia gồm các số lớn, rồi xen kẽ hai dãy. Như vậy, mỗi cặp số kề nhau luôn gồm một số nhỏ và một số lớn.

Cụ thể, chia các số thành hai dãy

\[
1,2,\ldots,\left\lfloor\frac{n+1}{2}\right\rfloor
\]

và

\[
\left\lfloor\frac{n+1}{2}\right\rfloor+1,\ldots,n,
\]

rồi xen kẽ chúng sao cho số 

\[
\left\lfloor\frac{n+1}{2}\right\rfloor
\]

đứng cuối hoán vị.

Ví dụ, khi \(n=6\), ta xen kẽ các dãy \(1,2,3\) và \(4,5,6\), thu được

\[
4\quad 1\quad 5\quad 2\quad 6\quad 3.
\]

Khi \(n=7\), ta thu được

\[
1\quad 5\quad 2\quad 6\quad 3\quad 7\quad 4.
\]

Tổng quát hơn, nếu \(n\) chẵn thì bắt đầu dãy kết quả bằng số nhỏ nhất trong các số lớn; nếu \(n\) lẻ thì bắt đầu bằng \(1\). Dễ thấy hiệu tuyệt đối của mọi hai phần tử kề nhau trong hoán vị này bằng

\[
\left\lfloor\frac n2\right\rfloor
\]

hoặc

\[
\left\lfloor\frac n2\right\rfloor+1.
\]

Không thể làm tốt hơn; vì thế ta có thể chọn

\[
k_n=\left\lfloor\frac n2\right\rfloor.
\]

Để chứng minh điều này, xét số

\[
\left\lfloor\frac{n+1}{2}\right\rfloor.
\]

Ở một vị trí nào đó trong hoán vị, ta bắt buộc phải in số này. Ngay cạnh nó có một số khác trong khoảng từ \(1\) đến \(n\). Hiệu giữa hai số ấy không thể vượt quá 

\[
\left\lfloor\frac n2\right\rfloor.
\]

Quả thật, trong trường hợp thuận lợi nhất, số đứng cạnh là \(n\), và hiệu đúng bằng 

\[
\left\lfloor\frac n2\right\rfloor.
\]

Vậy không có hoán vị nào thỏa điều kiện với \(k>\lfloor n/2\rfloor\).

### Thuật toán

Đặt \(m=\lfloor n/2\rfloor\).

- Nếu \(k>m\), in `NIE`.
- Nếu \(k\le m\) và \(n\) chẵn, in

\[
m+1,\ 1,\ m+2,\ 2,\ \ldots,\ 2m,\ m.
\]

- Nếu \(k\le m\) và \(n\) lẻ, in

\[
1,\ m+2,\ 2,\ m+3,\ \ldots,\ m,\ 2m+1,\ m+1.
\]

Hoán vị được xây dựng có chênh lệch giữa các số kề nhau ít nhất \(m\ge k\), nên luôn hợp lệ.

### Độ phức tạp

Thời gian chạy bị chi phối bởi việc in \(n\) số, do đó là

\[
O(n).
\]

Ngoài bộ nhớ cần cho đầu ra, thuật toán chỉ dùng \(O(1)\) bộ nhớ phụ.
