# Janošík ★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Tomasz Idziaszek  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `jan`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2013/jan>


## Đề bài

Như mọi người đều biết, Janošík lấy của người giàu để chia cho người nghèo. Chàng cùng toán cướp của mình vừa đánh cướp một đoàn xe chở vàng tới lâu đài của bá tước và thu được $n$ chiếc tráp. Sau khi chuyển chiến lợi phẩm về hang, họ phát hiện chiếc tráp thứ $i$, với $i=1,2,\ldots,n$, chứa đúng $i$ túi vàng.

Khi một người nghèo đến xin Janošík vài đồng vàng ducat, chàng thực hiện thủ tục sau. Trước tiên, chàng chọn một chiếc tráp không rỗng chứa ít túi vàng nhất.

- Nếu tráp chứa đúng một túi vàng, Janošík trao túi ấy cho người nghèo, và người đó vui vẻ ra về.
- Nếu tráp chứa nhiều hơn một túi và số túi là lẻ, Janošík bỏ một túi vào túi áo của mình rồi bắt đầu lại toàn bộ thủ tục.
- Nếu số túi trong tráp là chẵn, Janošík lấy đúng một nửa số túi ra, chuyển chúng sang một chiếc tráp rỗng — may thay, trong hang có thừa tráp rỗng — rồi bắt đầu lại toàn bộ thủ tục.

Vì thế, nếu một người nghèo đến khi Janošík vẫn còn ít nhất một tráp không rỗng, sau khi chàng áp dụng thủ tục có thể nhiều lần, người đó chắc chắn sẽ nhận được một túi vàng. Người nghèo tiếp tục đến hang của Janošík cho tới khi tất cả các tráp đều rỗng.

Những tên cướp trong toán của Janošík lo rằng cách hành xử ấy sẽ làm tổn hại thanh danh của giới cướp. Chúng muốn biết sau khi mọi chiếc tráp được vét sạch, có bao nhiêu túi vàng chiến lợi phẩm nằm lại trong túi áo của thủ lĩnh.

### Dữ liệu vào

Dòng duy nhất chứa một số nguyên $n$:

\[
1\le n\le 10^9,
\]

là số tráp mà toán cướp của Janošík đã lấy được.

### Dữ liệu ra

In một số nguyên duy nhất: số túi vàng còn lại trong túi áo của Janošík sau khi tất cả các tráp đã rỗng.

### Ví dụ

**Dữ liệu vào**

```text
5
```

**Dữ liệu ra**

```text
2
```

## Lời giải

### Mô phỏng trực tiếp

Đề bài mô tả một thuật toán và yêu cầu tính kết quả của thuật toán ấy trên dữ liệu đã cho. Cách cài đặt trực tiếp không khó: ta chỉ việc mô phỏng lần lượt các hành động của Janošík.

Ta lưu cách phân bố hiện tại của các túi vàng bằng một danh sách: với mỗi tráp đang chứa $i$ túi, danh sách có một phần tử mang giá trị $i$. Ban đầu, danh sách gồm

\[
1,2,\ldots,n.
\]

Ngoài ra, biến `pocket_bags` lưu số túi vàng hiện nằm trong túi áo của Janošík.

Mỗi bước của thuật toán diễn ra như sau. Trước tiên, tìm phần tử nhỏ nhất trong danh sách và gọi giá trị của nó là $j$, rồi xóa phần tử ấy.

- Nếu $j=1$, không cần làm gì thêm trong bước này: túi vàng được trao cho một người nghèo.
- Nếu $j>1$ và $j$ lẻ, tăng `pocket_bags` lên một và chèn $j-1$ vào danh sách.
- Nếu $j$ chẵn, chèn hai phần tử có giá trị $j/2$ vào danh sách.

Lặp lại cho tới khi danh sách rỗng.

Ta có thể thực hiện mỗi bước bằng một số hằng thao tác nếu luôn giữ danh sách theo thứ tự không giảm. Khi ấy, phần tử nhỏ nhất $j$ nằm ngay đầu danh sách. Các phần tử mới, dù là $j-1$ hay $j/2$, đều nhỏ hơn $j$, do đó cũng nhỏ hơn mọi phần tử còn lại; ta có thể chèn chúng vào đầu mà không phá vỡ thứ tự.

