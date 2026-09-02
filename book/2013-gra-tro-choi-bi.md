# Trò chơi bi ★★★★

**Tác giả đề:** Jakub Radoszewski  
**Tác giả lời giải:** Jakub Radoszewski  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `gra`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2013/gra>


## Đề bài

Bajtek và Bitek quyết định chơi bi. Trong một bình có một số chẵn viên bi. Mỗi viên mang đúng một chữ số. Luật chơi rất đơn giản: hai người luân phiên lấy ngẫu nhiên một viên bi ra khỏi bình. Trò chơi kết thúc khi bình hết bi. Người có tích các chữ số trên những viên bi mình nhận được lớn hơn sẽ thắng.

Hai cậu bé rất thích trò chơi này. Cả hai đều đầy tham vọng và thực sự thích chiến thắng, nên kết quả hòa không làm ai hài lòng. Bajtek và Bitek muốn tránh kết cục ấy bằng mọi giá. Hãy viết chương trình kiểm tra xem, với tập bi ban đầu cho trước trong bình, trò chơi **có thể** kết thúc hòa hay không.

### Dữ liệu vào

Dòng đầu chứa một số nguyên \(t\) \((1\le t\le1000)\), là số bộ dữ liệu cần xét.

Mỗi trong \(t\) dòng sau chứa mười số nguyên không âm \(k_0,\ldots,k_9\) \(0\le k_i\le10^{15}\), trong đó \(k_i\) là số viên bi mang chữ số \(i\). Trong mỗi bộ dữ liệu, tổng các số \(k_i\) là số chẵn dương.

### Dữ liệu ra

In \(t\) dòng, mỗi dòng là câu trả lời cho một bộ dữ liệu. Nếu trò chơi tương ứng có thể kết thúc hòa, in `TAK` (nghĩa là “có” trong tiếng Ba Lan); nếu không, in `NIE`.

### Ví dụ

**Dữ liệu vào**

```text
5
0 1 0 1 1 4 1 0 5 1
0 1 1 0 3 0 0 0 0 3
1 1 0 4 0 0 2 0 0 2
100000 100000 100000 100000 100000 100000 100000 100000 100000 100000
0 99999 99999 100000 100000 100000 100000 100000 100000 100000
```

**Dữ liệu ra**

```text
TAK
NIE
NIE
TAK
NIE
```

## Lời giải

Trước hết xét các chữ số \(0\), \(5\), \(7\). Chữ số \(0\) hiển nhiên là trường hợp đặc biệt. Nếu có ít nhất hai viên bi mang \(0\), đáp án chắc chắn là `TAK`: mỗi người nhận một viên \(0\), nên cả hai tích đều bằng \(0\). Nếu chỉ có đúng một viên \(0\), đáp án ngay lập tức là `NIE`. Từ đây, ta giả sử không có viên \(0\) nào.

Tiếp theo xét \(5\) và \(7\). Nếu số bi mang một trong hai chữ số này là lẻ, đáp án là `NIE`: để hai tích bằng nhau, số thừa số nguyên tố \(5\), tương ứng \(7\), phải được chia đều. Nếu cả hai số lượng đều chẵn, mọi bi mang \(5\) hoặc \(7\) bắt buộc phải được chia đều cho hai người; sau đó ta không cần quan tâm chúng nữa.

Mọi chữ số còn lại đều là tích của các lũy thừa của \(2\) và \(3\). Với

\[
i\in\{1,2,3,4,6,8,9\},
\]

gọi \(a_i\) là số bi chữ số \(i\) mà người chơi thứ nhất lấy, và \(b_i=k_i-a_i\) là số bi loại đó của người chơi thứ hai. Lời giải dựa trên giả thuyết tự nhiên sau, giúp thu hẹp đáng kể không gian tìm kiếm.

**Giả thuyết 1.** Nếu tồn tại một cách chia dẫn đến hòa, thì tồn tại một cách chia dẫn đến hòa sao cho với mọi \(i\),

\[
|a_i-b_i|\le6. \tag{1}
\]

Tạm chấp nhận giả thuyết này. Khi một chữ số \(i\) xuất hiện quá \(6\) lần, ta có thể bỏ đi hai viên bi mang \(i\). Lặp lại thao tác ấy, nhờ Giả thuyết 1 ta thu được một bài toán tương đương mà mỗi chữ số xuất hiện nhiều nhất \(6\) lần. Khi đó chỉ cần duyệt mọi cách chia thỏa (1), rồi kiểm tra ba điều kiện hòa:

