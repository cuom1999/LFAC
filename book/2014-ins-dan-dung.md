# Dàn dựng ★★★★

**Tác giả đề:** Adam Karczmarz  
**Tác giả lời giải:** Adam Karczmarz  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `ins`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2014/ins>


## Đề bài

Steven Byteberg là một đạo diễn chuyên làm phim hành động. Hiện ông đang thực hiện một bộ phim mới về cuộc chiến giữa các băng đảng mafia Byteonia. Byteberg vẫn đang cân nhắc diễn biến cuối cùng của trường đoạn cao trào — một màn đấu súng ngoạn mục.

Có $n$ tên gangster tham gia cảnh quay, được đánh số từ $1$ đến $n$. Khi căng thẳng lên đến đỉnh điểm, mỗi tên rút súng và ngắm vào một tên khác. Không có hai tên nào cùng ngắm vào một người. Đám gangster tuy nghèo nhưng được huấn luyện bài bản: mỗi tên chỉ có thể bắn một phát, song phát đạn ấy luôn chính xác và chí mạng.

Đến một lúc nào đó, một tên không thể chịu nổi sức ép nữa và cuộc đấu súng bắt đầu.

Đạo diễn đã quy định thứ tự ban đầu mà các gangster phải bóp cò. Cụ thể, gangster $i$ bắn gangster $p_i$ đúng vào thời điểm $t_i$, trừ khi đến lúc đó gangster $i$ đã bị giết. Một gangster chết đúng vào thời điểm có người bắn về phía hắn.

Đạo diễn muốn biết cuối cảnh còn bao nhiêu gangster sống sót. Tuy nhiên, Byteberg vẫn chưa hoàn toàn chắc chắn về thứ tự nổ súng. Thỉnh thoảng ông yêu cầu thay đổi một giá trị $t_i$. Sau mỗi thay đổi, ông muốn biết số gangster sẽ sống sót theo lịch bắn mới, có tính đến tất cả những thay đổi trước đó.

### Dữ liệu vào

Dòng đầu chứa một số nguyên $n$

\[
2\le n\le 200\,000,
\]

là số gangster tham gia cảnh quay.

Dòng thứ hai chứa $n$ số nguyên

\[
p_1,p_2,\ldots,p_n
\]

thỏa mãn

\[
1\le p_i\le n,\qquad p_i\ne i,
\]

và $p_i\ne p_j$ với mọi $i\ne j$. Giá trị $p_i$ cho biết gangster $i$ định bắn ai.

Dòng thứ ba chứa $n$ số nguyên

\[
u_1,u_2,\ldots,u_n,
\qquad 1\le u_i\le 10^9,
\]

mô tả lịch bắn ban đầu: lúc đầu $t_i=u_i$.

Dòng thứ tư chứa một số nguyên $q$

\[
0\le q\le 200\,000,
\]

là số lần thay đổi các giá trị $t_1,\ldots,t_n$. Mỗi dòng trong $q$ dòng tiếp theo chứa hai số nguyên $k_i,v_i$

\[
1\le k_i\le n,\qquad 1\le v_i\le 10^9,
\]

cho biết thay đổi thứ $i$ đặt $t_{k_i}=v_i$.

Tất cả các số

\[
u_1,u_2,\ldots,u_n,v_1,v_2,\ldots,v_q
\]

đôi một khác nhau.

### Dữ liệu ra

In đúng $q+1$ dòng. Dòng đầu chứa số gangster sống sót với lịch bắn ban đầu. Dòng thứ $i$ trong $q$ dòng tiếp theo chứa số gangster sống sót khi lịch bắn được xác định bởi $t_1,\ldots,t_n$ sau khi thực hiện tất cả các thay đổi từ $1$ đến $i$.

### Ví dụ

**Dữ liệu vào**

```text
4
2 3 4 1
1 2 3 4
3
1 8
2 7
3 6
```

**Dữ liệu ra**

```text
2
2
1
1
```

## Lời giải

Trước hết, ta phân tích cách các gangster ngắm bắn nhau. Không có hai gangster nào cùng ngắm vào một người, trong khi mỗi gangster ngắm đúng một đối thủ. Do đó, mỗi gangster cũng là mục tiêu của đúng một gangster khác. Nói cách khác, ánh xạ $i\mapsto p_i$ là một hoán vị.

Vì $p_i\ne i$, hoán vị này phân rã thành một số chu trình, mỗi chu trình có độ dài ít nhất $2$. Cụ thể, với mọi $i\in\{1,\ldots,n\}$, tồn tại $m\ge2$ gangster phân biệt $g_1,\ldots,g_m$ sao cho:

- $g_1=i$;

- với mọi $j\in\{1,\ldots,m-1\}$, gangster $g_j$ ngắm vào $g_{j+1}$;

- gangster $g_m$ ngắm vào $g_1$.

Không có phát súng nào đi từ chu trình này sang chu trình khác. Vì vậy, một lần đổi lịch bắn chỉ có thể làm thay đổi kết quả trong đúng một chu trình. Ta có thể xử lý riêng từng chu trình rồi cộng số người sống sót của chúng. Việc phân rã hoán vị thành các chu trình mất $O(n)$ thời gian.

### Một chu trình với lịch bắn cố định

Xét một chu trình gồm $m\ge2$ gangster. Để đơn giản, đánh số lại họ theo thứ tự trên chu trình: gangster $1$ ngắm gangster $2$, gangster $2$ ngắm gangster $3$, v.v., còn gangster $m$ ngắm gangster $1$. Khi thuận tiện, ta viết gangster $0$ để chỉ gangster $m$. Thời điểm gangster $i$ dự kiến bắn là $t_i$.