Cách mô phỏng này luôn đúng nhưng quá chậm khi $n$ lớn. Trong mỗi bước, ta thực hiện một trong hai loại thao tác:

- **(A)** giảm tổng số túi trong các tráp đi một;
- **(B)** chia số túi của một tráp thành hai phần bằng nhau.

Muốn làm rỗng tất cả các tráp, mỗi túi vàng ban đầu cuối cùng đều phải trải qua đúng một thao tác (A), bất kể nó được trao cho người nghèo hay bỏ vào túi áo Janošík. Tổng số túi ban đầu là

\[
1+2+\cdots+n=\frac{n(n+1)}2.
\]

Do đó, riêng thao tác (A) đã được thực hiện đúng $n(n+1)/2$ lần. Với $n=1\,000\,000\,000$, con số này xấp xỉ $5\cdot10^{17}$; ngay cả nếu mỗi thao tác chỉ tốn vài nano giây, chương trình vẫn chạy hàng chục năm. Ta thậm chí chưa cần đếm thao tác (B), dù có thể chứng minh số lần thực hiện nó không vượt quá $n(n+1)/2$. Vì vậy độ phức tạp thời gian của mô phỏng là

\[
\Theta(n^2).
\]

Ta cần tính kết quả của thủ tục nhanh hơn.

### Không làm cùng một việc hai lần

Mỗi khi Janošík chọn một tráp chứa $i$ túi, chàng sẽ phân phối hết toàn bộ vàng bắt nguồn từ tráp ấy trước khi chọn bất kỳ tráp nào khác đang chứa ít nhất $i$ túi. Trong cả quá trình, Janošík có thể nhiều lần gặp các tráp chứa $i$ túi, nhưng lần nào chàng cũng xử lý chúng theo đúng cùng một cách. Bởi vậy, số túi cuối cùng đi vào túi áo Janošík từ một tráp chứa $i$ túi luôn như nhau.

Gọi $d(i)$ là số túi bắt nguồn từ một tráp ban đầu có $i$ túi và cuối cùng nằm trong túi áo Janošík. Ta có hệ thức truy hồi

\[
d(i)=
\begin{cases}
0, & i=1,\\
1+d(i-1), & i>1\text{ và }i\text{ lẻ},\\
2d(i/2), & i\text{ chẵn}.
\end{cases}
\tag{1}
\]

Nếu tính lần lượt $d(1),d(2),\ldots,d(n)$ và lưu chúng trong một mảng, mỗi giá trị $d(i)$ được tính trong thời gian hằng số vì nó chỉ phụ thuộc vào $d(i-1)$ hoặc $d(i/2)$, vốn đã được tính trước.

Do $d(i)\le i$ — Janošík không thể lấy nhiều túi hơn số có trong tráp — mỗi phần tử của mảng có thể là một số nguyên 32 bit. Tuy nhiên, tổng đáp án

\[
d(1)+d(2)+\cdots+d(n)
\]

phải được tính bằng số nguyên 64 bit.

Phương pháp này chạy trong thời gian $\Theta(n)$, nhưng cũng cần bộ nhớ $\Theta(n)$. Với $n=10^9$, chương trình mất vài giây và mảng 32 bit chiếm khoảng $3{,}7$ GB, gần gấp 30 lần giới hạn bộ nhớ của bài. Ta vẫn cần một lời giải khéo hơn.

### Giải hệ thức truy hồi

Hệ thức (1) khá đơn giản. Ta có thể tính $d(i)$ cho một vài giá trị nhỏ rồi thử nhận ra quy luật:

| $i$ | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18 | 19 | 20 |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| $d(i)$ | 0 | 0 | 1 | 0 | 1 | 2 | 3 | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 0 | 1 | 2 | 3 | 4 |
| $i-d(i)$ | 1 | 2 | 2 | 4 | 4 | 4 | 4 | 8 | 8 | 8 | 8 | 8 | 8 | 8 | 8 | 16 | 16 | 16 | 16 | 16 |

Bảng này gợi ý công thức

\[
d(i)=i-2^{\lfloor\log_2 i\rfloor},
\tag{2}
\]

trong đó $2^{\lfloor\log_2 i\rfloor}$ là lũy thừa của hai lớn nhất không vượt quá $i$. Nói theo biểu diễn nhị phân, tính $d(i)$ chính là xóa bit $1$ có trọng số lớn nhất của $i$.