\[
\begin{cases}
a_1+a_2+a_3+a_4+a_6+a_8+a_9=b_1+b_2+b_3+b_4+b_6+b_8+b_9,\\
a_2+2a_4+a_6+3a_8=b_2+2b_4+b_6+3b_8,\\
a_3+a_6+2a_9=b_3+b_6+2b_9.
\end{cases}
\]

Điều kiện đầu kiểm tra hai người nhận cùng số viên bi. Hai điều kiện sau kiểm tra số mũ của các thừa số nguyên tố \(2\) và \(3\) trong hai tích là bằng nhau.

Ta dùng quay lui (*backtracking*) để duyệt các cách chia thỏa (1). Với mỗi \(i\), có nhiều nhất \(7\) lựa chọn cho \(a_i\) (và khi đó \(b_i\) được xác định), do đó số khả năng nhiều nhất là

\[
7^7\approx800\,000.
\]

Có thể thêm một tối ưu đơn giản nhưng quan trọng: trước khi quay lui, kiểm tra xem tổng số mũ của \(2\) và của \(3\) trên toàn bộ bi có chẵn không. Cụ thể, nếu một trong hai số

\[
k_2+2k_4+k_6+3k_8,\qquad k_3+k_6+2k_9
\]

lẻ thì trả lời `NIE` ngay.

Phần còn lại chứng minh Giả thuyết 1, bằng một chứng minh có hỗ trợ máy tính.

## Chứng minh tính đúng đắn

Ta đổi cách mô tả một cách chia. Thay vì hai dãy \(a_i\), \(b_i\), dùng dãy số nguyên

\[
x_i=a_i-b_i.
\]

Ta gọi bộ dữ liệu

\[
(k_1,k_2,k_3,k_4,k_6,k_8,k_9)
\]

là một **cấu hình**; còn bộ

\[
(x_1,x_2,x_3,x_4,x_6,x_8,x_9)
\]

biểu diễn một cách chia tiềm năng là một **hệ**.

Một hệ là **hệ hòa** nếu

\[
\begin{cases}
x_1+x_2+x_3+x_4+x_6+x_8+x_9=0,\\
x_2+2x_4+x_6+3x_8=0,\\
x_3+x_6+2x_9=0.
\end{cases}
\]

Nói cấu hình \(k_i\) **chấp nhận** hệ \(x_i\) nếu, với mọi \(i\),

\[
|x_i|\le k_i\quad\text{và}\quad x_i\equiv k_i\pmod 2.
\]

Gọi một hệ là **bị chặn bởi 6** nếu \(|x_i|\le6\) với mọi \(i\). Toàn bộ chứng minh quy về mệnh đề sau.

**Định lý 1.** Với mọi cấu hình \(k_1,k_2,k_3,k_4,k_6,k_8,k_9\) có lời giải, tồn tại một hệ hòa bị chặn bởi \(6\), được cấu hình ấy chấp nhận.

Thật vậy, nếu định lý đúng, với một cấu hình có lời giải ta lấy

\[
a_i=\frac{k_i+x_i}{2},\qquad b_i=\frac{k_i-x_i}{2}.
\]

Đây là các số nguyên không âm và tạo nên một cách chia hòa thỏa (1). Khi ấy ta cũng gọi hệ \(x_i\) là một lời giải của cấu hình \(k_i\).

### Giảm về các cấu hình nhỏ

Định lý 1 ở dạng trên chưa thể kiểm chứng hữu hạn bằng máy tính. Ta sẽ giới hạn tập cấu hình cần xét.

