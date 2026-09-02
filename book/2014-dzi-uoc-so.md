# Ước số ★

**Tác giả đề:** Jakub Łącki  
**Tác giả lời giải:** Jakub Łącki  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `dzi`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2014/dzi>


## Đề bài

Cho một dãy gồm \(n\) số nguyên

\[
a_1,a_2,\ldots,a_n.
\]

Hãy xác định số cặp có thứ tự \((i,j)\) sao cho

\[
i,j\in\{1,\ldots,n\},\qquad i\ne j,
\]

và \(a_i\) là ước của \(a_j\).

### Dữ liệu vào

Dòng đầu chứa một số nguyên \(n\)

\[
1\le n\le2\,000\,000.
\]

Dòng thứ hai chứa dãy \(n\) số nguyên

\[
a_1,a_2,\ldots,a_n,
\qquad 1\le a_i\le2\,000\,000.
\]

### Dữ liệu ra

In một số nguyên duy nhất: số cặp cần tìm.

### Ví dụ

**Dữ liệu vào**

```text
5
2 4 5 2 6
```

**Dữ liệu ra**

```text
6
```

Có sáu cặp thỏa mãn:

\[
(1,2),\ (1,4),\ (1,5),\ (4,1),\ (4,2),\ (4,5).
\]

## Lời giải

Trước hết, hãy xét bài toán cho dãy

\[
1,2,\ldots,M.
\]

Ta muốn đếm số cặp số \((i,j)\) sao cho

\[
1\le i,j\le M,
\]

\(i\) là ước của \(j\), và \(i\ne j\). Khi đó nhất thiết \(i<j\). Chẳng hạn, với \(M=9\), có 14 cặp như vậy:

\[
\begin{aligned}
&(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),\\
&(2,4),(2,6),(2,8),(3,6),(3,9),(4,8).
\end{aligned}
\]

Để duyệt tất cả các cặp này, với mỗi số \(i\) từ \(1\) đến \(M\), ta duyệt những bội của \(i\) lớn hơn \(i\) nhưng không vượt quá \(M\). Với một giá trị cố định \(1\le i\le M\), có đúng

\[
\left\lfloor\frac Mi\right\rfloor-1
\]

bội như vậy. Ta trừ \(1\) vì chỉ quan tâm đến các bội lớn hơn \(i\), nên phải loại chính \(i\).

Tổng số cặp được duyệt có thể chặn trên như sau:

\[
\sum_{i=1}^{M}
\left(\left\lfloor\frac Mi\right\rfloor-1\right)
\le
\sum_{i=1}^{M}\frac Mi
=M\sum_{i=1}^{M}\frac1i
=O(M\log M).
\]

Ở bước cuối, ta dùng một tính chất quan trọng: tổng \(\sum_{i=1}^{M}\frac1i\) rất gần \(\log M\), trong đó \(\log\) là lôgarit tự nhiên. “Rất gần” ở đây có nghĩa là với mọi \(M\), độ chênh lệch giữa tổng này và \(\log M\) không vượt quá \(1\).

Ý chính của lập luận trên là như sau. Gọi \(S\) là tập các cặp \((i,j)\) thỏa

\[
1\le i<j\le M
\]

và \(i\) là ước của \(j\). Ta đã chứng minh rằng \(S\) tương đối nhỏ:

\[
|S|=O(M\log M).
\]

Hơn nữa, có thể duyệt hiệu quả mọi phần tử của \(S\): với mỗi \(i\), chỉ cần sinh lần lượt các bội của \(i\) không vượt quá \(M\).

Từ đây chỉ còn một bước ngắn để giải bài toán cho dãy tổng quát \(a_1,\ldots,a_n\). Mỗi cặp phần tử của dãy được tính vào đáp án đều ứng với một cặp giá trị trong \(S\), ngoại trừ trường hợp hai giá trị bằng nhau mà ta sẽ xử lý riêng. Vì vậy, ta có thể đảo ngược cách nhìn: duyệt mọi cặp \((i,j)\in S\), rồi với mỗi cặp, tính xem có bao nhiêu cặp phần tử của dãy \(a_1,\ldots,a_n\) mang hai giá trị \((i,j)\).

Ví dụ, giả sử đang xét \((3,12)\in S\). Nếu số \(3\) xuất hiện \(5\) lần trong dãy còn số \(12\) xuất hiện \(7\) lần, thì có đúng

\[
5\cdot7=35
\]

cặp chỉ số tương ứng. Vì vậy, ta cộng \(35\) vào đáp án. Để thực hiện việc này hiệu quả, trước hết cần đếm số lần xuất hiện của từng giá trị từ \(1\) đến \(M\) trong dãy.

### Thuật toán

Từ đây, đặt

\[
M=\max(a_1,a_2,\ldots,a_n).
\]

Ta xây dựng mảng \(\operatorname{frequency}\), trong đó \(\operatorname{frequency}[i]\) là số phần tử của dãy có giá trị bằng \(i\).

Tiếp theo, duyệt lần lượt các ô của mảng \(\operatorname{frequency}\). Mỗi khi gặp \(\operatorname{frequency}[i]\ne0\), ta duyệt các bội \(k\) của \(i\) sao cho

\[
i<k\le M.
\]

Với mỗi \(k\) như vậy, \(i\) là ước của \(k\), nên cộng