Ta chứng minh (2) thỏa hệ thức (1) bằng quy nạp mạnh theo $i$.

Với $i=1$, ta có $\log_2 1=0$, nên

\[
1-2^0=0=d(1).
\]

Giả sử $i\ge2$ và công thức đúng với mọi $j<i$.

Nếu $i$ chẵn, theo giả thuyết quy nạp,

\[
\begin{aligned}
d(i)
  &=2d(i/2)\\
  &=2\left(\frac i2-2^{\lfloor\log_2(i/2)\rfloor}\right)\\
  &=2\left(\frac i2-2^{\lfloor\log_2 i\rfloor-1}\right)\\
  &=i-2^{\lfloor\log_2 i\rfloor}.
\end{aligned}
\]

Nếu $i$ lẻ, cũng theo giả thuyết quy nạp,

\[
\begin{aligned}
d(i)
  &=1+d(i-1)\\
  &=1+\left(i-1-2^{\lfloor\log_2(i-1)\rfloor}\right)\\
  &=i-2^{\lfloor\log_2 i\rfloor}.
\end{aligned}
\]

Đẳng thức cuối đúng vì với $i>1$ lẻ, lũy thừa của hai lớn nhất không vượt quá $i$ cũng không vượt quá $i-1$; do đó

\[
\lfloor\log_2(i-1)\rfloor=\lfloor\log_2 i\rfloor.
\]

Vậy (2) đúng với mọi $i\ge1$.

Giờ mỗi $d(i)$ có thể được tính độc lập, nên không còn cần mảng và bộ nhớ giảm xuống $\Theta(1)$. Ta có thể duyệt $i=1,2,\ldots,n$, đồng thời giữ lũy thừa của hai lớn nhất không vượt quá $i$, cập nhật nó khi $i$ đi qua $1,2,4,8,\ldots$. Thời gian là $\Theta(n)$. Tuy nhiên, lời giải ấy vẫn hơi chậm so với giới hạn thời gian của bài.

### Rút gọn tổng

Nếu cần tính riêng mọi giá trị $d(1),d(2),\ldots,d(n)$, ta không thể tránh ít nhất $n$ thao tác. Nhưng bài chỉ hỏi tổng của chúng, và tổng này có thể được tính nhanh hơn:

\[
\begin{aligned}
\sum_{i=1}^{n}d(i)
  &=\sum_{i=1}^{n}\left(i-2^{\lfloor\log_2 i\rfloor}\right)\\
  &=\frac{n(n+1)}2-\sum_{i=1}^{n}2^{\lfloor\log_2 i\rfloor}.
\end{aligned}
\]

Trong tổng cuối, mỗi lũy thừa \(2^j\) xuất hiện đúng \(2^j\) lần, ứng với

\[
i=2^j,2^j+1,\ldots,2^{j+1}-1,
\]

ngoại trừ lũy thừa lớn nhất $2^{\lfloor\log_2 n\rfloor}$, vì nhóm cuối có thể chưa đầy. Số phần tử thực sự của nhóm $j$ là

\[
\min\left(n-2^j+1,\ 2^j\right).
\]

Vì vậy, đáp án là

\[
\boxed{
\sum_{i=1}^{n}d(i)
=\frac{n(n+1)}2
-\sum_{j=0}^{\lfloor\log_2 n\rfloor}
2^j\min\left(n-2^j+1,\ 2^j\right)
}.
\]

Ta chỉ cần duyệt các lũy thừa

\[
1,2,4,8,\ldots,2^{\lfloor\log_2 n\rfloor}.
\]

Với $n=10^9$, toàn bộ công thức chỉ có 31 nhóm lũy thừa. Có thể cài đặt vòng lặp bằng một biến $p$, ban đầu $p=1$; ở mỗi bước trừ

\[
p\cdot\min(n-p+1,p)
\]

khỏi $n(n+1)/2$, rồi nhân đôi $p$, và dừng sau khi $p>n$. Mọi phép tính phải dùng số nguyên 64 bit.

Thuật toán cuối cùng có độ phức tạp

\[
\boxed{\Theta(\log n)\text{ thời gian và }\Theta(1)\text{ bộ nhớ}.}
\]
