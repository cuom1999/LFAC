# Nóng lên toàn cầu ★★★

**Tác giả đề:** Jacek Tomasiewicz, Tomasz Idziaszek  
**Tác giả lời giải:** Tomasz Idziaszek  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `glo`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2014/glo>


## Đề bài

Giáo sư Byteoni đang chuẩn bị một báo cáo cho Ủy ban Liên Byteotia về Biến đổi Khí hậu. Báo cáo phải chỉ ra một cách rõ ràng, dứt khoát và không còn chút nghi ngờ nào về tác động của người dân Byteotia đối với biến đổi khí hậu trong khu vực. Tuy giáo sư có khá nhiều dữ liệu thực nghiệm, chỉ những lập luận có cơ sở thôi vẫn chưa đủ để thâm nhập vào truyền thông đại chúng; trình bày dữ liệu sao cho thật rõ ràng và đúng trọng tâm cũng quan trọng không kém. Vì vậy, ông muốn cân nhắc kỹ để lựa chọn dữ liệu đưa lên biểu đồ chính của báo cáo.

Biểu đồ chủ chốt sẽ thể hiện nhiệt độ không khí trung bình qua các năm. Giáo sư có số liệu nhiệt độ trung bình hằng năm của \(n\) năm gần đây. Ông muốn chú thích biểu đồ bằng một câu đại loại như: “nhiệt độ thấp nhất vào năm \(r_{\min}\), còn nhiệt độ cao nhất vào năm \(r_{\max}\), do đó có thể thấy rõ rằng…”. Đáng tiếc, ông lo rằng cùng một nhiệt độ nhỏ nhất hoặc lớn nhất có thể xuất hiện nhiều lần trong giai đoạn ấy, làm cho phát biểu trên kém thuyết phục.

Do đó, giáo sư quyết định chỉ trình bày một phần dữ liệu. Ông muốn chọn một khoảng năm sao cho trong khoảng đó có **đúng một** năm đạt nhiệt độ nhỏ nhất của khoảng và **đúng một** năm đạt nhiệt độ lớn nhất của khoảng. Khoảng được chọn không nhất thiết phải chứa năm có nhiệt độ trung bình nhỏ nhất hay lớn nhất trên toàn bộ \(n\) năm; thậm chí có thể không chứa cả hai. Dĩ nhiên, giáo sư muốn đưa lên biểu đồ càng nhiều dữ liệu càng tốt, nên ông quan tâm đến khoảng năm dài nhất.

### Dữ liệu vào

Dòng đầu chứa một số nguyên \(n\)

\[
1\le n\le 500\,000,
\]

là số năm mà giáo sư có dữ liệu nhiệt độ trung bình.

Dòng thứ hai chứa \(n\) số nguyên

\[
t_1,t_2,\ldots,t_n,
\qquad -10^9\le t_i\le 10^9.
\]

Số \(t_i\) là nhiệt độ trung bình trong năm thứ \(i\).

### Dữ liệu ra

In ra hai số nguyên \(l\) và \(k\). Chúng có nghĩa là khoảng dài nhất thỏa mãn điều kiện của giáo sư có độ dài \(l\) năm, và \(k\) là năm sớm nhất mà một khoảng dài như vậy có thể bắt đầu.

### Ví dụ

**Dữ liệu vào**

```text
10
8 3 2 5 2 3 4 6 3 6
```

**Dữ liệu ra**

```text
6 4
```

**Giải thích.** Biểu đồ sẽ trình bày các nhiệt độ

\[
5,2,3,4,6,3.
\]

Trong khoảng này, nhiệt độ nhỏ nhất \(2\) xuất hiện đúng một lần và nhiệt độ lớn nhất \(6\) cũng xuất hiện đúng một lần.

## Lời giải

Cho dãy \(t_1,\ldots,t_n\). Ta cần tìm dãy con liên tiếp dài nhất mà trong đó cả phần tử nhỏ nhất lẫn phần tử lớn nhất đều xuất hiện đúng một lần. Vì mỗi dãy con liên tiếp được xác định bởi một khoảng chỉ số, từ đây ta sẽ nói về việc tìm một khoảng như vậy.