\[
\operatorname{frequency}[i]\cdot\operatorname{frequency}[k]
\]

vào đáp án.

Cuối cùng, cần tính cả những cặp phần tử có giá trị bằng nhau. Vì mọi số dương đều là ước của chính nó, \(\operatorname{frequency}[i]\) phần tử có giá trị \(i\) tạo ra

\[
\operatorname{frequency}[i]\bigl(\operatorname{frequency}[i]-1\bigr)
\]

cặp **có thứ tự** gồm hai chỉ số khác nhau. Ta cộng đại lượng này vào đáp án với mọi \(i\).

> **Ghi chú hiệu đính:** Bản tiếng Ba Lan in công thức \(\operatorname{frequency}[i](\operatorname{frequency}[i]-1)/2\), vốn chỉ đếm cặp không thứ tự. Đề bài yêu cầu cặp có thứ tự; công thức đúng phải là \(\operatorname{frequency}[i](\operatorname{frequency}[i]-1)\). Ví dụ của đề cũng xác nhận cách đếm này: hai phần tử bằng \(2\) tạo cả hai cặp \((1,4)\) và \((4,1)\).

Có thể mô tả phần đếm chính bằng mã giả:

Trong mã giả, `maxValue` là \(M\), còn `frequency[value]` là số lần giá trị `value` xuất hiện trong dãy.

```pseudocode
answer = 0

for divisor = 1 .. maxValue:
    answer += frequency[divisor] * (frequency[divisor] - 1)
    for multiple = 2*divisor, 3*divisor, ... while multiple <= maxValue:
        answer += frequency[divisor] * frequency[multiple]

return answer
```

Vì đáp án có thể đạt cỡ \(n(n-1)\), cần dùng kiểu số nguyên 64 bit.

### Chứng minh tính đúng đắn

Ta chia mọi cặp chỉ số hợp lệ \((p,q)\) thành hai loại.

- Nếu \(a_p=a_q=i\), cặp đó được tính trong hạng

\[
\operatorname{frequency}[i]\bigl(\operatorname{frequency}[i]-1\bigr).
\]

Hạng này đếm đúng mọi cách chọn có thứ tự hai vị trí khác nhau mang giá trị \(i\).

- Nếu \(a_p\ne a_q\), đặt \(i=a_p\) và \(k=a_q\). Vì \(i\mid k\) và hai số dương khác nhau, ta có \(i<k\); do đó \(k\) xuất hiện đúng một lần trong vòng duyệt các bội \(2i,3i,\ldots\). Thuật toán cộng \(\operatorname{frequency}[i]\operatorname{frequency}[k]\), chính là số cặp chỉ số có thứ tự mang hai giá trị \((i,k)\).

Hai loại không giao nhau, và mỗi cặp hợp lệ được tính đúng một lần. Ngược lại, mọi cặp mà thuật toán tính đều gồm hai giá trị bằng nhau hoặc gồm \(i\) và một bội \(k\) của \(i\), nên đều thỏa điều kiện đề bài. Vì vậy, thuật toán trả về đúng đáp án.

### Độ phức tạp

Việc đọc dãy và đếm tần suất tốn \(O(n+M)\) thời gian, tính cả khởi tạo mảng. Phần duyệt các bội tốn

\[
O(M\log M)
\]

thời gian theo phân tích ở trên. Do đó, tổng thời gian là

\[
O(n+M\log M),
\]

và bộ nhớ phụ là

\[
O(M).
\]

## Lời kết

Chìa khóa của bài *Ước số* là tính chất

\[
\sum_{i=1}^{n}\frac1i=O(\log n).
\]

Đây là một tính chất đáng nhớ vì nó hữu ích trong nhiều tình huống, ngay cả khi bài toán không trực tiếp nói về ước số hay lý thuyết số. Một ví dụ là **bài toán người sưu tập phiếu thưởng**.

Người sưu tập tìm các nhãn dán hình siêu anh hùng trong những hộp ngũ cốc; trong phiên bản cổ điển, đó là các phiếu thưởng. Mỗi hộp chứa đúng một nhãn dán, được chọn ngẫu nhiên đều trong \(n\) loại có thể có. Trung bình người ấy phải mở bao nhiêu hộp để thu thập đủ cả \(n\) loại?

Người sưu tập nhận nhãn đầu tiên ngay khi mở hộp đầu tiên. Trái lại, khi đã có \(n-1\) loại, trung bình phải mở thêm \(n\) hộp mới gặp loại cuối cùng còn thiếu.

Tổng quát, nếu đã có \(i-1\) loại khác nhau, xác suất để hộp kế tiếp chứa một loại mới là

\[
\frac{n-i+1}{n}.
\]

Vì vậy, số hộp trung bình cần mở để nhận thêm một loại mới là

\[
\frac{n}{n-i+1}.
\]

Cộng các kỳ vọng này với mọi \(i\), ta được

\[
\sum_{i=1}^{n}\frac{n}{n-i+1}
=n\sum_{i=1}^{n}\frac1{n-i+1}
=n\sum_{i=1}^{n}\frac1i
=O(n\log n).
\]

Do đó, trung bình người sưu tập phải mua \(O(n\log n)\) hộp ngũ cốc trước khi có đủ cả \(n\) loại nhãn dán.