Nói cấu hình \(k_i\) được **sinh bởi** cấu hình \(k'_i\) nếu:

- \(k_i\) chấp nhận \(k'_i\);
- \(k'_i\le6\) với mọi \(i\);
- hai cấu hình trùng nhau ở các thành phần nhỏ: nếu \(k_i\le4\) hoặc \(k'_i\le4\), thì \(k_i=k'_i\).

Vì sao có định nghĩa này? Bắt đầu từ \(k_i\), chừng nào có hơn \(6\) bi của một loại, bỏ hai bi loại đó. Cấu hình thu được là một \(k'_i\) sinh ra \(k_i\). Do đó:

**Quan sát 1.** Mọi cấu hình \(k_i\) đều được sinh bởi một cấu hình nào đó \(k'_i\).

Nếu cấu hình sinh có lời giải, lời giải đó hiển nhiên bị chặn bởi \(6\). Ta sẽ chỉ cần khảo sát các cấu hình bị chặn bởi \(6\). Mong muốn của ta là hai cấu hình có quan hệ sinh phải tương đương về việc có lời giải. Ta sẽ thiết lập điều này từng bước.

Gọi cấu hình \(k_i\) là **hiển nhiên không thể** nếu thỏa ít nhất một trong các điều kiện sau:

1. \(\sum_i k_i\) là lẻ.
2. Tổng số mũ của \(2\) hoặc của \(3\) trong toàn bộ bi là lẻ; tức một trong hai số
\[
k_2+2k_4+k_6+3k_8,\qquad k_3+k_6+2k_9
\]
là lẻ.
3. \(k_4\) lẻ và \(k_2=k_6=k_8=0\). Khi đó số mũ của \(2\) chỉ đến từ các viên \(4\), nên không thể chia đều.
4. \(k_9\) lẻ và \(k_3=k_6=0\). Khi đó số mũ của \(3\) chỉ đến từ các viên \(9\), nên không thể chia đều.
5. \(k_2+k_4+k_6=1\). Sau khi chia các viên \(8\), số mũ của \(2\) của cả hai người đều chia hết cho \(3\); vì vậy không thể phân đúng một viên bổ sung mang \(2\), \(4\) hoặc \(6\).

Rõ ràng một cấu hình hiển nhiên không thể thì không có lời giải.

**Bổ đề 1.** Giả sử \(k_i\) được sinh bởi \(k'_i\). Nếu \(k'_i\) có lời giải, thì lời giải đó cũng là lời giải cho \(k_i\). Nếu \(k'_i\) hiển nhiên không thể, thì \(k_i\) cũng hiển nhiên không thể.

**Chứng minh.** Nếu \(x_i\) là lời giải của \(k'_i\), thì nó là một hệ hòa được \(k'_i\) chấp nhận. Với mọi \(i\), ta có \(k_i\ge k'_i\) và \(k_i,k'_i\) cùng tính chẵn lẻ. Vì thế \(x_i\) cũng là hệ hòa được \(k_i\) chấp nhận.

Ngược lại, nếu \(k'_i\) thỏa một trong năm điều kiện trên thì \(k_i\) cũng thỏa điều kiện ấy. Với (1) và (2), điều này do các thành phần tương ứng cùng chẵn lẻ; với (3)–(5), còn dùng thêm việc hai cấu hình bằng nhau ở các thành phần nhỏ. \(\square\)

Như vậy, ta đã xác định được kết quả cho các cấu hình có lời giải và các cấu hình hiển nhiên không thể. Nếu mọi cấu hình đều thuộc một trong hai loại này thì chứng minh đã xong. Ta kiểm tra phần còn lại bằng chương trình.

### Kiểm chứng các cấu hình bị chặn bởi 6

Trước hết, sinh tất cả các hệ hòa bị chặn bởi \(6\). Có đúng \(4497\) hệ như vậy. Với mọi cấu hình bị chặn bởi \(6\), kiểm tra rằng nó hoặc hiển nhiên không thể, hoặc chấp nhận một trong các hệ đã sinh.

Ở bước thứ hai, ta chỉ cần xét cấu hình có chấp nhận một hệ hay không, nên dấu của các \(x_i\) không còn quan trọng. Vì vậy, thay từng thành phần của hệ bằng trị tuyệt đối rồi loại trùng, chỉ còn \(2216\) hệ khác nhau cần sử dụng. Điều này làm phép kiểm tra nhanh gần gấp đôi.

Khi chạy chương trình, vẫn xuất hiện vài trăm cấu hình khó: chúng không hiển nhiên không thể, nhưng không tìm được lời giải trong các hệ vừa liệt kê. Ta sẽ chứng minh mọi cấu hình được sinh bởi các cấu hình khó này cũng không có lời giải, bằng khử Gauss.

Cố định một cấu hình khó \(k'_i\). Giả sử ngược lại có một hệ hòa \(x_i\) được một cấu hình \(k_i\) sinh bởi \(k'_i\) chấp nhận. Các phương trình của hệ hòa luôn phải đúng. Ngoài ra, với mọi \(i\) mà \(k'_i\le4\), ta có

\[
x_i\in\{-k'_i,\ldots,k'_i\},\qquad x_i\equiv k'_i\pmod2.
\]

Ta duyệt mọi tổ hợp khả dĩ cho các \(x_i\) bị ràng buộc theo cách này, rồi giải hệ phương trình thực nhận được. Nếu mỗi hệ hoặc vô nghiệm, hoặc chỉ có một nghiệm mà một tọa độ không nguyên hay nguyên nhưng khác tính chẵn lẻ với \(k'_i\) tương ứng, thì không cấu hình nào được sinh bởi \(k'_i\) có lời giải.

#### Ví dụ về phép kiểm tra

Xét cấu hình khó

\[
(k'_1,k'_2,k'_3,k'_4,k'_6,k'_8,k'_9)=(0,6,1,0,1,5,3).
\]

Ta lập các hệ:

\[
\begin{cases}
x_1+x_2+x_3+x_4+x_6+x_8+x_9=0,\\
x_2+2x_4+x_6+3x_8=0,\\
x_3+x_6+2x_9=0,\\
x_1=0,\\
x_3=\pm1,\\
x_4=0,\\
x_6=\pm1,\\
x_9\in\{\pm1,\pm3\}.
\end{cases}
\]

Có tổng cộng \(2\cdot2\cdot4=16\) hệ cần xét. Hầu hết vô nghiệm. Từ phương trình thứ ba cùng các giới hạn của \(x_3,x_6,x_9\), một hệ chỉ có thể có nghiệm khi

\[
(x_3,x_6,x_9)=(1,1,-1)
\]

hoặc

\[
(x_3,x_6,x_9)=(-1,-1,1).
\]

Trong trường hợp đầu, hai phương trình đầu sau khi thế có dạng

\[
\begin{cases}
0+x_2+1+0+1+x_8-1=0,\\
x_2+2\cdot0+1+3x_8=0,
\end{cases}
\]

tức là

\[
\begin{cases}
x_2+x_8=-1,\\
x_2+3x_8=-1.
\end{cases}
\]

Nghiệm duy nhất là \(x_2=-1, x_8=0\). Nhưng nó không được cấu hình ban đầu chấp nhận, và cũng không được bất kỳ cấu hình nào sinh bởi nó chấp nhận: \(x_2\) khác tính chẵn lẻ với \(k'_2\), và \(x_8\) cũng khác tính chẵn lẻ với \(k'_8\).

Chương trình kiểm tra như vậy xử lý được mọi cấu hình khó, trừ đúng hai cấu hình “cứng đầu” sau:

\[
(k'_1,k'_2,k'_3,k'_4,k'_6,k'_8,k'_9)=(5,0,0,5,6,0,6),
\]

và

\[
(k'_1,k'_2,k'_3,k'_4,k'_6,k'_8,k'_9)=(5,0,0,6,6,0,5).
\]

Với mỗi cấu hình này, có một hệ phương trình có vô số nghiệm nên cách kiểm tra trên không kết luận được. Ta xử lý hai trường hợp cuối bằng tay; trường hợp thứ hai hoàn toàn tương tự trường hợp thứ nhất.

Trong mọi cấu hình được sinh bởi cấu hình thứ nhất, số bi mang \(4\) là lẻ, còn số bi mang \(6\) và \(9\) là chẵn. Giả sử một cấu hình như vậy có lời giải \(x_1,x_2,x_3,x_4,x_6,x_8,x_9\). Khi đó \(x_9\) chẵn, vì \(k'_9\) chẵn. Từ điều kiện về số mũ của \(3\), suy ra \(x_6\) phải chia hết cho \(4\). Khi đó, từ điều kiện về số mũ của \(2\), \(x_4\) phải chẵn. Điều này mâu thuẫn với việc \(k'_4\) lẻ, vì một hệ được chấp nhận phải có \(x_4\equiv k'_4\pmod2\).

Mâu thuẫn trên xử lý cả hai cấu hình còn lại (trường hợp thứ hai đối xứng tương tự), và hoàn tất chứng minh có hỗ trợ máy tính của Định lý 1. Do Định lý 1 kéo theo Giả thuyết 1, thuật toán đã nêu luôn trả lời đúng. \(\square\)

### Độ phức tạp

Sau các kiểm tra hằng số, phần quay lui xét nhiều nhất \(7^7\approx800\,000\) trạng thái cho mỗi bộ dữ liệu; mỗi trạng thái kiểm tra trong thời gian hằng số. Vì vậy thời gian là \(O(7^7\) cho một bộ dữ liệu (một hằng số độc lập với \(k_i\)), và bộ nhớ phụ là \(O(1)\), không kể ngăn xếp quay lui có độ sâu \(7\).
