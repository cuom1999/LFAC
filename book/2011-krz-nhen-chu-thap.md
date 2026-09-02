# Nhện chữ thập ★★

**Tác giả đề:** Szymon Acedański  
**Tác giả lời giải:** Tomasz Idziaszek  
**Bộ nhớ:** 32 MB  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2011/krz>


## Đề bài

Loài nhện chữ thập Bytean (*Araneida baitoida*) có một khả năng đáng kinh ngạc: nó có thể tức thời giăng một mạng nhện lớn tùy ý, miễn là toàn bộ các sợi tơ của mạng nằm trong cùng một mặt phẳng. Nhờ đó, nó không cần chờ ruồi mắc vào chiếc mạng đã có sẵn: chỉ cần biết vị trí hiện tại của một con ruồi, nó có thể lập tức giăng mạng để bắt con ruồi ấy.

Một con nhện chữ thập vừa phát hiện \(n\) con ruồi trong khu vườn của Byteasar. Mỗi con đang đứng yên tại một điểm trong không gian ba chiều. Nhện muốn biết liệu có thể bắt tất cả chúng bằng **một** mạng nhện hay không. Hãy viết chương trình trả lời câu hỏi đó.

### Dữ liệu vào

Dòng đầu chứa số nguyên \(n\) (\(1\le n\le100\,000\)).

\(n\) dòng tiếp theo mô tả các con ruồi trong không gian: dòng thứ \(i\) chứa ba số nguyên \(x_i,y_i,z_i\) (\(-1\,000\,000\le x_i,y_i,z_i\le1\,000\,000\)), là tọa độ của con ruồi thứ \(i\) trong không gian Euclid ba chiều. Không có hai con ruồi nào ở cùng một vị trí.

### Dữ liệu ra

In một từ duy nhất `TAK` (nghĩa là “có” trong tiếng Ba Lan) nếu nhện có thể bắt tất cả ruồi bằng một mạng nhện. Nếu không, in `NIE` (nghĩa là “không”).

### Ví dụ

```text
Input
4
0 0 0
-1 0 -100
100 0 231
5 0 15

Output
TAK
```

Trong khi đó, với dữ liệu vào

```text
4
0 1 0
-1 0 -100
100 0 231
5 0 15
```

kết quả đúng là

```text
NIE
```

## Lời giải

Bài toán yêu cầu kiểm tra xem \(n\) điểm trong không gian ba chiều có cùng nằm trên một mặt phẳng hay không. Ký hiệu điểm thứ \(i\) là

\[
p_i=(x_i,y_i,z_i).
\]

Ba điểm không thẳng hàng xác định duy nhất một mặt phẳng. Do đó, ta thực hiện hai bước:

1. Tìm ba điểm không thẳng hàng, nếu tồn tại.
2. Kiểm tra mọi điểm còn lại có thuộc mặt phẳng do ba điểm ấy xác định hay không.

Nếu \(n\le3\), đáp án hiển nhiên luôn là `TAK`. Sau đây xét \(n\ge4\).

### Tìm ba điểm không thẳng hàng

Không thể tùy tiện chọn \(p_1,p_2,p_3\), vì có thể chúng thẳng hàng. Chọn \(p_1,p_2\), rồi duyệt các điểm \(p_i\), \(i=3,\ldots,n\), để tìm một điểm không nằm trên đường thẳng qua \(p_1,p_2\).

Đặt

\[
t_i=(p_2-p_1)\times(p_i-p_1),
\]

trong đó \(\times\) là tích có hướng. Với hai vector

\[
v=(x_v,y_v,z_v),\qquad w=(x_w,y_w,z_w),
\]

ta có

\[
v\times w=(y_vz_w-y_wz_v,\;z_vx_w-z_wx_v,\;x_vy_w-y_vx_w).
\]

Điểm \(p_i\) nằm trên đường thẳng qua \(p_1,p_2\) khi và chỉ khi cả ba tọa độ của \(t_i\) đều bằng \(0\).