### Cố định vị trí của cực tiểu duy nhất

Cố định một vị trí \(i\), và xét khoảng dài nhất \(T_i\) chứa \(t_i\) với \(t_i\) là cực tiểu duy nhất của khoảng.

Xét tất cả các vị trí có giá trị không lớn hơn \(t_i\). Ngoại trừ chính \(i\), không vị trí nào trong số đó có thể thuộc \(T_i\). Gọi:

- \(l_{i,1}\) là vị trí lớn nhất nhỏ hơn \(i\) sao cho \(t_{l_{i,1}}\le t_i\);
- \(r_{i,1}\) là vị trí nhỏ nhất lớn hơn \(i\) sao cho \(t_{r_{i,1}}\le t_i\).

Để hai vị trí này luôn tồn tại, đặt hai phần tử lính canh

\[
t_0=t_{n+1}=-\infty.
\]

Khi đó \(T_i\) phải nằm hoàn toàn trong khoảng mở

\[
(l_{i,1},r_{i,1}).
\]

Nếu khoảng này chỉ chứa vị trí \(i\), hiển nhiên \(T_i=[i,i]\). Trong phần còn lại, giả sử nó chứa ít nhất hai vị trí; khi ấy \(T_i\) cũng có ít nhất hai phần tử.

Gọi \(m_i\) là giá trị lớn nhất trong khoảng \(l_{i,1},r_{i,1}\). Ta có thể giả sử \(T_i\) chứa đúng một lần xuất hiện của \(m_i\). Thật vậy, nếu một khoảng hợp lệ — có cực tiểu duy nhất tại \(i\) và cực đại duy nhất — chưa chứa đúng một \(m_i\), ta luôn có thể kéo dài nó mà vẫn giữ nguyên tính hợp lệ cho đến khi nó chứa một lần xuất hiện của \(m_i\).

Các điều kiện vừa nêu cũng đã đủ để bảo đảm trong \(T_i\) có đúng một cực tiểu và một cực đại. Vì thế, \(T_i\) chính là khoảng dài nhất thỏa cả ba điều kiện:

- chứa vị trí \(i\);
- nằm trong khoảng mở \(l_{i,1},r_{i,1}\);
- chứa đúng một lần xuất hiện của \(m_i\).

Để dựng \(T_i\), ta xét hai khả năng: lần xuất hiện của \(m_i\) được giữ lại nằm bên trái hoặc bên phải \(i\). Với mỗi khả năng, bắt đầu từ đoạn nối vị trí ấy với \(i\), rồi mở rộng tối đa về cả hai phía. Việc mở rộng chỉ dừng ở biên của \(l_{i,1},r_{i,1}\), hoặc ngay trước một lần xuất hiện khác của \(m_i\). Hai khả năng này tạo ra hai ứng viên cho \(T_i\).

### Sáu vị trí biên

Gọi \(l_{i,2}\) và \(l_{i,3}\), với

\[
l_{i,3}<l_{i,2},
\]

là hai vị trí ngoài cùng bên phải trong \(l_{i,1},i\) có giá trị bằng \(m_i\). Nếu phía trái chỉ có một lần xuất hiện của \(m_i\), đặt \(l_{i,3}=l_{i,1}\). Nếu phía trái không có lần nào, đặt cả

\[
l_{i,2}=l_{i,3}=l_{i,1}.
\]

Định nghĩa đối xứng \(r_{i,2}\) và \(r_{i,3}\), với

\[
r_{i,2}\le r_{i,3},
\]

là hai vị trí ngoài cùng bên trái trong \(i,r_{i,1}\) có giá trị bằng \(m_i\). Các vị trí không tồn tại được thay bằng \(r_{i,1}\) theo quy ước tương tự.