Đếm số phát súng dễ hơn đếm trực tiếp số người sống sót. Mỗi phát súng thực sự được bắn ra đều hạ một mục tiêu, và các mục tiêu là khác nhau. Do đó, nếu có $s$ phát súng thì chính xác $m-s$ gangster sống sót.

Ta gọi gangster $i$ là một **người chắc chắn bắn** nếu

\[
t_i<t_{i-1},
\]

tức hắn dự kiến bóp cò trước người đang ngắm vào mình. Một người chắc chắn bắn sẽ kịp bắn bất kể sau đó bản thân có bị giết hay không.

Vì các thời điểm $t_i$ đôi một khác nhau, mỗi chu trình có ít nhất một người chắc chắn bắn: đó là gangster có thời điểm bắn sớm nhất.

Chọn một người chắc chắn bắn $i$, rồi đi dọc chu trình theo hướng các phát súng cho tới người chắc chắn bắn kế tiếp $j$. Nếu cả chu trình chỉ có một người chắc chắn bắn thì $j=i$. Gọi

\[
i=w_1,w_2,\ldots,w_p
\]

là các gangster gặp trên đường từ $i$ đến ngay trước $j$. Vì $w_2,\ldots,w_p$ không phải người chắc chắn bắn nên

\[
t_{w_1}<t_{w_2}<\cdots<t_{w_p}.
\]

Gangster $w_1$ bắn và giết $w_2$ trước khi $w_2$ kịp bóp cò. Vì $w_2$ không bắn, $w_3$ sống đủ lâu để bắn; phát súng của $w_3$ lại giết $w_4$ trước lượt của $w_4$, và cứ thế tiếp tục. Chính xác những gangster $w_\ell$ có chỉ số $\ell$ lẻ sẽ bắn.

Vì vậy, đoạn này đóng góp

\[
d_i=\left\lfloor\frac{p+1}{2}\right\rfloor
=\left\lceil\frac p2\right\rceil
\]

phát súng. Các đoạn bắt đầu tại những người chắc chắn bắn tạo thành một phân hoạch của chu trình. Tổng số phát súng trong chu trình do đó bằng tổng các giá trị $d_i$ của mọi người chắc chắn bắn.

### Hỗ trợ các thay đổi

Kết quả trên dẫn thẳng đến thuật toán động. Với mỗi chu trình, ta duy trì tập có thứ tự gồm các người chắc chắn bắn, để có thể nhanh chóng tìm người chắc chắn bắn đứng trước và đứng sau một vị trí theo thứ tự vòng tròn. Đồng thời, ta duy trì tổng các đóng góp $d_i$; tổng này chính là số phát súng của chu trình.

Khi thay đổi $t_i$, chỉ hai bất đẳng thức có thể đổi giá trị đúng/sai:

\[
t_i<t_{i-1}
\qquad\text{và}\qquad
t_{i+1}<t_i.
\]

Do đó, chỉ gangster $i$ và người kế tiếp $i+1$ trên chu trình có thể nhận hoặc mất trạng thái người chắc chắn bắn. Ngoài ra, độ dài đoạn — và vì thế giá trị $d_s$ — của người chắc chắn bắn $s$ đứng ngay trước $i$ cũng có thể thay đổi. Như vậy, mỗi lần cập nhật chỉ tác động đến một số hằng số phần tử và một số hằng số giá trị đóng góp.

Có thể nhìn thao tác cục bộ cụ thể như sau:

- Khi chèn một người chắc chắn bắn $x$ nằm giữa hai người chắc chắn bắn liên tiếp $a$ và $b$, đoạn từ $a$ đến trước $b$ bị tách thành hai đoạn. Ta bỏ đóng góp cũ của $a$, rồi thêm đóng góp mới của $a$ và $x$.

- Khi xóa $x$, hai đoạn bắt đầu tại $a$ và $x$ được gộp lại. Ta bỏ hai đóng góp cũ rồi thêm đóng góp mới của $a$.

Khoảng cách dùng trong công thức $d=\lceil p/2\rceil$ là số đỉnh từ đầu đoạn đến ngay trước người chắc chắn bắn kế tiếp, tính theo vòng tròn. Có thể lưu vị trí của mỗi gangster trong chu trình để tính khoảng cách này trong $O(1)$.

Sau khi cập nhật tổng số phát súng, số người sống sót trên toàn bộ các chu trình là

\[
n-\text{(tổng số phát súng)}.
\]

### Cài đặt

Tập người chắc chắn bắn của mỗi chu trình được lưu bằng một cây tìm kiếm nhị phân cân bằng, chẳng hạn `set` trong thư viện chuẩn C++. Chèn, xóa, cũng như tìm phần tử liền trước hoặc liền sau đều mất $O(\log n)$ thời gian. Khi đi qua đầu hoặc cuối `set`, ta quay vòng sang phần tử cuối hoặc đầu để phản ánh thứ tự chu trình.

Ban đầu, ta phân rã hoán vị và đánh số vị trí trong từng chu trình. Sau đó, ta liệt kê những người chắc chắn bắn theo thứ tự trên mỗi chu trình, dùng dãy đã sắp thứ tự ấy để khởi tạo cấu trúc, rồi tính các đóng góp. Toàn bộ bước khởi tạo mất $O(n)$ thời gian.

Mỗi thay đổi chỉ cần kiểm tra lại trạng thái của $i$ và người kế tiếp, thực hiện một số hằng số thao tác trên cây cân bằng, rồi cập nhật tổng số phát súng. Vì thế, tổng độ phức tạp là

\[
O(n+q\log n),
\]

với $q$ là số lần thay đổi. Bộ nhớ sử dụng là

\[
O(n).
\]