Nếu mọi \(t_i\) đều bằng vector không, toàn bộ các điểm cùng nằm trên một đường thẳng; đường thẳng ấy nằm trong một mặt phẳng nào đó, nên in `TAK`.

Ngược lại, với một \(i\) sao cho \(t_i\ne0\), ba điểm \(p_1,p_2,p_i\) không thẳng hàng và xác định một mặt phẳng. Vector \(t_i\) là vector pháp tuyến của mặt phẳng này.

### Kiểm tra các điểm còn lại

Một điểm \(p_j\) thuộc mặt phẳng vừa tìm khi và chỉ khi vector \(p_j-p_1\) vuông góc với pháp tuyến \(t_i\). Ta kiểm tra điều đó bằng tích vô hướng. Với

\[
v=(x_v,y_v,z_v),\qquad w=(x_w,y_w,z_w),
\]

định nghĩa

\[
v\cdot w=x_vx_w+y_vy_w+z_vz_w.
\]

Hai vector khác không vuông góc khi và chỉ khi tích vô hướng của chúng bằng \(0\). Vì vậy, với mỗi điểm \(p_j\), chỉ cần kiểm tra

\[
t_i\cdot(p_j-p_1)=0.
\]

Nếu có một điểm không thỏa mãn, in `NIE`; nếu tất cả đều thỏa mãn, in `TAK`. Có thể tổ chức việc duyệt sao cho mỗi điểm chỉ được kiểm tra một lần.

### Tính đúng đắn

Nếu thuật toán in `TAK` ngay sau bước đầu, mọi điểm cùng thẳng hàng với \(p_1,p_2\), nên chúng đồng phẳng. Nếu thuật toán chọn được \(p_i\), thì \(p_1,p_2,p_i\) không thẳng hàng, vì tích có hướng tương ứng khác \(0\); do đó chúng xác định duy nhất một mặt phẳng có pháp tuyến \(t_i\). Tích vô hướng bằng \(0\) chính xác khi vector từ \(p_1\) đến điểm đang xét vuông góc với pháp tuyến, tức điểm đó thuộc mặt phẳng này. Vì vậy thuật toán in `TAK` đúng khi và chỉ khi toàn bộ ruồi đồng phẳng.

### Độ phức tạp

Mỗi điểm được xử lý số lần hằng số. Thời gian chạy là \(O(n)\), và ngoài dữ liệu đầu vào thuật toán chỉ dùng \(O(1)\) bộ nhớ.

## Lưu ý về kiểu dữ liệu

Nên dùng số nguyên thay vì số thực để tránh sai số dấu phẩy động: tọa độ đầu vào là số nguyên và thuật toán chỉ dùng cộng, trừ, nhân.

Mỗi hiệu tọa độ có trị tuyệt đối không quá \(2\cdot10^6\). Khi khai triển tích vô hướng ở trên, mỗi hạng là tích của ba hiệu tọa độ, nên trị tuyệt đối không vượt quá

\[
(2\cdot10^6)^3=8\cdot10^{18}.
\]

Một biến nguyên có dấu 64 bit vừa đủ chứa từng hạng, nhưng tổng sáu hạng có thể đạt \(48\cdot10^{18}\), vượt miền biểu diễn 64 bit có dấu. Có ba cách xử lý:

1. Dùng số nguyên 128 bit nếu trình biên dịch hỗ trợ, chẳng hạn `__int128` của GCC.
2. Tự cài kiểu số nguyên đủ lớn; ở đây chỉ cần cộng và so sánh với \(0\).
3. Tính tổng hai lần, theo modulo \(m_1\) và \(m_2\), trong đó \(m_1,m_2\) nguyên tố cùng nhau và \(m_1m_2>48\cdot10^{18}\). Theo định lý phần dư Trung Hoa, cả hai kết quả bằng \(0\) khi và chỉ khi tổng thực sự bằng \(0\).