![Hình 1. Vị trí i, sáu vị trí biên l i 1, l i 2, l i 3, r i 2, r i 3, r i 1 và hai khoảng ứng viên cho T i. Mỗi phần tử của dãy được biểu diễn bằng một chấm; độ cao của chấm biểu thị giá trị phần tử.](figures/2014-glo-fig-1.png)

Vì \(T_i\) phải chứa \(i\) và đúng một lần xuất hiện của \(m_i\), hai ứng viên duy nhất là hai khoảng mở

\[
(l_{i,3},r_{i,2})
\qquad\text{và}\qquad
(l_{i,2},r_{i,3}).
\]

Nói theo chỉ số đóng, chúng lần lượt là

\[
[l_{i,3}+1,r_{i,2}-1]
\qquad\text{và}\qquad
[l_{i,2}+1,r_{i,3}-1].
\]

Ứng viên thứ nhất giữ lại lần xuất hiện \(m_i\) tại \(l_{i,2}\), còn ứng viên thứ hai giữ lại lần xuất hiện tại \(r_{i,2}\). Ta chọn ứng viên dài hơn làm \(T_i\); nếu bằng nhau, chọn ứng viên bắt đầu sớm hơn.

## Cài đặt

### Tìm \(l_{i,1}\) và \(r_{i,1}\)

Ta có thể tính tất cả \(l_{i,1}\) trong tổng thời gian \(O(n)\) bằng một ngăn xếp đơn điệu.

Ta nói vị trí \(j\) **nhìn thấy được từ bên trái** tại vị trí \(i\) nếu

\[
j<i,\qquad t_j\le t_i,
\]

và mọi phần tử nằm giữa \(j\) và \(i\) đều không nhỏ hơn \(t_j\). Theo định nghĩa này, \(l_{i,1}\) chính là vị trí lớn nhất nhìn thấy được từ bên trái tại \(i\).

Duyệt dãy từ trái sang phải. Sau khi xử lý \(t_0,\ldots,t_i\), ngăn xếp chứa vị trí \(i\) cùng tất cả các vị trí nhìn thấy được từ bên trái tại \(i\), theo thứ tự tăng dần; vị trí lớn nhất nằm trên đỉnh.

Khi chuẩn bị xử lý \(t_i\), loại khỏi đỉnh ngăn xếp mọi vị trí có giá trị lớn hơn \(t_i\). Những vị trí ấy không thể là \(l_{i,1}\). Hơn nữa, chúng cũng không thể là \(l_{j,1}\) của bất kỳ \(j>i\), bởi khi đó vị trí \(i\) luôn là một ứng viên gần hơn và tốt hơn. Sau khi loại xong, đỉnh ngăn xếp chính là \(l_{i,1}\); cuối cùng đẩy \(i\) vào ngăn xếp.

Ta tính \(r_{i,1}\) hoàn toàn đối xứng bằng cách duyệt từ phải sang trái.

### Tìm bốn vị trí của cực đại

Một cách trực tiếp là dùng cây đoạn hỗ trợ truy vấn vị trí ngoài cùng của giá trị lớn nhất trên một khoảng. Nhờ đó có thể tìm \(l_{i,2},l_{i,3}\) và, bằng một cây đối xứng, \(r_{i,2},r_{i,3}\). Cách này cho thuật toán \(O(n\log n)\).

Ta có thể làm đơn giản hơn và đạt tổng thời gian \(O(n)\) bằng cách bổ sung thông tin cho ngăn xếp đơn điệu.

Giả sử ngăn xếp hiện chứa

\[
a_0=0,a_1,\ldots,a_s=i,
\]

là các vị trí nhìn thấy được từ bên trái tại \(i\). Kèm theo mỗi \(a_j\), lưu một bản tóm tắt \(A_j\) của các vị trí đạt giá trị lớn nhất trong phần dãy nằm giữa \(a_{j-1}\) và \(a_j\). Ta không cần lưu toàn bộ tập: chỉ cần

- giá trị lớn nhất trong phần ấy;
- hai vị trí ngoài cùng bên phải đạt giá trị lớn nhất đó.

Khi loại \(a_j\) khỏi ngăn xếp, phần dãy do \(A_j\) đại diện được nhập vào phần kế bên. Vì vậy, cập nhật \(A_{j-1}\) bằng cách xét thông tin đang có của \(A_{j-1}\), chính vị trí \(a_j\), và thông tin của \(A_j\). Giữ lại giá trị lớn nhất trong ba nguồn cùng hai vị trí ngoài cùng bên phải đạt giá trị ấy. Mỗi lần nhập như vậy chỉ tốn \(O(1)\).

Sau khi đã loại mọi phần tử lớn hơn \(t_i\), bản tóm tắt ở đỉnh cho ta hai vị trí ngoài cùng bên phải đạt cực đại trong \(l_{i,1},i\), tức \(l_{i,2}\) và \(l_{i,3}\). Vì mỗi vị trí chỉ được đẩy vào và loại khỏi ngăn xếp nhiều nhất một lần, toàn bộ lượt duyệt tốn \(O(n)\).

Duyệt đối xứng từ phải sang trái, đồng thời lưu hai vị trí ngoài cùng bên trái, ta thu được \(r_{i,2}\) và \(r_{i,3}\), cũng trong \(O(n)\).

### Hiệu chỉnh hai phía

Các cặp bên trái và bên phải được tính độc lập, nên giá trị cực đại tìm được ở hai phía có thể khác nhau. Chỉ cặp ứng với giá trị lớn hơn mới thực sự biểu diễn \(m_i\):

- nếu cực đại bên trái nhỏ hơn cực đại bên phải, thay \(l_{i,2}\) và \(l_{i,3}\) bằng \(l_{i,1}\);
- nếu cực đại bên phải nhỏ hơn cực đại bên trái, thay \(r_{i,2}\) và \(r_{i,3}\) bằng \(r_{i,1}\);
- nếu hai cực đại bằng nhau, giữ nguyên cả hai cặp.

Nếu \(l_{i,1},r_{i,1}\) chỉ chứa \(i\), xử lý riêng khoảng một phần tử \([i,i]\).

### Thuật toán hoàn chỉnh

1. Tính \(l_{i,j}\) và \(r_{i,j}\) cho mọi \(i\) và mọi \(j\in\{1,2,3\}\) bằng hai lượt quét với ngăn xếp tăng cường.
2. Với mỗi \(i\), hiệu chỉnh cặp vị trí ở phía không đạt \(m_i\).
3. Xét hai ứng viên

\[
[l_{i,3}+1,r_{i,2}-1]
\quad\text{và}\quad
[l_{i,2}+1,r_{i,3}-1].
\]

4. Trong mọi ứng viên của mọi \(i\), chọn khoảng dài nhất; nếu có nhiều khoảng cùng độ dài, chọn khoảng có đầu trái nhỏ nhất.
5. Nếu khoảng được chọn là \([L,R]\), in

\[
R-L+1
\qquad\text{và}\qquad
L.
\]

Mọi khoảng hợp lệ có một cực tiểu duy nhất tại vị trí nào đó \(i\), nên nó được xét khi xử lý \(T_i\). Ngược lại, hai ứng viên dựng cho mỗi \(i\) đều nằm giữa hai phần tử không lớn hơn gần nhất, vì thế \(t_i\) là cực tiểu duy nhất; chúng đồng thời chứa đúng một \(m_i\), nên cũng có cực đại duy nhất. Do đó thuật toán không bỏ sót đáp án và không tạo ra ứng viên sai.

### Độ phức tạp

Mỗi phần tử được đẩy vào và lấy khỏi mỗi ngăn xếp nhiều nhất một lần, còn mọi cập nhật tóm tắt đều tốn thời gian hằng số. Vì vậy, độ phức tạp là

\[
O(n)
\]

thời gian và

\[
O(n)
\]

bộ nhớ.
